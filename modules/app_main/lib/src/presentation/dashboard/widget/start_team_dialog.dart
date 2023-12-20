import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/app_coordinator.dart';
import 'package:app_main/src/presentation/authentication/widget/custom_text_field.dart';
import 'package:app_main/src/presentation/community/community_coordinator.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_module.dart';
import 'package:app_main/src/presentation/qr_code/qr_code_constants.dart';
import 'package:app_main/src/presentation/qr_code/qr_code_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:ui/ui.dart';

import '../../community/team_detail/bloc/team_detail_bloc.dart';

class StartTeamDialog extends StatefulWidget {
  const StartTeamDialog({super.key});

  @override
  State<StartTeamDialog> createState() => _StartTeamDialogState();
}

class _StartTeamDialogState extends State<StartTeamDialog> {
  final TextEditingController _teamIdCtrl = TextEditingController();
  GetMyTeamsBloc get _myTeamBloc => context.read<GetMyTeamsBloc>();
  final TeamDetailBloc _teamDetailBloc = injector.get();
  final _teamInputCtrl = ValueNotifier<Team?>(null);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => _teamDetailBloc,
      child: BlocListener<TeamDetailBloc, TeamDetailState>(
        listener: (context, state) {
          if (state is FetchTeamsMemberSuccess) {
            _teamInputCtrl.value = state.team;
          } else {
            _teamInputCtrl.value = null;
          }
        },
        child: AlertDialog(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          contentPadding: const EdgeInsets.only(top: 10, bottom: 10),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          content: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: paddingHorizontal,
            ),
            width: width,
            child: _buildBody(),
          ),
        ),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<GetMyTeamsBloc, GetListState>(
      builder: (context, teamBlocState) {
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
        Stack(
          children: [
            Center(
              child: Text(
                teams.isEmpty ? "Đăng ký team" : "Thông báo",
                style: context.textTheme.titleMedium!.copyWith(fontSize: 15),
              ),
            ),
            const Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              child: CustomCloseButton(),
            ),
          ],
        ),
        const SizedBox(height: 10),
        if (teams.isNotEmpty) _buildGoTeam(teams),
        if (teams.isEmpty) _buildJoinTeam(),
      ],
    );
  }

  _buildGoTeam(List<Team> teams) {
    return Column(
      children: [
        const Center(
          child: Text(
            "Bạn có muốn đến team đã tham gia.",
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

  _buildJoinTeam() {
    return Column(
      children: [
        _buildInput(),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () => context
              .startScanQrCode(type: QrCodeScanType.joinTeam)
              .then((value) {
            if (value != null && value is String) {
              _teamIdCtrl.text = value;
              _validation();
            }
          }),
          child: Row(
            children: [
              Assets.icons_ic_qrcode_svg.svg(height: 25),
              const SizedBox(width: 5),
              Text(
                "Quét mã QR",
                style: context.textTheme.titleMedium!.copyWith(
                  color: context.theme.primaryColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: PrimarySolidButton(
                title: "Huỷ",
                onTap: () => context.pop(),
                disabled: false,
                width: MediaQuery.of(context).size.width,
                textColor: Colors.grey[700],
                color: Colors.grey[200],
              ),
            ),
            const SizedBox(width: 20),
            ValueListenableBuilder(
              valueListenable: _teamInputCtrl,
              builder: (context, value, child) {
                return Expanded(
                  child: PrimarySolidButton(
                    title: "Đi tới Team",
                    onTap: () {
                      context.pop();
                      context.startTeamDetail(id: value!.id);
                    },
                    disabled: value == null,
                    width: MediaQuery.of(context).size.width,
                  ),
                );
              },
            )
          ],
        )
      ],
    );
  }

  _buildInput() {
    return BlocBuilder<TeamDetailBloc, TeamDetailState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CustomTextField(
                  label: "ID Team",
                  controller: _teamIdCtrl,
                  onChange: (value) => _validation(),
                  hintText: "",
                ),
                if (state is GetDetailDataLoading)
                  const Positioned(
                    top: 20,
                    bottom: 0,
                    right: 10,
                    child: LoadingWidget(),
                  ),
                if (state is TeamDetailError)
                  const Positioned(
                    top: 20,
                    bottom: 0,
                    right: 10,
                    child: Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  ),
                if (state is FetchTeamsMemberSuccess)
                  Positioned(
                    top: 20,
                    bottom: 0,
                    right: 10,
                    child: Assets.icons_ic_check_circle.image(width: 20),
                  )
              ],
            ),
            const SizedBox(height: 5),
            Text(
              (state is TeamDetailError || _teamIdCtrl.text.trim().isEmpty)
                  ? _teamIdCtrl.text.trim().isEmpty
                      ? "Vui lòng nhập ID Team"
                      : "ID Team không tồn tại!"
                  : "",
              style: context.textTheme.titleSmall!.copyWith(
                color: Colors.red,
              ),
            ),
          ],
        );
      },
    );
  }

  _validation() {
    _teamDetailBloc.add(FetchTeamDetailEvent(_teamIdCtrl.text.trim()));
  }
}
