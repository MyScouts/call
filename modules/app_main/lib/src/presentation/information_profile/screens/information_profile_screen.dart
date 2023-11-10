import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/information_profile/widgets/update_information_profile.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

class InformationProfileScreen extends StatefulWidget {
  static const String routeName = "information_profile";
  const InformationProfileScreen({super.key});

  @override
  State<InformationProfileScreen> createState() => _InformationProfileScreenState();
}

class _InformationProfileScreenState extends State<InformationProfileScreen> with ValidationMixin {
  @override
  Widget build(BuildContext context) {
    return ScaffoldHideKeyboard(
      appBar: const BaseAppBar(
        title: "Thông tin tài khoản",
        hideActionButtons: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListView(
          children: [
            _buildToolbar(),
            const SizedBox(height: 20),
            Container(height: 20, color: AppColors.bgColor),
            _buildEmpty()
          ],
        ),
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
              fontWeight: FontWeight.bold,
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
                fontWeight: FontWeight.bold,
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
          bottom: 25,
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
                    right: 0,
                    child: ImageWidget(
                      ImageConstants.imageCamera,
                      width: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Thanh Vân",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Container(
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
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "ID: VN44446501321",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: AppColors.grey15,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const UpdateInformationProfileScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }
}
