import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/blocs/user_action/user_action_cubit.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/data/models/responses/follow_response.dart';
import 'package:app_main/src/presentation/social/profile/profile_bloc.dart';
import 'package:app_main/src/presentation/social/profile/widgets/user_info_header.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';

import '../social_constants.dart';

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
  late int _userId;
  final ValueNotifier<bool> _friendStatus = ValueNotifier(false);
  final UserActionCubit _actionBloc = injector.get<UserActionCubit>();
  GetUserByIdBloc get _userByIdBloc => context.read<GetUserByIdBloc>();
  final ValueNotifier<DiaryCategory> _categoryCtrl = ValueNotifier(
    DiaryCategory.personal,
  );
  final ValueNotifier<GetUserFollowDetailResponse?> _followInfo =
      ValueNotifier(null);
  late final _userCubit = context.read<UserCubit>();
  late User _authInfo;

  bool get isMe => _authInfo.id.toString() == widget.userId;

  @override
  void initState() {
    super.initState();
    _authInfo = _userCubit.currentUser!;
    _userCubit.getOnboarding();
    _userId = int.parse(widget.userId ?? _authInfo.id.toString());
    _userByIdBloc.add(GetDetailDataParam1Event(_userId));
    _actionBloc.getFollowUser(userId: _userId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _actionBloc,
      child: BlocListener<UserActionCubit, UserActionState>(
        listener: (context, state) {
          if (state is GetFollowUserSuccess) {
            _followInfo.value = state.followDetail;
          }

          if (state is OnFollowUser || state is OnUnFollow) {
            showLoading();
          }
          if (state is FollowUserSuccess) {
            hideLoading();
            _friendStatus.value = true;
            if (state.approvalRequired) {
              showToastMessage(
                  "Yêu cầu theo dõi đã được gởi đến người bảo hộ.");
            } else {
              showToastMessage("Theo dõi người dùng thành công.");
            }
          }

          if (state is FollowUserFail) {
            hideLoading();
            showToastMessage(state.message, ToastMessageType.error);
          }

          if (state is UnFollowSuccess) {
            hideLoading();
            _friendStatus.value = false;
            showToastMessage("Bỏ theo dõi người dùng thành công.");
          }

          if (state is UnFollowFail) {
            hideLoading();
            _friendStatus.value = false;

            showToastMessage(state.message, ToastMessageType.error);
          }
        },
        child: Scaffold(
          backgroundColor: const Color(0XFFF3F8FF),
          body: Builder(
            builder: (context) {
              final useByIdrBloc = context.watch<GetUserByIdBloc>().state;
              final userBloc = context.watch<UserCubit>().state;
              if (useByIdrBloc is GetDetailDataLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (useByIdrBloc is GetDetailDataSuccess) {
                final userInfo = useByIdrBloc.data;

                return Column(
                  children: [
                    UserInfoHeader(
                      userInfo: userInfo,
                      friendStatusCtrl: _friendStatus,
                      isMe: isMe,
                      followInfoCtrl: _followInfo,
                      authInfo: _authInfo,
                      onBoarding: userBloc is OnboardingSuccess
                          ? userBloc.onboarding
                          : null,
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(top: 20),
                        decoration: const BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            )),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: paddingHorizontal,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                  color: const Color(0XFFFAFAFA),
                                  borderRadius: BorderRadius.circular(12)),
                              child: ValueListenableBuilder(
                                valueListenable: _categoryCtrl,
                                builder: (context, value, child) {
                                  return Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: DiaryCategory.values
                                        .map((e) => Expanded(
                                              child: Row(
                                                children: [
                                                  if (DiaryCategory.values
                                                          .indexOf(e) !=
                                                      0)
                                                    Container(
                                                      margin: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 5),
                                                      width: .5,
                                                      height: 40,
                                                      color: Colors.grey[200],
                                                    ),
                                                  Expanded(
                                                    child: GestureDetector(
                                                      onTap: () => _categoryCtrl
                                                          .value = e,
                                                      child: Container(
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          color: value == e
                                                              ? Colors.white
                                                              : Colors
                                                                  .transparent,
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            e.getName(),
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              height: 20 / 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: value == e
                                                                  ? context
                                                                      .theme
                                                                      .primaryColor
                                                                  : Colors.grey[
                                                                      500],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ))
                                        .toList(),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
