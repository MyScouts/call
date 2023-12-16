import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/community/community_coordinator.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';
import 'package:ui/ui.dart';

class StartTeamDialog extends StatefulWidget {
  const StartTeamDialog({super.key});

  @override
  State<StartTeamDialog> createState() => _StartTeamDialogState();
}

class _StartTeamDialogState extends State<StartTeamDialog> {
  GetMyTeamsBloc get _myTeamBloc => context.read<GetMyTeamsBloc>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AlertDialog(
      contentPadding: const EdgeInsets.only(top: 10, bottom: 10),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      content: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: paddingHorizontal,
        ),
        width: width,
        child: _buildBody(),
      ),
    );
  }

  _buildBody() {
    return Builder(
      builder: (context) {
        final teamBlocState = context.watch<GetMyTeamsBloc>().state;

        List<Team> teams =
            teamBlocState is GetListDataSuccess<Team> ? teamBlocState.data : [];

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (teamBlocState is GetListDataLoading)
              Center(
                child: isAndroid
                    ? const CircularProgressIndicator()
                    : const CupertinoActivityIndicator(),
              ),
            if (teamBlocState is GetListDataSuccess<Team>) _buildContent(teams),
          ],
        );
      },
    );
  }

  _buildContent(List<Team> teams) {
    return Column(
      children: [
        Center(
          child: Text(
            teams.isEmpty
                ? "Bạn chưa tham gia team nào, bạn có muốn tham gia 1 team."
                : "Bạn có muốn đến team đã tham gia.",
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: CommonOutlineButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "Huỷ",
                  style: context.textTheme.titleMedium!.copyWith(
                    color: context.theme.primaryColor,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: PrimarySolidButton(
                onTap: () {
                  Navigator.pop(context);
                  if (teams.isEmpty) {
                    //TODO: new flow

                    // Navigator.pushNamed(context, CommunityWidget.routeName);
                    // return;
                  }
                  context.startTeamDetail(id: teams[0].id);
                },
                disabled: false,
                title: "Đồng ý",
                width: null,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
