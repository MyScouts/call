import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/profile/state/user_profile_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (context, state) {
        final user = state.user;

        if (user == null) {
          return const SizedBox.shrink();
        }

        return Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 168 / 393,
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
              child: CachedNetworkImage(
                imageUrl: user.defaultBackground ?? '',
                errorWidget: (_, __, ___) {
                  return const SizedBox.shrink();
                },
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
              bottom: 8,
              right: 8,
              child: GestureDetector(
                onTap: () {
                  context.read<UserProfileBloc>().add(PickBgImage());
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(7.0),
                  child: const Icon(
                    CupertinoIcons.camera_fill,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
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
        );
      },
    );
  }
}
