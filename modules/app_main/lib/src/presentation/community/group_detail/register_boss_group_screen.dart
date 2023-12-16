import 'package:app_main/src/presentation/community/community_coordinator.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_account_constants.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:ui/ui.dart';

import '../../information_profile/bloc/bloc/information_update_profil_bloc.dart';
import '../../marshop/widgets/accept_term_with_checkbox_widget.dart';
import '../../upgrade_account/upgrade_ja/widgets/read_more_policy.dart';

class RegisterBossGroupScreen extends StatefulWidget {
  static const routeName = '/register-boss-group';

  const RegisterBossGroupScreen({super.key});

  @override
  State<RegisterBossGroupScreen> createState() =>
      _RegisterBossGroupScreenState();
}

class _RegisterBossGroupScreenState extends State<RegisterBossGroupScreen> {
  final _acceptTerm = ValueNotifier(false);
  late final informationBloc = context.read<InformationUpdateProfilBloc>();
  bool isPdoneOver18 = false;

  @override
  void dispose() {
    _acceptTerm.dispose();
    super.dispose();
  }

  @override
  void initState() {
    informationBloc.add(GetInformationPDoneProfileEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        isClose: false,
        title: 'Đăng ký Boss Group',
      ),
      body: BlocBuilder<InformationUpdateProfilBloc,
          InformationUpdateProfilState>(
        builder: (context, state) {
          if (state is GetInformationPDoneProfileSuccess) {
            isPdoneOver18 = state.user.profile.type == PDoneType.adult;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          isPdoneOver18
                              ? Assets.icons_shape_check_success.image(
                                  width: 25,
                                  fit: BoxFit.cover,
                                )
                              : Assets.icons_shape_check_fail.image(
                                  width: 25,
                                  fit: BoxFit.cover,
                                ),
                          const SizedBox(width: 5),
                          Text(
                            'P-Done trên 18 tuổi',
                            style: context.text.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Điều khoản và chính sách',
                      style: context.text.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        height: 24 / 16,
                      ),
                    ),
                  ),
                  const ReadMorePolicy(maxLine: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: AcceptTermWithCheckboxWidget(
                      acceptTerm: _acceptTerm,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ValueListenableBuilder(
                    valueListenable: _acceptTerm,
                    builder: (_, __, ___) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).padding.bottom + 20,
                          right: 20,
                          left: 20,
                          top: 10,
                        ),
                        child: PrimaryButton(
                          width: MediaQuery.of(context).size.width,
                          title: S.current.register,
                          onTap: () {
                            context.startConfirmContract();
                          },
                          disabled: !_acceptTerm.value || !isPdoneOver18,
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
