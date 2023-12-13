import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

enum ProfileType { pDone, ads, unknown }

extension ProfileTypeExtension on ProfileType {
  bool get isPDone => this == ProfileType.pDone;
  bool get isAds => this == ProfileType.ads;
  bool get isUnKnown => this == ProfileType.unknown;
}

class ProfileAvatar extends StatelessWidget {
  final double size;
  final String? avatarUrl;
  final double sizeProfileType;
  final double fontSize;
  final bool isPDone;
  final bool isAds;
  final double profileTypePadding;
  final double avatarPadding;
  final Color backgroundColor;
  const ProfileAvatar({
    this.size = 42,
    this.avatarUrl,
    this.sizeProfileType = 20,
    this.fontSize = 16,
    this.isPDone = false,
    this.isAds = false,
    this.profileTypePadding = 4,
    this.avatarPadding = 8,
    this.backgroundColor = Colors.white,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final url = avatarUrl ?? ImageConstants.defaultUserAvatar;
    final profileType = getProfileType();

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          CircleAvatar(
            radius: size,
            backgroundColor: backgroundColor,
            child: Padding(
              padding: EdgeInsets.all(avatarPadding), // Border radius
              child: ClipOval(
                child: ImageWidget(
                  url,
                  width: size,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          _buildProfileType(profileType),
        ],
      ),
    );
  }

  ProfileType getProfileType() {
    if (isPDone) return ProfileType.pDone;
    if (isAds) return ProfileType.ads;

    return ProfileType.unknown;
  }

  Widget _buildProfileType(ProfileType profileType) {
    if (profileType.isUnKnown) {
      return const SizedBox.shrink();
    }

    String textType = '';
    switch (profileType) {
      case ProfileType.pDone:
        textType = 'P';
      case ProfileType.ads:
        textType = 'A';
      default:
        textType = '';
    }

    return Align(
      alignment: Alignment.bottomRight,
      child: CircleAvatar(
        radius: sizeProfileType / 2,
        backgroundColor: AppColors.white,
        child: Padding(
          padding: EdgeInsets.all(profileTypePadding),
          child: CircleAvatar(
            radius: sizeProfileType / 2,
            backgroundColor: Colors.blue,
            child: Text(
              textType,
              style: TextStyle(
                color: AppColors.white,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
