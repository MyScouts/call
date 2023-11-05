import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/presentation/social/profile/diary_screen.dart';
import 'package:app_main/src/presentation/social/profile/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class SocialRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        DiaryScreen.routeName: (context) {
          final args = settings.arguments as Map<String, dynamic>;
          return BlocProvider.value(
            value: context.read<UserCubit>(),
            child: BlocProvider(
              create: (context) => injector.get<GetUserByIdBloc>(),
              child: DiaryScreen(
                userId: args['userId'],
              ),
            ),
          );
        },
      };
}
