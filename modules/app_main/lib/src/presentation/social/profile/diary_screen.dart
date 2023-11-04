import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/social/widgets/pdone_header_widget.dart';
import 'package:flutter/material.dart';

import '../../../blocs/user/user_cubit.dart';

class DiaryScreen extends StatefulWidget {
  static const String routeName = "diary";
  final String? userId;
  const DiaryScreen({
    super.key,
    required this.userId,
  });

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  late final _userCubit = context.read<UserCubit>();
  late User? _userInfo;
  @override
  void initState() {
    super.initState();
    _userInfo = _userCubit.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          HeaderProfilePdoneWidget(
            isMe: true,
            userInfo: _userInfo,
            isLoading: false,
            userId: widget.userId,
          ),
        ],
      )),
    );
  }
}
