import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';
import 'package:ui/ui.dart';

import '../marshop_bloc.dart';

class RegisterMarshopPackScreen extends StatefulWidget {
  static String routeName = 'register-marshop-pack';
  const RegisterMarshopPackScreen({super.key});

  @override
  State<RegisterMarshopPackScreen> createState() =>
      _RegisterMarshopPackScreenState();
}

class _RegisterMarshopPackScreenState extends State<RegisterMarshopPackScreen> {
  ListMarshopRegisterPackBloc get _bloc =>
      context.read<ListMarshopRegisterPackBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.add(GetListDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseAppBar(
        title: "Chọn gói Marshop",
        isClose: false,
      ),
    );
  }
}
