import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/profile/state/user_profile_bloc.dart';
import 'package:app_main/src/presentation/profile/widget/profile_none_pdone_view.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

import 'edit_profile_empty.dart';

class InfoEmpty extends StatefulWidget {
  const InfoEmpty({super.key});

  @override
  State<InfoEmpty> createState() => _InfoEmptyState();
}

class _InfoEmptyState extends State<InfoEmpty> {
  bool _isUpdate = false;

  @override
  void initState() {
    super.initState();
  }

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
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.width *
                                    168 /
                                    393,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xff225C9D),
                                      Color(0xff38B3FA),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            bottom: -32,
                            left: 0,
                            right: 0,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: const Color(0xffE9F3FF),
                                    border: Border.all(
                                      color: const Color(0xffF3F8FF),
                                      width: 3,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: ImageWidget(
                                    IconAppConstants.icLiveArea,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
                            );
                          }

                          if (state.pDoneProfile == null) {
                            return _Empty(
                              onUpdate: () {
                                setState(() {
                                  _isUpdate = true;
                                });
                              },
                            );
                          }

                          return ProfileNonePDoneView(
                            onBack: () {
                              setState(() {
                                _isUpdate = true;
                              });
                            },
                          );
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

class _Empty extends StatelessWidget {
  const _Empty({super.key, required this.onUpdate});

  final Function() onUpdate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: SizedBox.square(
            dimension: MediaQuery.of(context).size.width * 200 / 375,
            child: ImageWidget(ImageConstants.profileEmpty),
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          'Chưa có thông tin',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Rất tiếc, chưa có thông tin nào được lưu',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xff667385),
          ),
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: onUpdate,
          child: const Text(
            'Cập nhật thông tin',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xff4B84F7),
            ),
          ),
        )
      ],
    );
  }
}