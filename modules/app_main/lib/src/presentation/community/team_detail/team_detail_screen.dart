import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/community/community_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:ui/ui.dart';

import '../../shared/user/bloc/user_bloc.dart';
import '../community_constants.dart';
import '../widgets/team_member_widget.dart';
import 'bloc/team_detail_bloc.dart';
import 'team_detail_constants.dart';

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
  late final TabController _tabCtrl;

  User? get currentUser => context.read<UserBloc>().state.currentUser;

  String? get currUserId => currentUser?.pDoneId;

  bool get isJA => currentUser?.isPDone == true && currentUser?.isJA == true;

  TeamDetailBloc get teamDetailBloc => context.read();

  // void _onTapEdit(Team team) {
  //   final boss = team.boss;
  //
  //   context
  //       .startEditInformation(
  //           community: Community.copyWithTeam(team), type: CommunityType.team)
  //       .then((value) {
  //     if (value != null && value is Team) {
  //       teamDetailBloc.add(UpdateTeamDetailEvent(value.copyWith(boss: boss)));
  //     }
  //   });
  // }

  @override
  void initState() {
    super.initState();
    _tabCtrl = TabController(length: TeamDetailTab.values.length, vsync: this);
    teamDetailBloc.add(FetchTeamDetailEvent(widget.id));
  }

  @override
  void dispose() {
    _tabCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TeamDetailBloc, TeamDetailState>(
        buildWhen: (prev, current) =>
            current is FetchTeamDetailSuccess ||
            current is FetchTeamsMemberSuccess,
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

          final myId = injector.get<UserCubit>().currentUser?.id;
          final canUpdateMembers =
              myId == widget.bossGroupId || myId == team?.boss?.id;

          final isBossGroupButNotBossTeam =
              myId == widget.bossGroupId && myId != team?.boss?.id;
          final isBossGroupAndBossTeam =
              myId == widget.bossGroupId && myId == team?.boss?.id;

          print('myId: $myId');
          print('widget.bossGroupId: ${widget.bossGroupId}');
          print('team?.boss?.id: ${team?.boss?.id}');

          return SliverLayoutNestedScrollView(
            cover: ImageWidget(
              banner,
              width: MediaQuery.of(context).size.width,
            ),
            actionAppBar: canUpdateMembers
                ? IconButton(
                    onPressed: () {
                      showToastMessage('Tính năng này đang được phát triển',
                          ToastMessageType.warning);
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
                          if(canUpdateMembers)_actionButtons(showInvite: !isBossGroupButNotBossTeam),
                          _introductionWidget(team),
                          if (!canUpdateMembers)
                            _askToJoinBtn(
                              canAskToJoin: members.length < 500,
                              teamId: '${team?.id}',
                            ),
                          const SizedBox(height: 20),
                          _membersWidget(
                              members: members,
                              canUpdateMembers: canUpdateMembers),
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
        children: [
          ImageWidget(
            team?.avatar ?? ImageConstants.defaultAvatar,
            width: 60,
            height: 60,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 150,
                child: Text(
                  '${team?.name}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: RichText(
                  text: TextSpan(
                    text: 'Boss Team:',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                    children: <InlineSpan>[
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 5),
                          child: AvatarWidget(
                            avatar: team?.boss?.avatar,
                            size: 20,
                          ),
                        ),
                        alignment: PlaceholderAlignment.middle,
                      ),
                      WidgetSpan(
                        child: SizedBox(
                          width: 150,
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
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                'ID: ${team?.id}',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                    color: const Color(0xFFACACAC)),
              ),
            ],
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
      height: 55,
      onTap: () {
        context.startAskToJoinTeam(teamId);
      },
      disabled: !canAskToJoin,
      width: MediaQuery.of(context).size.width,
    );
  }

  Widget _askToLeaveBtn(bool canAskToJoin) {
    return PrimaryButton(
      title: 'Yêu cầu rời Team',
      height: 55,
      onTap: () {},
      disabled: !canAskToJoin,
      width: MediaQuery.of(context).size.width,
    );
  }

  Widget _membersWidget(
      {required List<User> members, required bool canUpdateMembers}) {
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
            trailing: canUpdateMembers
                ? PopupMenuButton(
                    onSelected: (value) {
                      if (value == BossTeamActionToMember.assignBossTeam.name) {
                        //TODO: assign boss team event
                      } else {
                        //TODO: remove member event
                      }
                    },
                    icon:
                        const Icon(Icons.more_horiz, color: Color(0xFF212121)),
                    offset: const Offset(0, 30),
                    itemBuilder: (BuildContext bc) {
                      return [
                        ...BossTeamActionToMember.values.map(
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
}
