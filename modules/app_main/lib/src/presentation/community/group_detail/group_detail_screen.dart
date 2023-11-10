// import 'package:app_core/app_core.dart';
// import 'package:app_main/src/blocs/user/user_cubit.dart';
// import 'package:design_system/design_system.dart';
// import 'package:flutter/material.dart';
// import 'package:imagewidget/imagewidget.dart';
// import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
//
// import '../../shared/user/bloc/user_bloc.dart';
// import '../community_constants.dart';
// import '../community_coordinator.dart';
// import '../widgets/dropdown_menu_option_widget.dart';
// import '../widgets/team_card_widget.dart';
// import 'bloc/group_detail_bloc.dart';
// import 'group_detail_constants.dart';
//
// class GroupDetailScreen extends StatefulWidget {
//   static const String routeName = '/groups';
//
//   const GroupDetailScreen({
//     super.key,
//     required this.id,
//     this.cover,
//     this.groupName,
//   });
//
//   final String? groupName;
//   final String? cover;
//   final String id;
//
//   @override
//   State<GroupDetailScreen> createState() => _GroupDetailScreenState();
// }
//
// class _GroupDetailScreenState extends State<GroupDetailScreen> {
//   String? get currUserId => context.read<UserCubit>().currentUser?.pDoneId;
//
//   GroupDetailBloc get groupDetailBloc => context.read();
//
//   void _onTapTeam(Team team) {
//     context.startTeamDetail(
//       id: team.id,
//       name: team.name,
//       cover: team.avatar,
//     );
//   }
//
//   void _onTapEdit(Group group) {
//     final boss = group.copyWith;
//     context.startUpdateGroupOptions(community: Community.copyWithGroup(group));
//
//     // context
//     //     .startEditInformation(
//     //   community: Community.copyWithGroup(group),
//     //   type: CommunityType.group,
//     // )
//     //     .then((value) {
//     //   if (value != null && value is Group) {
//     //     groupDetailBloc.add(
//     //       UpdateGroupDetailEvent(value.copyWith(boss: boss)),
//     //     );
//     //   }
//     // });
//   }
//
//   @override
//   void initState() {
//     groupDetailBloc.add(FetchGroupDetailEvent(widget.id));
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.bgColor,
//       body: BlocBuilder<GroupDetailBloc, GroupDetailState>(
//         builder: (context, state) {
//           if (state is LoadingGroupDetail) {
//             return const LoadingWidget();
//           }
//
//           Group? group;
//           if (state is FetchGroupDetailSuccess) {
//             group = state.group;
//           }
//
//           var banner = ImageConstants.imgdefault;
//           if (group?.banner != null) {
//             banner = group!.banner!.optimizeSize600;
//           }
//
//           return SliverLayoutNestedScrollView(
//             cover: ImageWidget(
//               banner,
//               width: MediaQuery.of(context).size.width,
//             ),
//             actionAppBar: currUserId == group?.boss?.pDoneId
//                 // ? DropdownMenuOptionWidget(
//                 //     onChanged: (type) {
//                 //       if (type == GroupDetailAction.edit) {
//                 //         _onTapEdit(group!);
//                 //       }
//                 //     },
//                 //   )
//                 ? IconButton(
//                     onPressed: () => _onTapEdit(group!),
//                     icon: const Icon(Icons.more_vert),
//                   )
//                 : null,
//             header: Center(
//               child: Container(
//                 margin: const EdgeInsets.only(top: 8),
//                 padding: const EdgeInsets.only(bottom: 28.0),
//                 child: ImageWidget(
//                   group?.avatar ?? ImageConstants.imgdefault,
//                   width: 100,
//                   height: 100,
//                   borderRadius: 50,
//                 ),
//               ),
//             ),
//             bodyBuilder: (ScrollController scrollController) {
//               return CustomScrollView(
//                 controller: scrollController,
//                 slivers: [
//                   SliverToBoxAdapter(
//                     child: Column(
//                       children: [
//                         if (group?.name?.isNotEmpty ?? false)
//                           Text(
//                             group?.name ?? '',
//                             style: Theme.of(context).textTheme.labelLarge,
//                           ),
//                         if (group?.id?.isNotEmpty ?? false)
//                           Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 5),
//                             child: Text(
//                               'ID: ${group?.id}',
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .bodySmall
//                                   ?.copyWith(
//                                     fontWeight: FontWeight.w500,
//                                     color: const Color(0xFF828282),
//                                   ),
//                             ),
//                           ),
//                         RichText(
//                           text: TextSpan(
//                             text: 'Boss Group: ',
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .headlineSmall!
//                                 .copyWith(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w300,
//                                   height: 1.5,
//                                   color: const Color(0xFF232323),
//                                 ),
//                             children: [
//                               TextSpan(
//                                 text: group?.boss?.displayName,
//                                 style: const TextStyle(
//                                   decoration: TextDecoration.underline,
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w600,
//                                   height: 1.5,
//                                   color: Color(0xFF232323),
//                                 ),
//                                 // recognizer: TapGestureRecognizer()
//                                 //   ..onTap = _onTapPolicy,
//                               ),
//                             ],
//                           ),
//                         ),
//                         if (group?.introduction?.isNotEmpty ?? false)
//                           Padding(
//                             padding: const EdgeInsets.only(
//                                 left: 10.0, right: 10, top: 12),
//                             child: Row(
//                               children: [
//                                 Flexible(
//                                   child: Text(
//                                     group!.introduction!,
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodySmall
//                                         ?.copyWith(
//                                           fontWeight: FontWeight.w400,
//                                           height: 1.42,
//                                         ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         Row(
//                           children: [
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 10)
//                                       .copyWith(top: 18, bottom: 12),
//                               child: Text(
//                                 'Danh sách các team',
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodyMedium
//                                     ?.copyWith(
//                                       fontWeight: FontWeight.w500,
//                                       color: const Color(0xFF0F0F0F),
//                                     ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   BlocBuilder<GroupDetailBloc, GroupDetailState>(
//                     builder: (context, state) {
//                       if (state is FetchTeamsSuccess) {
//                         final teams = state.teams;
//                         return SliverPadding(
//                           padding: const EdgeInsets.symmetric(horizontal: 8)
//                               .copyWith(
//                             bottom: MediaQuery.of(context).padding.bottom,
//                           ),
//                           sliver: SliverGrid(
//                             delegate: SliverChildBuilderDelegate(
//                               (context, index) {
//                                 return TeamCardWidget(
//                                   team: teams[index],
//                                   onTap: _onTapTeam,
//                                 );
//                               },
//                               childCount: teams.length,
//                             ),
//                             gridDelegate:
//                                 const SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 2,
//                               childAspectRatio: 2.0,
//                               mainAxisSpacing: 8,
//                               crossAxisSpacing: 10,
//                             ),
//                           ),
//                         );
//                       }
//                       return const SliverToBoxAdapter(child: SizedBox());
//                     },
//                   ),
//                 ],
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:app_core/app_core.dart';
import 'package:app_main/src/app_dimens.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/community/community_coordinator.dart';
import 'package:app_main/src/presentation/community/widgets/circle_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_system/design_system.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';

