import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/presentation/information_profile/screens/update_information_profile_sreen.dart';
import 'package:app_main/src/presentation/information_profile/widgets/update_information_profile_mixin.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class BodyInformationProfile extends StatefulWidget {
  const BodyInformationProfile({super.key});

  @override
  State<BodyInformationProfile> createState() => _BodyInformationProfileState();
}

class _BodyInformationProfileState extends State<BodyInformationProfile> with UpdateInformationProfileMixin {
  late final userCubit = context.read<UserCubit>();

  late User _authInfo;

  @override
  void initState() {
    super.initState();
    _authInfo = userCubit.currentUser!;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListView(
        children: [
          _buildToolbar(),
          const SizedBox(height: 20),
          ValueListenableBuilder(
            valueListenable: isUpdateChanged,
            builder: (_, isUpdate, __) {
              if (isUpdate) {
                return Container();
              }
              return Container(height: 20, color: AppColors.bgColor);
            },
          ),
          ValueListenableBuilder(
            valueListenable: isUpdateChanged,
            builder: (_, isUpdate, __) {
              if (isUpdate) {
                return _buildInformation();
              }
              return _buildEmpty();
            },
          ),
        ],
      ),
    );
  }

  Container _buildInformation() {
    return Container(
      padding: const EdgeInsets.only(right: 15, left: 15, bottom: 20),
      decoration: const BoxDecoration(
        color: AppColors.bgColor,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Thông tin cá nhân",
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).push(_createRoute(isEdit: true)),
                child: const Text(
                  "Chỉnh sửa",
                  style: TextStyle(
                    color: AppColors.blueEdit,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          _buildPersonalInformation(),
          const SizedBox(height: 20),
          _buildAddressInformation(),
          const SizedBox(height: 20),
          _buildBankInformation(),
          const SizedBox(height: 20),
          _buildMoreInformation(),
        ],
      ),
    );
  }

  Container _buildPersonalInformation() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Họ và tên",
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              Text(
                _authInfo.getdisplayName,
                style: const TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Nickname",
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              Text(
                _authInfo.getdisplayName,
                style: const TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Giới tính",
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              Text(
                _authInfo.getdisplayName,
                style: const TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Ngày sinh",
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              Text(
                _authInfo.getBirthday,
                style: const TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Email",
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              Text(
                _authInfo.getEmail,
                style: const TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Container _buildAddressInformation() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Địa chỉ thường trú",
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              Text(
                _authInfo.getAddress,
                style: const TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Địa chỉ hiện tại",
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              Text(
                _authInfo.getAddress,
                style: const TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Số CCCD",
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              Text(
                _authInfo.getNickname,
                style: const TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Ngày cấp",
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              Text(
                _authInfo.getBirthday,
                style: const TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Nơi cấp",
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              Text(
                _authInfo.getAddress,
                style: const TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Container _buildBankInformation() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Tên ngân hàng",
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              Text(
                _authInfo.getdisplayName,
                style: const TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Số tài khoản",
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              Text(
                _authInfo.getdisplayName,
                style: const TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Chủ tài khoản",
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              Text(
                _authInfo.getdisplayName,
                style: const TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _buildMoreInformation() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Học vấn",
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              Text(
                _authInfo.getdisplayName,
                style: const TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Sở thích",
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              Text(
                _authInfo.getdisplayName,
                style: const TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _buildEmpty() {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageWidget(
            ImageConstants.imageEmpty,
          ),
          const Text(
            "Chưa có thông tin",
            style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Rất tiếc, chưa có thông tin nào được lưu",
            style: TextStyle(
              color: AppColors.grey15,
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () => Navigator.of(context).push(_createRoute()),
            child: const Text(
              "Cập nhật thông tin",
              style: TextStyle(
                color: AppColors.blue32,
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Stack _buildToolbar() {
    return Stack(
      children: [
        Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 180,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.blue16,
                        AppColors.blue11,
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: ImageWidget(
                    ImageConstants.imageCamera,
                    width: 35,
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 100,
              decoration: const BoxDecoration(
                color: AppColors.white,
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(120),
                    ),
                    child: ClipRRect(
                      child: ImageWidget(
                        ImageConstants.defaultUserAvatar,
                        borderRadius: 100,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 5,
                    child: ImageWidget(
                      ImageConstants.imageType,
                      width: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _authInfo.getdisplayName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(width: 5),
                    _authInfo.getIsJA
                        ? Container(
                            width: 30,
                            height: 16,
                            decoration: BoxDecoration(
                              color: AppColors.blue32,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              "JA",
                              style: TextStyle(
                                color: AppColors.white,
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
              Visibility.maintain(
                visible: _authInfo.getIsHasNickname,
                child: Text(
                  _authInfo.getNickname,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: AppColors.grey15,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "ID: ${_authInfo.pDoneId}",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Route _createRoute({bool isEdit = false}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => UpdateInformationProfileScreen(
        authInfo: _authInfo,
        userCubit: userCubit,
        isEdit: isEdit,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }
}
