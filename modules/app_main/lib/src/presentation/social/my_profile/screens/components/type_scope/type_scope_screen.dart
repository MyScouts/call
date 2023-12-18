import 'package:app_main/src/presentation/app_coordinator.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';
import 'package:app_main/src/presentation/social/widgets/social_appbar_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imagewidget/imagewidget.dart';

class TypeScopeScreen extends StatefulWidget {
  static const String routeName = "type_scope";

  const TypeScopeScreen({
    required this.postType,
    required this.typeScopeSelected,
    this.isScreen = false,
    this.onChange,
    super.key,
  });
  final PostType postType;
  final ScopeType typeScopeSelected;
  final bool isScreen;
  final Function(ScopeType)? onChange;

  @override
  State<TypeScopeScreen> createState() => _TypeScopeScreenState();
}

class _TypeScopeScreenState extends State<TypeScopeScreen> {
  late ScopeType typeScopeSelected;

  @override
  void initState() {
    super.initState();
    typeScopeSelected = widget.typeScopeSelected;
  }

  @override
  Widget build(BuildContext context) {
    final paddingBottom = MediaQuery.viewPaddingOf(context).bottom;
    if(!widget.isScreen) return _buildBody();
    return Scaffold(
      appBar: const SocialAppBarWidget(
        titleText: 'Đối tượng của bài viết',
      ),
      body: _buildBody(),
      bottomSheet: Container(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            context.pop(data: typeScopeSelected);
          },
          child: Container(
            margin:
                EdgeInsets.symmetric(horizontal: 16, vertical: paddingBottom),
            height: 48,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  AppColors.blue36,
                  AppColors.blue37,
                ],
              ),
            ),
            child: const Center(
              child: Text(
                'Xong',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Ai có thể xem được bài viết của bạn?',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 16),
        _buildScope(
          scopeType: ScopeType.public,
          subtitle: 'Bất kỳ ai cũng có thể xem bài viết của bạn',
        ),
        _buildScope(
          scopeType: ScopeType.friend,
          subtitle: 'Chỉ bạn bè của bạn mới có thể xem bài viết',
        ),
        if (widget.postType.isVideo || widget.postType.isFilm)
          _buildScope(
            scopeType: ScopeType.follower,
            subtitle:
                'Chỉ những người hâm mộ đã theo dõi bạn mới có thể xem video',
          ),
        _buildScope(
          scopeType: ScopeType.onlyMe,
          subtitle: 'Chỉ mình tôi',
        ),
      ],
    );
  }

  Widget _buildScope({
    required ScopeType scopeType,
    required String subtitle,
  }) {
    return Container(
      height: 72.h,
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: customRadioTile<ScopeType>(
          onChanged: (ScopeType? value) {
            setState(() {
              typeScopeSelected = value!;
              if(widget.onChange != null){
                widget.onChange!(typeScopeSelected);
              }
            });
          },
          groupValue: typeScopeSelected,
          value: scopeType,
          secondary: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 2),
                child: ImageWidget(
                  scopeType.iconName,
                  width: 24,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  scopeType.text,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.greyLightTextColor,
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget customRadioTile<T>({
    required Function(T?) onChanged,
    required Widget child,
    required T groupValue,
    required T value,
    required Widget secondary,
  }) {
    return InkWell(
      onTap: () {
        onChanged(value);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              children: [
                secondary,
                Expanded(child: child),
              ],
            ),
          ),
          SizedBox(
            height: 20,
            width: 20,
            child: Radio<T>(
              value: value,
              groupValue: groupValue,
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
