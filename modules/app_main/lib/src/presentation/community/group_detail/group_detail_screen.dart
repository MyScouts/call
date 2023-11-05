import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';

import '../../shared/user/bloc/user_bloc.dart';
import '../community_constants.dart';
import '../community_coordinator.dart';
import '../widgets/dropdown_menu_option_widget.dart';
import '../widgets/team_card_widget.dart';
import 'bloc/group_detail_bloc.dart';
import 'group_detail_constants.dart';

class GroupDetailScreen extends StatefulWidget {
  static const String routeName = '/groups';

  const GroupDetailScreen({
    super.key,
    required this.id,
    this.cover,
    this.groupName,
  });

  final String? groupName;
  final String? cover;
  final String id;

  @override
  State<GroupDetailScreen> createState() => _GroupDetailScreenState();
}

class _GroupDetailScreenState extends State<GroupDetailScreen> {
  String? get currUserId => context.read<UserBloc>().state.currentUser?.pDoneId;

  GroupDetailBloc get groupDetailBloc => context.read();

  void _onTapTeam(Team team) {
    context.startTeamDetail(
      id: team.id,
      name: team.name,
      cover: team.avatar,
    );
  }

  void _onTapEdit(Group group) {
    final boss = group.boss;

    context
        .startEditInformation(
      community: Community.copyWithGroup(group),
      type: CommunityType.group,
    )
        .then((value) {
      if (value != null && value is Group) {
        groupDetailBloc.add(
          UpdateGroupDetailEvent(value.copyWith(boss: boss)),
        );
      }
    });
  }

  @override
  void initState() {
    groupDetailBloc.add(FetchGroupDetailEvent(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: BlocBuilder<GroupDetailBloc, GroupDetailState>(
        builder: (context, state) {
          if (state is LoadingGroupDetail) {
            return const LoadingWidget();
          }

          Group? group;
          if (state is FetchGroupDetailSuccess) {
            group = state.group;
          }

          var banner = ImageConstants.imgdefault;
          if (group?.banner != null) {
            banner = group!.banner!.optimizeSize600;
          }

          return SliverLayoutNestedScrollView(
            cover: ImageWidget(
              banner,
              width: MediaQuery.of(context).size.width,
            ),
            actionAppBar: currUserId == group?.boss?.pDoneId
                ? DropdownMenuOptionWidget(
                    onChanged: (type) {
                      if (type == GroupDetailAction.edit) {
                        _onTapEdit(group!);
                      }
                    },
                  )
                : null,
            header: Center(
              child: Container(
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.only(bottom: 28.0),
                child: ImageWidget(
                  group?.avatar ?? ImageConstants.imgdefault,
                  width: 100,
                  height: 100,
                  borderRadius: 50,
                ),
              ),
            ),
            bodyBuilder: (ScrollController scrollController) {
              return CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        if (group?.name?.isNotEmpty ?? false)
                          Text(
                            group?.name ?? '',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        if (group?.id?.isNotEmpty ?? false)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              'ID: ${group?.id}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF828282),
                                  ),
                            ),
                          ),
                        RichText(
                          text: TextSpan(
                            text: 'Boss Group: ',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  height: 1.5,
                                  color: const Color(0xFF232323),
                                ),
                            children: [
                              TextSpan(
                                text: group?.boss?.displayName,
                                style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  height: 1.5,
                                  color: Color(0xFF232323),
                                ),
                                // recognizer: TapGestureRecognizer()
                                //   ..onTap = _onTapPolicy,
                              ),
                            ],
                          ),
                        ),
                        if (group?.introduction?.isNotEmpty ?? false)
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10, top: 12),
                            child: Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    group!.introduction!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          height: 1.42,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10)
                                      .copyWith(top: 18, bottom: 12),
                              child: Text(
                                'Danh sách các team',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF0F0F0F),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<GroupDetailBloc, GroupDetailState>(
                    builder: (context, state) {
                      if (state is FetchTeamsSuccess) {
                        final teams = state.teams;
                        return SliverPadding(
                          padding: const EdgeInsets.symmetric(horizontal: 8)
                              .copyWith(
                            bottom: MediaQuery.of(context).padding.bottom,
                          ),
                          sliver: SliverGrid(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                return TeamCardWidget(
                                  team: teams[index],
                                  onTap: _onTapTeam,
                                );
                              },
                              childCount: teams.length,
                            ),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 2.0,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 10,
                            ),
                          ),
                        );
                      }
                      return const SliverToBoxAdapter(child: SizedBox());
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
