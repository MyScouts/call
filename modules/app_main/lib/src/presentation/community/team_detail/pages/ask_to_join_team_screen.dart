import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/community/community_coordinator.dart';
import 'package:app_main/src/presentation/community/team_detail/bloc/team_detail_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:ui/ui.dart';

import '../../../marshop/widgets/accept_term_with_checkbox_widget.dart';
import '../../../upgrade_account/upgrade_ja/widgets/read_more_policy.dart';

class AskToJoinTeamScreen extends StatefulWidget {
  final String teamId;
  static const String routeName = '/ask-to-join-team';

  const AskToJoinTeamScreen({super.key, required this.teamId});

  @override
  State<AskToJoinTeamScreen> createState() => _AskToJoinTeamScreenState();
}

class _AskToJoinTeamScreenState extends State<AskToJoinTeamScreen>
    with ValidationMixin {
  final _acceptTerm = ValueNotifier(false);

  late final bloc = context.read<TeamDetailBloc>();

  @override
  void dispose() {
    _acceptTerm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pDoneId = injector.get<UserCubit>().currentUser?.pDoneId;
    return BlocListener<TeamDetailBloc, TeamDetailState>(
      listener: _onAskToJoinListen,
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text('Đăng ký tham gia team'),
              ),
              Text(
                'Số: ${pDoneId}JA',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: const Color(0xff828282)),
              ),
            ],
          ),
          centerTitle: true,
          titleSpacing: 0,
          elevation: 0,
          leading: IconButton(
              padding: const EdgeInsets.all(2),
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop()),
        ),
        body: Column(
          children: [
            const ReadMorePolicy(maxLine: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: AcceptTermWithCheckboxWidget(acceptTerm: _acceptTerm),
            ),
            ValueListenableBuilder(
              valueListenable: _acceptTerm,
              builder: (_, __, ___) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom,
                      right: 20,
                      left: 20,
                      top: 10),
                  child: PrimaryButton(
                    width: MediaQuery.of(context).size.width,
                    title: S.current.register,
                    onTap: () {
                      bloc.add(AskToJoinEvent(widget.teamId));
                    },
                    disabled: !_acceptTerm.value,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onAskToJoinListen(BuildContext context, TeamDetailState state) {
    if (state is AskToJoinLoading) {
      showLoading();
    } else if (state is AskToJoinSuccess) {
      hideLoading();
      context.startAskToJoinTeamSuccess();
    } else if (state is AskToJoinError) {
      hideLoading();
      final e = state.error;
      if (e is DioException) {
        final message = e.toMessage(context);
        showToastMessage(message, ToastMessageType.warning);
      } else {
        final message = 'Lỗi đăng ký, Vui lòng thử lại.'
            ' ${kDebugMode ? state.error.toString() : ''}';
        showToastMessage(message, ToastMessageType.error);
      }
    }
  }
}
