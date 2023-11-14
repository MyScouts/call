import 'package:app_main/src/core/utils/loading_indicator/platform_loading.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/protector/controller/manage_protector_controller.dart';
import 'package:app_main/src/presentation/protector/widget/protector_request_card_widget.dart';
import 'package:flutter/material.dart';

class ListProtectorRequestTab extends StatefulWidget {
  const ListProtectorRequestTab({super.key});

  @override
  State<ListProtectorRequestTab> createState() => _ListProtectorTabState();
}

class _ListProtectorTabState extends State<ListProtectorRequestTab>
    with AutomaticKeepAliveClientMixin {
  late final controller = getIt<ListProtectorRequestController>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
                  itemBuilder: (_, index) => RequestCardWidget(
                    request: controller.requests[index],
                    onReply: (value) async {
                      final req = controller.requests[index];
                      context.showLoading();
                      final ok = await controller.request(req.id, value);
                      if (!mounted) return;
                      context.hideLoading();
                      if (ok) {
                        context.showToastMessage('Yêu cầu thành công');
                      } else {
                        context.showToastMessage(
                          'Yêu cầu thất bại',
                          ToastMessageType.error,
                        );
                      }
                    },
                  ),
                  separatorBuilder: (_, __) => const Divider(
                    height: 16,
                    thickness: 1,
                  ),
                  itemCount: controller.requests.length,
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
