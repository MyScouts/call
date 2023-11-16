import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/presentation/information_profile/bloc/bloc/information_update_profil_bloc.dart';
import 'package:app_main/src/presentation/information_profile/bloc/cubit/information_pdone_profile_cubit.dart';
import 'package:app_main/src/presentation/information_profile/screens/body_information_profile.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class InformationProfileScreen extends StatefulWidget {
  static const String routeName = "information_profile";
  const InformationProfileScreen({super.key});

  @override
  State<InformationProfileScreen> createState() => _InformationProfileScreenState();
}

class _InformationProfileScreenState extends State<InformationProfileScreen> with ValidationMixin {
  @override
  Widget build(BuildContext context) {
    return ScaffoldHideKeyboard(
      appBar: const BaseAppBar(
        title: "Thông tin tài khoản",
        isClose: false,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => injector<UserCubit>(),
          ),
          BlocProvider(
            create: (context) => injector<InformationPdoneProfileCubit>(),
          ),
          BlocProvider(
            create: (context) => injector<InformationUpdateProfilBloc>(),
          ),
        ],
        child: Builder(
          builder: (c) {
            return const BodyInformationProfile();
          },
        ),
      ),
    );
  }
}