import 'bloc/group_detail_bloc.dart';

class GroupDetailScreen extends StatefulWidget {
  const GroupDetailScreen({super.key, required this.id});

  final String id;

  static const String routeName = '/groups';

  @override
  State<GroupDetailScreen> createState() => _GroupDetailScreenState();
}

class _GroupDetailScreenState extends State<GroupDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<GroupDetailBloc>(
      create: (_) => getIt()..add(FetchGroupDetailEvent(widget.id)),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: BlocBuilder<GroupDetailBloc, GroupDetailState>(
          builder: (ctx, state) {
            if (state is FetchTeamsSuccess) {
              return ExtendedNestedScrollView(
                onlyOneScrollInBody: true,
                headerSliverBuilder: buildSliverHeader,
                body: const SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: _BossGroup(),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: _GroupDescription(),
                        ),
                        SizedBox(height: 16),
                        Divider(
                          height: 16,
                          thickness: 16,
                          color: AppColors.bgColor,
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: _GroupTeam(),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            return const LoadingWidget();
          },
        ),
      ),
    );
  }

  List<Widget> buildSliverHeader(context, innerBoxIsScrolled) {
    return [
      const SliverPersistentHeader(
        delegate: _CmOverviewHeaderDelegate(),
        pinned: true,
      ),
      const SliverToBoxAdapter(
        child: _CmGroupBasics(),
      ),
    ];
  }
}

