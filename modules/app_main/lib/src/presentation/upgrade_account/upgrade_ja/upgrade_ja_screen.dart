import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/shared/extensions/validation_extension.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_ja/widgets/accept_term_with_checkbox_widget.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_ja/widgets/read_more_policy.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import '../../../domain/entities/bank.dart';
import '../../../domain/usecases/community_usecase.dart';
import 'upgrade_agree_policy.bloc.dart';

class UpgradeJAScreen extends StatefulWidget {
  static const String routeName = '/upgrade-ja';
  final Team? team;

  const UpgradeJAScreen({super.key, this.team});

  @override
  State<UpgradeJAScreen> createState() => _UpgradeJAScreenState();
}

class _UpgradeJAScreenState extends State<UpgradeJAScreen> {
  String _getTitleAppBar() {
    if (widget.team != null) {
      return "Đăng ký tham gia ${widget.team?.name ?? ''}";
    }
    return 'HỢP ĐỒNG CỘNG TÁC VIÊN JA';
  }

  final _acceptTerm = ValueNotifier(false);
  bool get isValid => widget.team != null
      ? _acceptTerm.value
      : _acceptTerm.value && _teamIDCtrl.text.isNotEmpty && _groupIDCtrl.text.isNotEmpty;

  final _teamIDCtrl = TextEditingController();
  final _groupIDCtrl = TextEditingController();


  @override
  void dispose() {
    _teamIDCtrl.dispose();
    _acceptTerm.dispose();
    _groupIDCtrl.dispose();

    super.dispose();
  }
  // validator Boss Team Id
  String? validatorBossTeamId;
  final GlobalKey<FormState> _formBossTeamIDKey = GlobalKey();

  Group? _currentGroup;
  Team? _currentTeam;
  Bank? _currentBank;

  UpgradeAccountBloc get upgradeAccountBloc => context.read();
  //
  // GetListGroupsBloc get listGroupsBloc => context.read();
  //
  // GetListTeamsBloc get listTeamsBloc => context.read();

  GetListBanksBloc get listBanksBloc => context.read();

  GetGroupDetailByBossIDBloc get getGroupDetailByBossIDBloc => context.read();

  Future<void> validateBossTeamID(String? text) async {
    final validate = context.validateformatPDoneAccount(text, 'Boss Team ID không hợp lệ!');

    if (validate != null) {
      validatorBossTeamId = validate;
      _formBossTeamIDKey.currentState!.validate();
      if (_currentGroup != null || _currentGroup != null) {
        if (_currentGroup != null) {
          _currentGroup = null;
          _groupIDCtrl.clear();
        }

        if (_currentTeam != null) {
          _currentTeam = null;
          _teamIDCtrl.clear();
        }
        setState(() {});
      }
      return;
    }

    final id = text!.trim();
    const errMsg = 'Boss Team ID không tồn tại';

    try {
      final res = await injector.get<CommunityUsecase>().checkBossTeamId(id);
      validatorBossTeamId = res ? null : errMsg;
      _formBossTeamIDKey.currentState!.validate();

      if (res) {
        // getGroupDetailByBossIDBloc.add(GetDetailDataParam1Event(id));
      }
    } catch (e) {
      validatorBossTeamId = errMsg;
      _formBossTeamIDKey.currentState!.validate();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(_getTitleAppBar()),
            ),
            //TODO: pdoneId
            // BlocBuilder<UserBloc, UserState>(
            //   builder: (context, state) {
            //     final pDoneId = state.currentUser?.pDoneId ?? '';
            //     return Text(
            //       'Số: ${pDoneId}JA',
            //       style: Theme.of(context)
            //           .textTheme
            //           .bodyMedium!
            //           .copyWith(color: const Color(0xff828282)),
            //     );
            //   },
            // ),
            Text(
              'Số: VN2A32345678JA',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color(0xff828282)),
            ),
          ],
        ),
        centerTitle: true,
        titleSpacing: 0,
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.all(2),
          icon: const Icon(Icons.arrow_back),
          onPressed: Navigator.of(context).pop,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ReadMorePolicy(),
            AcceptTermWithCheckboxWidget(acceptTerm: _acceptTerm),
          ],
        ),
      ),
    );
  }
}
