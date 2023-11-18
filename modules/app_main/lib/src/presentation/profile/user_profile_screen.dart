import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/bloc/core_state.dart';
import 'package:app_main/src/core/utils/loading_indicator/platform_loading.dart';
import 'package:app_main/src/presentation/profile/state/user_profile_bloc.dart';
import 'package:app_main/src/presentation/profile/widget/empty_info.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  static const String routerName = '/user-profile';

  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<UserProfileBloc, UserProfileState, StateStatus>(
      selector: (state) => state.status,
      builder: (_, status) {
        if (status.isLoading) {
          return const Material(
            child: Center(
              child: PlatformLoadingIndicator(),
            ),
          );
        }

        return const _Profile();
      },
    );
  }
}

class _Profile extends StatelessWidget {
  const _Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<UserProfileBloc, UserProfileState, bool>(
      selector: (state) => state.isPDone,
      builder: (ctx, isPDone) {
        if(!isPDone) return const InfoEmpty();
        return const SizedBox();
      },
    );
  }
}

