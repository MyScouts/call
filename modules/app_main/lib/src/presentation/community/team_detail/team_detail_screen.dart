import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/community/community_coordinator.dart';
import 'package:app_main/src/presentation/community/team_detail/pages/update_team_options_screen.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:ui/ui.dart';

import '../community_constants.dart';
import '../widgets/team_member_widget.dart';
import 'bloc/team_detail_bloc.dart';

class TeamDetailScreen extends StatefulWidget {
  static const String routeName = '/team';

  const TeamDetailScreen({
    super.key,
    required this.id,
    this.name,
    this.bossGroupId,
  });

  final String id;
  final String? name;
  final int? bossGroupId;

  @override
  State<TeamDetailScreen> createState() => _TeamDetailScreenState();
}

class _TeamDetailScreenState extends State<TeamDetailScreen>
    with TickerProviderStateMixin {
  TeamDetailBloc get teamDetailBloc => context.read();

  final myId = injector.get<UserCubit>().currentUser?.id;

  @override
  void initState() {
    super.initState();
    teamDetailBloc.add(FetchTeamDetailEvent(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<TeamDetailBloc, TeamDetailState>(
        listener: _onTeamDetailBlocListen,
        buildWhen: (prev, current) =>
            current is FetchTeamDetailSuccess ||
            current is FetchTeamsMemberSuccess ||
            current is LoadingTeamDetail,
        builder: (context, state) {
          Team? team;
          List<User> members = [];

          if (state is LoadingTeamDetail) {
            return const LoadingWidget();
          }

          if (state is FetchTeamDetailSuccess) {
            team = state.team;
          }
          if (state is FetchTeamsMemberSuccess) {
            members = state.members;
          }

          var banner = ImageConstants.imgDefaultTeamBanner;
          if (team?.banner != null) {
            banner = team!.banner!.optimizeSize600;
          }

          final isBossGroup = myId == team?.group?.boss?.id;
          final isBossTeam = myId == team?.boss?.id;

          final canUpdateMembers = isBossGroup || isBossTeam;
          final isMember = members.map((mem) => mem.id).toList().contains(myId);

          return SliverLayoutNestedScrollView(
            cover: ImageWidget(
              banner,
              width: MediaQuery.of(context).size.width,
            ),
            actionAppBar: canUpdateMembers
                ? IconButton(
                    onPressed: () {
                      if (isBossGroup && isBossTeam || isBossTeam) {
                        context.startUpdateTeamOptionsScreen(team: team!);
                      } else if (isBossGroup) {
                        context
                            .startBossGroupMenu(
                                team: team!, onRevokeBoss: () => {})
                            .then((value) {
                          if (value != null && value == true) {
                            teamDetailBloc.add(FetchTeamDetailEvent(widget.id));
                          }
                        });
                      }
                    },
                    icon: const Icon(Icons.more_vert),
                  )
                : null,
            bodyBuilder: (ScrollController scrollController) {
              return CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _teamHeaderWidget(team),
                          if (canUpdateMembers)
                            _actionButtons(showInvite: !isBossTeam),
                          _introductionWidget(team),
                          if (!canUpdateMembers && !isMember)
                            _askToJoinBtn(
                              canAskToJoin: members.length < 500,
                              teamId: '${team?.id}',
                            ),
                          if (!canUpdateMembers && isMember)
                            _askToLeaveBtn(teamId: '${team?.id}'),
                          const SizedBox(height: 20),
                          _membersWidget(
                            members: members,
                            canUpdateMembers: canUpdateMembers,
                            team: team!,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _teamHeaderWidget(Team? team) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.07),
              blurRadius: 16,
              offset: const Offset(0, 4))
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageWidget(
            team?.avatar ?? IconAppConstants.icDefaultTeamAvt,
            width: 60,
            height: 60,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 150,
                  child: Text(
                    '${team?.name}',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Text(
                          "Boss Team:",
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5,
                                  ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Row(
                            children: [
                              AvatarWidget(
                                avatar: team?.boss?.avatar,
                                size: 20,
                              ),
                              const SizedBox(width: 5),
                              Flexible(
                                child: Text(
                                  '${team?.boss.getdisplayName}',
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          height: 1.5,
                                          color: const Color(0xFF353DFF)),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                Text(
                  'ID: ${team?.id}',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                      color: const Color(0xFFACACAC)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _actionButtons({required bool showInvite}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          if (showInvite)
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 20),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F0FE),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    ImageWidget(IconAppConstants.icInviteTeamMember),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        'Mời thêm thành viên',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: const Color(0xFF4B84F7),
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                    )
                  ],
                ),
              ),
            ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F0FE),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  ImageWidget(IconAppConstants.icShareLinkTeam),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      'Chia sẻ link team',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: const Color(0xFF4B84F7),
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _introductionWidget(Team? team) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Lời giới thiệu',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 10),
        Text(
          team?.introduction ?? '',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
        )
      ],
    );
  }

  Widget _askToJoinBtn({required bool canAskToJoin, required String teamId}) {
    return PrimaryButton(
      title: 'Tham gia team',
      onTap: () {
        context.startAskToJoinTeam(teamId);
      },
      disabled: !canAskToJoin,
      width: MediaQuery.of(context).size.width,
    );
  }

  Widget _askToLeaveBtn({required String teamId}) {
    return GestureDetector(
      onTap: () {
        teamDetailBloc.add(GetLeaveTeamStatusEvent());
      },
      child: Container(
        alignment: Alignment.center,
        height: 48,
        decoration: BoxDecoration(
            color: const Color(0xFFFFEEEC),
            borderRadius: BorderRadius.circular(10)),
        child: RichText(
          text: TextSpan(
            text: '',
            children: <InlineSpan>[
              WidgetSpan(
                child: ImageWidget(
                  IconAppConstants.icLeaveTeam,
                  width: 20,
                  height: 20,
                ),
                alignment: PlaceholderAlignment.middle,
              ),
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Yêu cầu rời Team',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          height: 1.5,
                          color: AppColors.red3,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _membersWidget({
    required List<User> members,
    required bool canUpdateMembers,
    required Team team,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Danh sách thành viên - (${members.length}/500)',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
        ),
        ...members.map(
          (member) => TeamMemberWidget(
            user: member,
            trailing: canUpdateMembers && member.id != myId
                ? PopupMenuButton(
                    onSelected: (value) {
                      if (value == BossTeamActionToMember.assignBossTeam.name) {
                        context
                            .confirmAssignBossTeam(
                          onAction: () {},
                          member: member,
                          team: team,
                        )
                            .then((value) {
                          if (value != null && value == true) {
                            teamDetailBloc.add(FetchTeamDetailEvent(widget.id));
                          }
                        });
                      } else {
                        //TODO: remove member event
                      }
                    },
                    icon:
                        const Icon(Icons.more_horiz, color: Color(0xFF212121)),
                    offset: const Offset(0, 30),
                    itemBuilder: (BuildContext bc) {
                      List<BossTeamActionToMember> menus =
                          List.from(BossTeamActionToMember.values);
                      menus.removeWhere((element) =>
                          member.id == team.boss?.id &&
                          element == BossTeamActionToMember.assignBossTeam);
                      return [
                        ...menus.map(
                          (action) => PopupMenuItem(
                            value: action.name,
                            child: Text(
                              action.textMenu,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: action.textMenuColor),
                            ),
                          ),
                        )
                      ];
                    },
                  )
                : null,
          ),
        )
      ],
    );
  }

  void _onTeamDetailBlocListen(BuildContext context, TeamDetailState state) {
    if (state is FetchTeamDetailSuccess) {
      if (state.team.boss == null) {
        context.askAssignBoss(team: state.team);
      }
    }
    if (state is GetLeaveTeamStatusLoading) {
      context.showLoading();
    } else if (state is GetLeaveTeamStatusSuccess) {
      context.hideLoading();
      if (state.requests.requests != null &&
          state.requests.requests!.isNotEmpty) {
        final dayLeft = state.requests.requests!.first.createdAt!
            .add(const Duration(
                days: CommunityConstant.dayForLeaveTeamRequest + 1))
            .dayLeft();

        context.startDialogBossStatus(dayLeft);
      } else {
        context.startDialogConfirmLeaveTeam(
          onAction: () => teamDetailBloc.add(AskToLeaveTeamEvent(widget.id)),
        );
      }
    } else if (state is AskToLeaveTeamSuccess) {
      context.startDialogBossStatus(CommunityConstant.dayForLeaveTeamRequest);
    } else if (state is TeamDetailError) {
      context.hideLoading();
      final e = state.error;
      if (e is DioException) {
        final message = e.toMessage(context);
        context.showToastMessage(message, ToastMessageType.warning);
      } else {
        final message = 'Đã có lỗi xảy ra, vui lòng thử lại.'
            ' ${kDebugMode ? state.error.toString() : ''}';
        context.showToastMessage(message, ToastMessageType.error);
      }
    }
  }
}
