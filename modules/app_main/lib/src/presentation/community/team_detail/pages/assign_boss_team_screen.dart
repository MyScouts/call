import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/data/models/payloads/community/community_payload.dart';
import 'package:app_main/src/presentation/community/community_coordinator.dart';
import 'package:app_main/src/presentation/community/team_detail/bloc/team_detail_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:ui/ui.dart';

class AssignBossTeamScreen extends StatefulWidget {
  final Team team;
  static const String routeName = "assign-boss-team";

  const AssignBossTeamScreen({
    super.key,
    required this.team,
  });

  @override
  State<AssignBossTeamScreen> createState() => _AssignBossTeamScreenState();
}

class _AssignBossTeamScreenState extends State<AssignBossTeamScreen> {
  final TextEditingController _searchCtrl = TextEditingController();
  final List<User> members = [];
  int? _bossId;
  bool _result = false;

  TeamDetailBloc get teamDetailBloc => context.read();

  @override
  void initState() {
    super.initState();
    _bossId = widget.team.boss?.id;
    teamDetailBloc.add(FetchTeamDetailEvent(widget.team.id!));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TeamDetailBloc, TeamDetailState>(
      listener: (context, state) {
        if (state is FetchTeamsMemberSuccess) {
          members.addAll(state.members);
          setState(() {});
        }

        if (state is OnAssignBoss) {
          showLoading();
        }

        if (state is AssignBossSuccess) {
          hideLoading();
          showToastMessage("Chỉ định boss team thành công");
          _bossId = state.bossId;
          _result = true;
          setState(() {});
          Navigator.pop(context, true);
        }

        if (state is AssignBossFail) {
          hideLoading();
          Navigator.pop(context);
          if (state.message.contains('JA')) {
            showToastMessage(state.message, ToastMessageType.error);
          } else {
            context.startDialogWarningAssignBossTeam();
          }
        }
      },
      child: ScaffoldHideKeyboard(
        appBar: BaseAppBar(
          title: "Chỉ định Boss Team",
          onPressed: () => Navigator.pop(context, _result),
          isClose: false,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: paddingHorizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Danh sách thành viên - (${members.length})",
                style: context.textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _searchCtrl,
                decoration: const InputDecoration(
                  hintText: "Tìm kiếm thành viên",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(child: _buildMember()),
            ],
          ),
        ),
      ),
    );
  }

  _buildMember() {
    return BlocBuilder<TeamDetailBloc, TeamDetailState>(
      builder: (context, state) {
        return Column(
          children: [
            if (state is LoadingTeamDetail) const LoadingWidget(),
            if (state is FetchTeamsMemberSuccess && members.isEmpty)
              const Center(
                child: Text("Không tìm thấy thành viên."),
              ),
            if (members.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: members.length,
                  itemBuilder: (context, index) {
                    final member = members[index];
                    bool isBoss = _bossId != null && _bossId == member.id;
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(90),
                                child: CachedNetworkImage(
                                  width: 50,
                                  height: 50,
                                  imageUrl: member.avatar ?? "",
                                  errorWidget: (context, url, error) =>
                                      ImageWidget(
                                    ImageConstants.defaultUserAvatar,
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    member.getdisplayName,
                                    style:
                                        context.textTheme.titleMedium!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "ID: ${member.pDoneId}",
                                    style:
                                        context.textTheme.titleSmall!.copyWith(
                                      color: Colors.grey[500],
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              )
                            ]),
                            if (isBoss)
                              Text(
                                "Đã được chỉ định",
                                style: context.textTheme.titleMedium!.copyWith(
                                  color: const Color(0XFF353DFF),
                                ),
                              ),
                            if (!isBoss)
                              GestureDetector(
                                onTap: () {
                                  if (_bossId != null) return;
                                  context.startDialogConfirmAssignBoss(
                                    onAction: () {
                                      teamDetailBloc.add(AssignBossEvent(
                                        payload: AssignBossPayload(
                                            userId: member.id!),
                                        teamId: widget.team.id!,
                                      ));
                                    },
                                    member: member,
                                    team: widget.team,
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: _bossId != null
                                        ? Colors.grey[100]
                                        : context.theme.primaryColor,
                                    borderRadius: BorderRadius.circular(90),
                                  ),
                                  child: Text(
                                    "Chỉ định",
                                    style:
                                        context.textTheme.titleMedium!.copyWith(
                                      color: _bossId != null
                                          ? Colors.grey
                                          : AppColors.white,
                                    ),
                                  ),
                                ),
                              )
                          ]),
                    );
                  },
                ),
              )
          ],
        );
      },
    );
  }
}
