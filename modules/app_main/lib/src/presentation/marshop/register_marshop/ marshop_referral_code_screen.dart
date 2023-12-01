import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/marshop/marshop_payload.dart';
import 'package:app_main/src/presentation/marshop/marshop_bloc.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';
import 'package:ui/ui.dart';

class MarshopReferralCodeScreen extends StatefulWidget {
  static const String routeName = 'marshop-referral-code-screen';
  const MarshopReferralCodeScreen({super.key});

  @override
  State<MarshopReferralCodeScreen> createState() =>
      _MarshopReferralCodeScreenState();
}

class _MarshopReferralCodeScreenState extends State<MarshopReferralCodeScreen> {
  GetListMarshopBloc get _listMarshopBloc => injector.get();

  @override
  void initState() {
    super.initState();
    _listMarshopBloc.add(
        GetListDataParam1Event(GetListMarshopPayload(page: 1, pageSize: 10)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _listMarshopBloc,
      child: Scaffold(
        appBar: const BaseAppBar(
          isClose: false,
          title: "ID MarShop giới thiệu",
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: paddingHorizontal),
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