class _GroupTeam extends StatelessWidget {
  const _GroupTeam({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<GroupDetailBloc>();
    final teams = (bloc.state as FetchTeamsSuccess).teams;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Danh sách các team',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        GridView.count(
          childAspectRatio: 3 / 2.1,
          padding: const EdgeInsets.symmetric(vertical: 16),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: teams.map((e) => _TeamCard(team: e)).toList(),
        ),
      ],
    );
  }
}

class _TeamCard extends StatelessWidget {
  const _TeamCard({super.key, required this.team});

  final Team team;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.startTeamDetail(
        id: team.id,
        name: team.name,
      ),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.white,
            border: Border.all(color: const Color(0xffF2F2F2))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  CircleNetworkImage(url: team.boss?.avatar ?? '', size: 37),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Team',
                          style: TextStyle(
                            color: Color(0xffACACAC),
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            team.boss?.displayName ?? '',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '${team.memberCount} thành viên',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Color(0xff4B84F7),
                fontSize: 11,
              ),
            ),
            const SizedBox(height: 4),
            Container(
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xffF4F4F4),
                borderRadius: BorderRadius.circular(2.5),
              ),
              child: Row(
                children: [
                  // 20 member/1 nhom. 500 member -> 25 nhom
                  Flexible(
                    flex: team.memberCount! ~/ 25 + 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff4B84F7),
                        borderRadius: BorderRadius.circular(2.5),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 25 - (team.memberCount! ~/ 25 + 1),
                      child: const SizedBox.shrink()),
                ],
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'ID: ${team.id?.toUpperCase()}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xffACACAC),
                    ),
                  ),
                ),
                const Text(
                  'Khám phá',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff4B84F7),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _GroupDescription extends StatelessWidget {
  const _GroupDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<GroupDetailBloc>();
    final group = (bloc.state as FetchGroupDetailSuccess).group;
    return Text(group.introduction ?? '');
  }
}

