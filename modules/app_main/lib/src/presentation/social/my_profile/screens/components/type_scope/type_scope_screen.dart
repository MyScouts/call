import 'package:app_main/src/presentation/app_coordinator.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class TypeScopeScreen extends StatefulWidget {
  static const String routeName = "type_scope";

  const TypeScopeScreen(
      {required this.postType, required this.typeScopeSelected, super.key});
  final PostType postType;
  final ScopeType typeScopeSelected;

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

    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
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
          if (widget.postType.isVideo)
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
      ),
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
            child: Center(
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

  Widget _buildScope({
    required ScopeType scopeType,
    required String subtitle,
  }) {
    return RadioListTile<ScopeType>(
      title: Text(
        scopeType.text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      value: scopeType,
      groupValue: typeScopeSelected,
      onChanged: (ScopeType? value) {
        setState(() {
          typeScopeSelected = value!;
        });
      },
      secondary: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageWidget(scopeType.iconName, width: 24, height: 24),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Text(
          subtitle,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.greyLightTextColor,
          ),
        ),
      ),
      controlAffinity: ListTileControlAffinity.trailing,
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        'Đối tượng của bài viết',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      elevation: 0,
      shape: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
      ),
    );
  }
}
