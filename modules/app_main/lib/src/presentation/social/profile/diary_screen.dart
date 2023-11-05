import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user_action/user_action_cubit.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/social/profile/profile_bloc.dart';
import 'package:app_main/src/presentation/social/profile/widgets/user_info_header.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';

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
  late User? _userInfo;

  GetUserByIdBloc get _userByIdBloc => context.read<GetUserByIdBloc>();
  final ValueNotifier<bool> _friendStatus = ValueNotifier(false);
  UserActionCubit get _actionBloc => injector.get<UserActionCubit>();

  @override
  void initState() {
    super.initState();
    _userByIdBloc.add(GetDetailDataParam1Event(int.parse(widget.userId!)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => _actionBloc,
        child: BlocListener<UserActionCubit, UserActionState>(
          listener: (context, state) {
            if (state is OnFollowUser || state is OnUnFollow) {
              showLoading();
            }
            if (state is FollowUserSuccess) {
              hideLoading();
              _friendStatus.value = true;
              showToastMessage("Theo dõi người dùng thành công.");
            }

            if (state is FollowUserFail) {
              hideLoading();
              showToastMessage(
                "Theo dõi người dùng thất bại.",
                ToastMessageType.error,
              );
            }

            if (state is UnFollowSuccess) {
              hideLoading();
              _friendStatus.value = false;
              showToastMessage("Bỏ theo dõi người dùng thành công.");
            }

            if (state is UnFollowFail) {
              hideLoading();
              _friendStatus.value = false;
              showToastMessage(
                "Bỏ theo dõi người dùng thất bại.",
                ToastMessageType.error,
              );
            }
          },
          child: BlocBuilder<GetUserByIdBloc, GetDetailState>(
            builder: (context, state) {
              debugPrint("$state");
              if (state is GetDetailDataLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is GetDetailDataSuccess) {
                final userInfo = state.data;

                return Column(
                  children: [
                    UserInfoHeader(
                      userInfo: userInfo,
                      friendStatusCtrl: _friendStatus,
                    ),
                  ],
                );
              }
              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
