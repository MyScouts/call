import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/extensions/list_extension.dart';
import 'package:app_main/src/presentation/profile/state/user_profile_bloc.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ProfileNonePDoneView extends StatelessWidget {
  const ProfileNonePDoneView({super.key, required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (_, state) {
        return ColoredBox(
          color: const Color(0xffF3F8FF),
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Column(
              children: [
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
                const SizedBox(height: 12),
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
                              'Họ và tên',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${state.pDoneProfile?.firstName ?? ''} ${state.pDoneProfile?.middleName ?? ''} ${state.pDoneProfile?.lastName ?? ''}',
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
                    ].separated(const SizedBox(height: 12)),
                  ),
                ),
                // Container(
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(16),
                //   ),
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 12,
                //     vertical: 12,
                //   ),
                //   child: Row(
                //     children: [
                //       Expanded(
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           mainAxisSize: MainAxisSize.min,
                //           children: <Widget>[
                //             const Text(
                //               'Họ và tên',
                //               style: TextStyle(
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.w600,
                //                 color: Colors.black,
                //               ),
                //             ),
                //             const Text(
                //               'Nickname',
                //               style: TextStyle(
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.w600,
                //                 color: Colors.black,
                //               ),
                //             ),
                //             const Text(
                //               'Giới tính',
                //               style: TextStyle(
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.w600,
                //                 color: Colors.black,
                //               ),
                //             ),
                //             const Text(
                //               'Ngày sinh',
                //               style: TextStyle(
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.w600,
                //                 color: Colors.black,
                //               ),
                //             ),
                //             const Text(
                //               'Email',
                //               style: TextStyle(
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.w600,
                //                 color: Colors.black,
                //               ),
                //             ),
                //           ].separated(const SizedBox(height: 20)),
                //         ),
                //       ),
                //       Expanded(
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: <Widget>[
                //             Text(
                //               '${state.pDoneProfile?.firstName ?? ''} ${state.pDoneProfile?.middleName ?? ''} ${state.pDoneProfile?.lastName ?? ''}',
                //               style: const TextStyle(
                //                 fontSize: 14,
                //                 color: Colors.black,
                //               ),
                //             ),
                //             Text(
                //               state.pDoneProfile?.nickName ?? '',
                //               style: const TextStyle(
                //                 fontSize: 14,
                //                 color: Colors.black,
                //               ),
                //             ),
                //             Text(
                //               state.pDoneProfile?.sex == 0 ? "Nam" : "Nữ",
                //               style: const TextStyle(
                //                 fontSize: 14,
                //                 color: Colors.black,
                //               ),
                //             ),
                //             Text(
                //               '${state.pDoneProfile?.birthday}',
                //               style: const TextStyle(
                //                 fontSize: 14,
                //                 color: Colors.black,
                //               ),
                //             ),
                //             const Text(
                //               '',
                //               style: TextStyle(
                //                 fontSize: 14,
                //                 color: Colors.black,
                //               ),
                //             ),
                //           ].separated(const SizedBox(height: 20)),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // const SizedBox(height: 12),
                // Container(
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(16),
                //   ),
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 12,
                //     vertical: 12,
                //   ),
                //   child: Row(
                //     children: [
                //       Expanded(
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           mainAxisSize: MainAxisSize.min,
                //           children: <Widget>[
                //             const Text(
                //               'Địa chỉ thường trú',
                //               style: TextStyle(
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.w600,
                //                 color: Colors.black,
                //               ),
                //             ),
                //             const Text(
                //               'Địa chỉ hiện tại',
                //               style: TextStyle(
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.w600,
                //                 color: Colors.black,
                //               ),
                //             ),
                //             const Text(
                //               'Số CCCD',
                //               style: TextStyle(
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.w600,
                //                 color: Colors.black,
                //               ),
                //             ),
                //             const Text(
                //               'Ngày cấp',
                //               style: TextStyle(
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.w600,
                //                 color: Colors.black,
                //               ),
                //             ),
                //             const Text(
                //               'Nơi cấp',
                //               style: TextStyle(
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.w600,
                //                 color: Colors.black,
                //               ),
                //             ),
                //           ].separated(const SizedBox(height: 20)),
                //         ),
                //       ),
                //       Expanded(
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: <Widget>[
                //             Text(
                //               '${state.pDoneProfile?.birthPlace.wardName ?? ''},'
                //               ' ${state.pDoneProfile?.birthPlace.districtName ?? ''},'
                //               ' ${state.pDoneProfile?.birthPlace.provinceName ?? ''}',
                //               style: const TextStyle(
                //                 fontSize: 14,
                //                 color: Colors.black,
                //               ),
                //             ),
                //             Text(
                //               '${state.pDoneProfile?.currentPlace.wardName ?? ''},'
                //                   ' ${state.pDoneProfile?.currentPlace.districtName ?? ''},'
                //                   ' ${state.pDoneProfile?.currentPlace.provinceName ?? ''}',
                //               style: const TextStyle(
                //                 fontSize: 14,
                //                 color: Colors.black,
                //               ),
                //             ),
                //             Text(
                //               state.pDoneProfile?.identityNumber ?? '',
                //               style: const TextStyle(
                //                 fontSize: 14,
                //                 color: Colors.black,
                //               ),
                //             ),
                //             Text(
                //               '${state.pDoneProfile?.birthday}',
                //               style: const TextStyle(
                //                 fontSize: 14,
                //                 color: Colors.black,
                //               ),
                //             ),
                //             const Text(
                //               '',
                //               style: TextStyle(
                //                 fontSize: 14,
                //                 color: Colors.black,
                //               ),
                //             ),
                //           ].separated(const SizedBox(height: 20)),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
