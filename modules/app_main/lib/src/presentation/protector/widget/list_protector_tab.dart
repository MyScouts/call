import 'package:app_main/src/core/utils/loading_indicator/platform_loading.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/protector/controller/manage_protector_controller.dart';
import 'package:app_main/src/presentation/protector/widget/user_list_title_widget.dart';
import 'package:flutter/material.dart';

class ListProtectorTab extends StatefulWidget {
  const ListProtectorTab({super.key});

  @override
  State<ListProtectorTab> createState() => _ListProtectorTabState();
}

class _ListProtectorTabState extends State<ListProtectorTab>
    with AutomaticKeepAliveClientMixin {
  late final controller = getIt<ManageProtectController>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Danh sách người đang bảo hộ',
              style: TextStyle(fontSize: 14, color: Color(0xff8C8C8C)),
            ),
            ListenableBuilder(
              listenable: controller,
              builder: (_, __) {
                if (controller.isLoading) {
                  return const Center(
                      child: PlatformLoadingIndicator(size: 20));
                }
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  itemBuilder: (_, index) => UserListTitleWidget(
                    user: controller.users[index],
                  ),
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemCount: controller.users.length,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
