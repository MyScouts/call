import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/community/team_request/team_request_cubit.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/data/models/payloads/community/community_payload.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

import '../../community_constants.dart';
import '../../widgets/day_countdown_widget.dart';

class TeamRequestListScreen extends StatefulWidget {
  final Team team;
  static const String routeName = '/team-requests';

  const TeamRequestListScreen({
    super.key,
    required this.team,
  });

  @override
  State<TeamRequestListScreen> createState() => _TeamRequestListScreenState();
}

class _TeamRequestListScreenState extends State<TeamRequestListScreen> {
  int _page = 0;
  final PageController _pageCtrl = PageController(initialPage: 0);
  bool _result = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TeamRequestCubit>(
      create: (context) => injector.get<TeamRequestCubit>(),
      child: BlocListener<TeamRequestCubit, TeamRequestState>(
        listener: (context, state) {
          if (state is OnReplyLeaveRequest) {
            showLoading();
          }
          if (state is ReplyLeaveRequestSuccess) {
            hideLoading();
            _result = true;
            if (state.isApproved) {
              showToastMessage("Phê duyệt yêu cầu rời team thành công");
            } else {
              showToastMessage("Từ chối duyệt yêu cầu rời team thành công");
            }
          }
          if (state is ReplyJoinRequestSuccess) {
            hideLoading();
            _result = true;
            if (state.isApproved) {
              showToastMessage("Phê duyệt yêu cầu tham gia team thành công");
            } else {
              showToastMessage(
                  "Từ chối duyệt yêu cầu tham gia team thành công");
            }
          }
        },
        child: Scaffold(
          appBar: BaseAppBar(
            title: "Yêu cầu cần phê duyệt",
            onPressed: () => Navigator.pop(context, _result),
            isClose: false,
          ),
          body: WillPopScope(
            onWillPop: () async {
              Navigator.maybePop(context, _result);
              return true;
            },
            child: Column(
              children: [
                _buildTab(),
                const SizedBox(height: 5),
                Expanded(
                  child: PageView(
                    controller: _pageCtrl,
                    children: [
                      JoinRequestPage(team: widget.team),
                      LeaveRequestPage(team: widget.team),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildTab() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: const Color(0xFFF4F4F4),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              _pageCtrl.animateToPage(
                0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
              _page = 0;
              setState(() {});
            },
            child: Container(
              width: 160,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: _page == 0 ? Colors.white : Colors.transparent,
              ),
              child: Center(
                child: Text(
                  "Yêu cầu vào Team",
                  style: TextStyle(
                      fontWeight:
                          _page == 0 ? FontWeight.w600 : FontWeight.w400,
                      fontSize: 14,
                      height: 20 / 14,
                      leadingDistribution: TextLeadingDistribution.even,
                      color: _page == 0
                          ? context.theme.primaryColor
                          : const Color(0xFF6E6E6E)),
                ),
              ),
            ),
          ),
          const SizedBox(width: 4),
          InkWell(
            onTap: () {
              _pageCtrl.animateToPage(
                1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
              _page = 1;
              setState(() {});
            },
            child: Container(
              width: 160,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: _page == 1 ? Colors.white : Colors.transparent,
              ),
              child: Center(
                child: Text(
                  "Yêu cầu rời Team",
                  style: TextStyle(
                    fontWeight: _page == 1 ? FontWeight.w400 : FontWeight.w600,
                    fontSize: 14,
                    height: 20 / 14,
                    leadingDistribution: TextLeadingDistribution.even,
                    color: _page == 1
                        ? context.theme.primaryColor
                        : const Color(0xFF212121),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class JoinRequestPage extends StatefulWidget {
  final Team team;

  const JoinRequestPage({
    super.key,
    required this.team,
  });

  @override
  State<JoinRequestPage> createState() => _JoinRequestPageState();
}

class _JoinRequestPageState extends State<JoinRequestPage> {
  late final _bloc = context.read<TeamRequestCubit>();

  @override
  void initState() {
    super.initState();
    _bloc.getRequests(teamId: widget.team.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildList(),
    );
  }

  _buildList() {
    return BlocBuilder<TeamRequestCubit, TeamRequestState>(
      buildWhen: (pre, cur) =>
          cur is ReplyJoinRequestSuccess ||
          cur is OnReplyJoinRequest ||
          cur is OnGetListRequest ||
          cur is GetListJoinRequestSuccess ||
          cur is GetListRequestFail,
      builder: (context, state) {
        if (state is OnGetListRequest || state is OnReplyJoinRequest) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is GetListJoinRequestSuccess ||
            state is ReplyJoinRequestSuccess) {
          if (state.requests.isEmpty) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
              child: Center(child: Text("Không có yêu cầu nào!")),
            );
          }

          final request = state.requests;

          return ListView.builder(
            itemCount: request.length,
            itemBuilder: (context, index) {
              final member = request[index];
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: .2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(90),
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: member.user?.avatar ?? "",
                                errorWidget: (context, url, error) =>
                                    ImageWidget(
                                  ImageConstants.defaultUserAvatar,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                member.user.getDisplayName,
                                style: context.textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                member.user?.pDoneId ?? "",
                                style: context.textTheme.titleMedium!
                                    .copyWith(color: Colors.grey[500]),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Yêu cầu vào Team của ${member.user.getDisplayName}",
                        style: context.textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                              child: GestureDetector(
                            onTap: () => _bloc.replyJoinRequest(
                              teamId: member.team.id!,
                              payload: ReplyJoinRequestPayload(
                                userId: member.user!.id!,
                                isApproved: false,
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0XFFE8F0FE),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.close,
                                    size: 20,
                                    color: context.theme.primaryColor,
                                  ),
                                  Text(
                                    "Từ chối",
                                    style:
                                        context.textTheme.titleSmall!.copyWith(
                                      color: context.theme.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                          const SizedBox(width: 10),
                          Expanded(
                              child: GestureDetector(
                            onTap: () => _bloc.replyJoinRequest(
                              teamId: member.team.id!,
                              payload: ReplyJoinRequestPayload(
                                userId: member.user!.id!,
                                isApproved: true,
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: context.theme.primaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.check,
                                    size: 20,
                                    color: AppColors.white,
                                  ),
                                  Text(
                                    "Phê duyệt",
                                    style: context.textTheme.titleSmall!
                                        .copyWith(color: AppColors.white),
                                  ),
                                ],
                              ),
                            ),
                          )),
                        ],
                      )
                    ]),
              );
            },
          );
        }
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: paddingHorizontal),
          child: const Center(child: Text('Đã xảy ra lỗi')),
        );
      },
    );
  }
}

class LeaveRequestPage extends StatefulWidget {
  final Team team;

  const LeaveRequestPage({
    super.key,
    required this.team,
  });

  @override
  State<LeaveRequestPage> createState() => _LeaveRequestPage();
}

class _LeaveRequestPage extends State<LeaveRequestPage> {
  late final _bloc = context.read<TeamRequestCubit>();

  @override
  void initState() {
    super.initState();
    _bloc.getRequests(isJoinRequest: false, teamId: widget.team.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildList(),
    );
  }

  _buildList() {
    return BlocBuilder<TeamRequestCubit, TeamRequestState>(
      buildWhen: (pre, cur) =>
          cur is ReplyLeaveRequestSuccess ||
          cur is OnGetListRequest ||
          cur is GetListLeaveRequestSuccess ||
          cur is OnReplyJoinRequest ||
          cur is GetListRequestFail,
      builder: (context, state) {
        if (state is OnGetListRequest || state is OnReplyLeaveRequest) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is GetListLeaveRequestSuccess ||
            state is ReplyLeaveRequestSuccess) {
          if (state.requests.isEmpty) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
              child: Center(child: Text("Không có yêu cầu nào!")),
            );
          }

          final request = state.requests;

          return ListView.builder(
            itemCount: request.length,
            itemBuilder: (context, index) {
              final member = request[index];
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: .2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(90),
                              child: CachedNetworkImage(
                                imageUrl: member.user?.avatar ?? "",
                                errorWidget: (context, url, error) =>
                                    ImageWidget(
                                  ImageConstants.defaultUserAvatar,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  member.user.getDisplayName,
                                  style:
                                      context.textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Boss Team của Team ${member.team.name}",
                                  softWrap: true,
                                  style: context.textTheme.titleMedium!
                                      .copyWith(color: Colors.grey[500]),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Yêu cầu rời Team của ${member.user.getDisplayName}",
                        style: context.textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0XFFFFF5C7),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "Thời gian phê duyệt còn lại",
                                softWrap: true,
                                style: context.textTheme.titleMedium!
                                    .copyWith(color: AppColors.black),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0XFFFF7626),
                                  borderRadius: BorderRadius.circular(90),
                                ),
                                child: DayCountdownWidget(
                                  durationInSeconds: member.createdAt!
                                      .add(const Duration(
                                          days: CommunityConstant
                                              .dayForRelinquishBossGroupRequest))
                                      .difference(DateTime.now())
                                      .inSeconds,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Nếu bạn không phê duyệt trong thời gian đếm ngược, yêu cầu này sẽ tự động đồng ý với yêu cầu của người tạo.",
                        style: context.textTheme.bodySmall!
                            .copyWith(color: Colors.grey[500]),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                              child: GestureDetector(
                            onTap: () => _bloc.replyLeaveRequest(
                              teamId: member.team.id!,
                              payload: ReplyJoinRequestPayload(
                                userId: member.user!.id!,
                                isApproved: true,
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: context.theme.primaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.check,
                                    size: 20,
                                    color: AppColors.white,
                                  ),
                                  Text(
                                    "Phê duyệt",
                                    style: context.textTheme.titleSmall!
                                        .copyWith(color: AppColors.white),
                                  ),
                                ],
                              ),
                            ),
                          )),
                        ],
                      )
                    ]),
              );
            },
          );
        }
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: paddingHorizontal),
          child: const Center(child: Text('Đã xảy ra lỗi')),
        );
      },
    );
  }
}
