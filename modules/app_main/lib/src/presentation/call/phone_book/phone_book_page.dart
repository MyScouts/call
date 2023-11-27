//import 'dart:developer' as developer;
import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/presentation/call/widgets/avatar_caller_widget.dart';
import 'package:app_main/src/presentation/call/widgets/tag_widget.dart';
import 'package:app_main/src/presentation/social/profile/diary_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

import 'tabs/all_friends/all_friends_tab.dart';
import 'tabs/call_history/call_history_tab.dart';

class PhoneBookPage extends StatefulWidget {
  static const routeName = 'PhoneBookPage';

  const PhoneBookPage({super.key});

  @override
  PhoneBookPageState createState() => PhoneBookPageState();
}

class PhoneBookPageState extends State<PhoneBookPage> {
  late final userCubit = context.read<UserCubit>();
  late User _authInfo;
  int _pageState = 0;

  @override
  void initState() {
    super.initState();
    _authInfo = userCubit.currentUser!;
    userCubit.onboarding();
    userCubit.fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              onTap: () => context.startDiary(userId: _authInfo.id.toString()),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: AppColors.lineColor,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                      offset: Offset(0, 1.8),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        AvatarCallerWidget(
                          avatar: _authInfo.avatar,
                          size: 50,
                        ),
                      ],
                    ),
                    kSpacingWidth12,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              _authInfo.getdisplayName,
                              style: context.textTheme.titleMedium!.copyWith(
                                fontSize: 16,
                                color: AppColors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        kSpacingHeight2,
                        Text(
                          _authInfo.pDoneId ?? '',
                          style: context.textTheme.titleMedium!.copyWith(
                            fontSize: 12,
                            color: AppColors.grey14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 24),
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      decoration: BoxDecoration(
                        color: AppColors.bgFa,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            Expanded(
                              child: TagWidget(
                                title: 'Tất cả',
                                isSelected: _pageState == 0,
                                onTap: () {
                                  setState(() {
                                    _pageState = 0;
                                  });
                                },
                              ),
                            ),
                            kSpacingWidth10,
                            const VerticalDivider(
                              color: AppColors.lineColor,
                              thickness: 1,
                            ),
                            kSpacingWidth10,
                            Expanded(
                              child: TagWidget(
                                title: 'Gần đây',
                                isSelected: _pageState == 1,
                                onTap: () {
                                  setState(() {
                                    _pageState = 1;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    TextFieldSearch(
                      radius: 32,
                      enabled: false,
                      suggestions: [],
                      contentPadding: const EdgeInsets.all(8),
                    ),
                    kSpacingHeight18,
                    if (_pageState == 0)
                      GestureDetector(
                        onTap: () {
                          //todo
                        },
                        child: Row(
                          children: [
                            ImageWidget(IconAppConstants.icUserGroup3),
                            kSpacingWidth12,
                            Text(
                              'Tạo cuộc gọi nhóm mới',
                              style: context.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.blueEdit,
                              ),
                            ),
                          ],
                        ),
                      ),
                    kSpacingHeight18,
                    Expanded(
                      child: _pageState == 0 ? const AllFriendsTab() : const CallHistoryTab(),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