class _BossGroup extends StatelessWidget {
  const _BossGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<GroupDetailBloc>();
    final group = (bloc.state as FetchGroupDetailSuccess).group;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19.0),
        border: Border.all(color: const Color(0xffF2F2F2)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14.0),
                child: SizedBox.square(
                  dimension: 48,
                  child: Image.network(group.boss?.avatar ?? ''),
                ),
              ),
              const SizedBox(width: 8),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    group.boss?.getdisplayName ?? '',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      height: 1,
                      color: context.theme.primaryColor,
                    ),
                  ),
                  const Text(
                    'Boss group',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff6E6E6E),
                      height: 1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CmGroupBasics extends StatelessWidget {
  const _CmGroupBasics({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<GroupDetailBloc>();
    final Group group;
    if (bloc.state is FetchGroupDetailSuccess) {
      group = (bloc.state as FetchGroupDetailSuccess).group;
    } else {
      group = (bloc.state as FetchTeamsSuccess).group;
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(height: 92 - statusBarHeight),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 6),
                Text(
                  group.name ?? '',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1.2,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'ID: ${group.id ?? ''}',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 14, height: 1.2, color: Color(0xff6E6E6E)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

double screenWidth = 375;
const cmBannerRatio = 2.2;
const cmAppBarHeight = 48.0;

final _opacityTween = Tween(begin: 0.0, end: 1.0).chain(
    CurveTween(curve: const Interval(0.6, 1.0, curve: Curves.easeInOut)));

class _CmOverviewHeaderDelegate extends SliverPersistentHeaderDelegate {
  const _CmOverviewHeaderDelegate();

  @override
  double get maxExtent => screenWidth / cmBannerRatio + statusBarHeight;

  @override
  double get minExtent => cmAppBarHeight + statusBarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final ratio = shrinkOffset / maxExtent;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          Opacity(
            opacity: 1 - _opacityTween.transform(ratio),
            child: const _GroupBanner(),
          ),
          Opacity(
            opacity: _opacityTween.transform(ratio),
            child: const _CollapsedTopBar(),
          ),
          const _TopBarBackButton(),
          const _TopBarRightButtons(),
          Positioned(
            bottom: -48,
            left: 0,
            right: 0,
            child: Center(
              child: Opacity(
                opacity: 1 - _opacityTween.transform(ratio),
                child: const _Avatar(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<GroupDetailBloc>();
    final group = (bloc.state as FetchGroupDetailSuccess).group;

    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            color: Color.fromRGBO(75, 130, 235, 0.73),
            blurRadius: 19,
            spreadRadius: -9,
          ),
        ],
      ),
      child: CircleNetworkImage(url: group.avatar ?? '', size: 136),
    );
  }
}

class _TopBarRightButtons extends StatelessWidget {
  const _TopBarRightButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<GroupDetailBloc>();
    final group = (bloc.state as FetchGroupDetailSuccess).group;
    final user = context.watch<UserCubit>().currentUser;
    final canEdit = group.boss?.id == user?.id && user?.id != null;

    Widget content = const SizedBox.shrink();

    if (canEdit) {
      content = GestureDetector(
        onTap: () {
          context.startUpdateGroupOptions(
            community: Community.copyWithGroup(group),
          );
        },
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 12, 0),
          child: ImageWidget(IconAppConstants.icDotsHorizontal),
        ),
      );
    }

    return SafeArea(
      bottom: false,
      child: Align(
        alignment: Alignment.topRight,
        child: content,
      ),
    );
  }
}

class _TopBarBackButton extends StatelessWidget {
  const _TopBarBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      bottom: false,
      child: Align(
        alignment: Alignment.topLeft,
        child: BackButton(color: Colors.white),
      ),
    );
  }
}

const appBgGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.topRight,
  colors: [Color(0xff215899), Color(0xff38B6FD)],
  stops: [0, 1],
);

class _CollapsedTopBar extends StatelessWidget {
  const _CollapsedTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final group =
        (context.watch<GroupDetailBloc>().state as FetchGroupDetailSuccess)
            .group;

    return DecoratedBox(
      decoration: const BoxDecoration(gradient: appBgGradient),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(left: 56, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleNetworkImage(
                url: group.avatar ?? '',
                size: 30,
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  group.name ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    height: 1.2,
                  ),
                ),
              ),
              const SizedBox(width: 44),
            ],
          ),
        ),
      ),
    );
  }
}

class _GroupBanner extends StatelessWidget {
  const _GroupBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final group =
        (context.watch<GroupDetailBloc>().state as FetchGroupDetailSuccess)
            .group;
    final imageWidth = (screenWidth * pixelRatio).round();

    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: group.banner ?? '',
      cacheKey: '${group.banner}-$imageWidth',
      height: screenWidth / cmBannerRatio,
      width: screenWidth,
      maxWidthDiskCache: imageWidth,
      errorWidget: (context, url, error) => const ColoredBox(
        color: Color(0x1A2F6BFF),
      ),
    );
  }
}
