import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/bloc.dart';
import 'package:app_main/src/data/models/responses/resource_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';

class TeamAndCondictionV2Screen extends StatefulWidget {
  static const String routeName = 'team-condiction-v2';
  const TeamAndCondictionV2Screen({super.key});

  @override
  State<TeamAndCondictionV2Screen> createState() =>
      _TeamAndCondictionV2ScreenState();
}

class _TeamAndCondictionV2ScreenState extends State<TeamAndCondictionV2Screen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector.get<GetGlobalSettingBloc>()
        ..add(GetDetailDataParam1Event('term_condiction')),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Điều khoản chính sách'),
          centerTitle: true,
          titleSpacing: 0,
          elevation: 0,
          leading: IconButton(
            padding: const EdgeInsets.all(2),
            icon: const Icon(Icons.arrow_back),
            onPressed: Navigator.of(context).pop,
          ),
        ),
        body: BlocBuilder<GetGlobalSettingBloc, GetDetailState>(
          builder: (context, state) {
            if (state is GetDetailDataLoading) return const LoadingWidget();

            if (state is GetDetailDataSuccess<GlobalSettingResponse>) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child:
                    SingleChildScrollView(child: Html(data: state.data.value)),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
