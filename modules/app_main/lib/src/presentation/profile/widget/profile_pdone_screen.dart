import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/extensions/list_extension.dart';
import 'package:app_main/src/presentation/profile/state/user_profile_bloc.dart';
import 'package:app_main/src/presentation/profile/widget/use_header.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_pdone/bloc/upgrade_pdone/upgrade_pdone_bloc.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'edit_profile_empty.dart';

class ProfilePDoneScreen extends StatefulWidget {
  const ProfilePDoneScreen({super.key});

  @override
  State<ProfilePDoneScreen> createState() => _ProfilePDoneScreenState();
}

class _ProfilePDoneScreenState extends State<ProfilePDoneScreen> {
  bool _isUpdate = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (context, state) {
        final user = state.user;

        if (user == null) {
          return const SizedBox.shrink();
        }

        return FocusScope(
          child: Builder(
            builder: (ctx) {
              return Scaffold(
                resizeToAvoidBottomInset: true,
                appBar: AppBar(
                  shape: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  centerTitle: true,
                  title: const Text(
                    'Thông tin tài khoản',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  leading: const BackButton(),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      const UserHeader(),
                      const SizedBox(height: 6),
                      const SizedBox(height: 40),
                      Text(
                        user.getdisplayName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'ID: ${user.pDoneId}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xff6E6E6E),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 12,
                        width: double.infinity,
                        color: const Color(0xffF3F8FF),
                      ),
                      BlocBuilder<UserProfileBloc, UserProfileState>(
                        builder: (ctx, state) {
                          if (_isUpdate) {
                            return EditProfileEmpty(
                              onBack: () {
                                setState(() {
                                  _isUpdate = false;
                                });
                              },
                              isPDone: true,
                            );
                          }

                          return _Profile(onBack: () {
                            setState(() {
                              _isUpdate = true;
                            });
                          });
                        },
                      ),
                      ListenableBuilder(
                        listenable: FocusScope.of(ctx),
                        builder: (_, __) {
                          if (FocusScope.of(ctx).hasFocus) {
                            return SizedBox(
                              height: MediaQuery.of(ctx).size.height / 3,
                            );
                          }

                          return const SizedBox();
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class _Profile extends StatelessWidget {
  const _Profile({super.key, required this.onBack});

  final Function() onBack;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (_, state) {
        return ColoredBox(
          color: const Color(0xffF3F8FF),
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    const Text(
                      "Thông tin cá nhân",
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: onBack,
                      child: const Text(
                        'Chỉnh sửa',
                        style: TextStyle(
                          color: Color(0xff4B84F7),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Họ',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              state.pDoneProfile?.firstName ?? '',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Tên đệm',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              state.pDoneProfile?.middleName ?? '',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Tên',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              state.pDoneProfile?.lastName ?? '',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Nickname',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              state.pDoneProfile?.nickName ?? '',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Giới tính',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              state.pDoneProfile?.sex == 1 ? "Nam" : "Nữ",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Ngày sinh',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${state.pDoneProfile?.birthday}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Email',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              state.user?.email ?? '',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ].separated(const SizedBox(height: 20)),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Địa chỉ thường trú',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${state.pDoneProfile?.birthPlace.wardName ?? ''},'
                              ' ${state.pDoneProfile?.birthPlace.districtName ?? ''},'
                              ' ${state.pDoneProfile?.birthPlace.provinceName ?? ''}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Địa chỉ hiện tại',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${state.pDoneProfile?.currentPlace.wardName ?? ''},'
                              ' ${state.pDoneProfile?.currentPlace.districtName ?? ''},'
                              ' ${state.pDoneProfile?.currentPlace.provinceName ?? ''}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Số CCCD',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              state.pDoneProfile?.identityNumber ?? '',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Ngày cấp',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              state.pDoneProfile?.supplyDate ?? '',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Nơi cấp',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              state.pDoneProfile?.supplyAddress ?? '',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ].separated(const SizedBox(height: 20)),
                  ),
                ),
                if (state.info != null)
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Người bảo hộ',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                state.info?.fullName ?? '',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'ID P-DONE',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                state.info?.pDoneId.toString() ?? '',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Số CCCD',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                state.info?.identityNumber ?? '',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Số điện thoại',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                state.info?.phone ?? '',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ].separated(const SizedBox(height: 20)),
                    ),
                  ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Học vấn',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              state.pDoneProfile?.academicLevel ?? '',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Sở thích',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              state.pDoneProfile?.interest ?? '',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ].separated(const SizedBox(height: 20)),
                  ),
                ),
              ].separated(const SizedBox(height: 12)),
            ),
          ),
        );
      },
    );
  }
}
