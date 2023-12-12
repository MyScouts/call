import 'package:app_core/app_core.dart';
import 'package:app_main/src/domain/entities/chat/member_model.dart';
import 'package:app_main/src/presentation/call/phone_book_detail/phone_book_detail_page.dart';
import 'package:app_main/src/presentation/call/1vs1/bloc/call_1vs1_bloc.dart';
import 'package:app_main/src/presentation/call/1vs1/views/call_1vs1_screen.dart';
import 'package:app_main/src/presentation/call/service/models/call_service_models.dart';
import 'package:app_main/src/presentation/call/stringee_bloc/stringee_bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'phone_book/phone_book_page.dart';

@injectable
class CallRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        PhoneBookPage.routeName: (context) {
          return const PhoneBookPage();
        },
        PhoneBookDetailPage.routeName: (context) {
          return PhoneBookDetailPage(
            data: settings.arguments as MemberModel,
          );
        },
    Call1vs1Screen.routeName: (context) {
      final args = settings.arguments as Map;
      final Call1vs1Bloc bloc = args['bloc'] ??
          Call1vs1Bloc(
            injector.get(
              param1: CallServiceContext(
                client: context.read<StringeeBloc>().state.client,
                call: args['call'],
                userCall2: args['userCall2'] ?? false,
              ),
            ),
            injector.get(),
            injector.get(),
            injector.get(),
            args['participant'],
            args['callType'],
          );
      return BlocProvider(
        create: (context) => bloc,
        child: Call1vs1Screen(
          callType: bloc.state.callType,
        ),
      );
    },
      };
}
