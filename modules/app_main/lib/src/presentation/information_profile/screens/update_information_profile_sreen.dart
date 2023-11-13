import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/presentation/information_profile/screens/body_update_information_profile.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_ja/upgrade_agree_policy.bloc.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_pdone/bloc/place_information/place_information_bloc.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_pdone/bloc/upgrade_pdone/upgrade_pdone_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class UpdateInformationProfileScreen extends StatefulWidget {
  final User authInfo;
  final UserCubit userCubit;

  const UpdateInformationProfileScreen({
    super.key,
    required this.authInfo,
    required this.userCubit,
  });

  @override
  State<UpdateInformationProfileScreen> createState() => _UpdateInformationProfileScreenState();
}

class _UpdateInformationProfileScreenState extends State<UpdateInformationProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldHideKeyboard(
      resizeToAvoidBottomInset: true,
      appBar: const BaseAppBar(
        title: "Thông tin tài khoản",
        isClose: false,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => injector<UpgradePDoneBloc>(),
          ),
          BlocProvider(
            create: (context) => injector<GetListBanksBloc>(),
          ),
          BlocProvider(
            create: (context) => injector<PlaceInformationBloc>(),
          ),
        ],
        child: Builder(
          builder: (c) {
            return BodyUpdateInformationProfile(
              userCubit: widget.userCubit,
              authInfo: widget.authInfo,
            );
          },
        ),
      ),
    );
  }
}
