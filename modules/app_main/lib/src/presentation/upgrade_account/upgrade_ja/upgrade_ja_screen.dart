import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/shared/extensions/validation_extension.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_ja/widgets/accept_term_with_checkbox_widget.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_ja/widgets/read_more_policy.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';
import 'package:ui/ui.dart';

import '../../../data/models/responses/upgrade_account_response.dart';
import '../../../domain/entities/bank.dart';
import '../../../domain/usecases/community_usecase.dart';
import '../../community/groups/group_listing_bloc.dart';
import 'upgrade_agree_policy.bloc.dart';

class UpgradeJAScreen extends StatefulWidget {
  static const String routeName = '/upgrade-ja';
  final Team? team;

  const UpgradeJAScreen({super.key, this.team});

  @override
  State<UpgradeJAScreen> createState() => _UpgradeJAScreenState();
}

class _UpgradeJAScreenState extends State<UpgradeJAScreen> with ValidationMixin {
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
  final _bossTeamIDCtrl = TextEditingController();

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

  final _teamJA = UpdateInformationType.idBossTeamJA;
  final _groupJA = UpdateInformationType.idGroupJA;
  final _bankJA = UpdateInformationType.bank;

  UpgradeAccountBloc get upgradeAccountBloc => context.read();

  GetListGroupsBloc get listGroupsBloc => context.read();

  GetListTeamsBloc get listTeamsBloc => context.read();

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

  void _onListenUpgradeAgreePolicyBloc(BuildContext context, state) {
    if (state is GetDetailDataLoading) {
      showLoading();
    } else if (state is GetDetailDataSuccess<UpgradeAccountResponse>) {
      hideLoading();
      final dataRes = state.data.copyWith(teamId: _currentTeam?.codeId);

      //TODO: go to verify OTP
      // context.startDialogVerifyPhoneOTP(dataRes, type).then((value) {
      //   if (value != null && value) {
      //     delayAndPopScreen(context).then((value) {
      //       context.read<UserBloc>().add(UserUpgradeAccountEvent(type));
      //     });
      //   }
      // });
    } else if (state is GetDetailError) {
      hideLoading();
      final e = state.error;
      if (e is DioError) {
        final message = e.toMessage(context);
        showToastMessage(message, ToastMessageType.warning);
      } else {
        final message = 'Lỗi đăng ký, Vui lòng thử lại.'
            ' ${kDebugMode ? state.error.toString() : ''}';
        showToastMessage(message, ToastMessageType.error);
      }
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
            // BlocBuilder<UserCubit, UserState>(
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
      body: BlocConsumer<UpgradeAccountBloc, GetDetailState>(
          listener: _onListenUpgradeAgreePolicyBloc,
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const ReadMorePolicy(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: AcceptTermWithCheckboxWidget(acceptTerm: _acceptTerm),
                  ),
                  if (widget.team == null)
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, MediaQuery.of(context).padding.bottom + 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Form(
                            key: _formBossTeamIDKey,
                            child: InformationFieldWidget(
                              required: false,
                              onChanged: validateBossTeamID,
                              controller: _bossTeamIDCtrl,
                              type: UpdateInformationType.bossTeamId,
                              validator: (text) {
                                return validatorBossTeamId;
                              },
                            ),
                          ),
                          BlocBuilder<GetListGroupsBloc, GetListState>(
                            builder: (context, state) {
                              var groups = <Group>[];
                              if (state is GetListDataSuccess<Group>) {
                                groups = state.data;
                              }

                              return SearchInputInformationWidget<Group>(
                                type: _groupJA,
                                required: true,
                                controller: _groupIDCtrl,
                                maxSuggestionsInViewPort: 4,
                                onSelected: (value) {
                                  if (value != null) {
                                    _currentGroup = value;
                                    listTeamsBloc.add(
                                      GetListDataParam1Event(value.id),
                                    );
                                  }
                                },
                                initialValue: _currentGroup != null
                                    ? SuggestionsField(
                                        name: _currentGroup?.name ?? '',
                                        data: _currentGroup!,
                                        avatar: _currentGroup?.avatar,
                                      )
                                    : null,
                                suggestions: groups
                                    .map(
                                      (e) => SuggestionsField(
                                        name: e.name ?? '',
                                        data: e,
                                        avatar: e.avatar,
                                      ),
                                    )
                                    .toList(),
                                onChanged: (val) {
                                  if (val != null && val == (_currentGroup?.name ?? '')) {
                                    return;
                                  }
                                  if (val != (_currentGroup?.name ?? '')) {
                                    _teamIDCtrl.clear();
                                    _bossTeamIDCtrl.clear();
                                    setState(() {
                                      _currentGroup = null;
                                      _currentTeam = null;
                                    });
                                  }
                                },
                              );
                            },
                          ),
                          BlocBuilder<GetListTeamsBloc, GetListState>(
                            builder: (context, state) {
                              var teams = <Team>[];
                              if (state is GetListDataSuccess<Team>) {
                                teams = state.data;
                              }

                              return SearchInputInformationWidget<Team>(
                                type: _teamJA,
                                controller: _teamIDCtrl,
                                required: true,
                                maxSuggestionsInViewPort: 7,
                                initialValue: _currentTeam != null
                                    ? SuggestionsField(
                                        name: _currentTeam?.name ?? '',
                                        data: _currentTeam!,
                                        avatar: _currentTeam?.avatar,
                                      )
                                    : null,
                                onSelected: (value) {
                                  setState(() {
                                    _currentTeam = value;
                                  });
                                },
                                suggestions: teams.reversed
                                    .map(
                                      (e) => SuggestionsField(
                                        name: e.name ?? '',
                                        data: e,
                                        avatar: e.avatar,
                                      ),
                                    )
                                    .toList(),
                                onChanged: (val) {
                                  if (val != null && val == (_currentTeam?.name ?? '')) {
                                    return;
                                  }

                                  if (val != (_currentTeam?.name ?? '')) {
                                    setState(() {
                                      _currentTeam = null;
                                    });
                                  }
                                },
                              );
                            },
                          ),
                          ValueListenableBuilder(
                            valueListenable: _acceptTerm,
                            builder: (_, __, ___) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                child: PrimaryButton(
                                  title: S.current.register,
                                  onTap: () {

                                  },
                                  disabled: !isValid
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            );
          }),
    );
  }
}
