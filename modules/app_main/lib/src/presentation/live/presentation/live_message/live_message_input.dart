import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/services/notification_center.dart';
import 'package:app_main/src/presentation/live/presentation/live_message/state/live_message_bloc.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class LiveMessageInput extends StatefulWidget {
  const LiveMessageInput({super.key});

  @override
  State<LiveMessageInput> createState() => _LiveMessageInputState();
}

class _LiveMessageInputState extends State<LiveMessageInput> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 0, 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      maxLines: null,
                      controller: controller,
                      autofocus: true,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        fillColor: const Color(0xffF4F4F4),
                        hintText: 'Soạn tin nhắn',
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffACACAC),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide:
                              const BorderSide(color: Color(0xff4B84F7)),
                        ),
                      ),
                    ),
                  ),
                  ListenableBuilder(
                      listenable: controller,
                      builder: (_, __) {
                        final disable = controller.text.trim().isEmpty;
                        return GestureDetector(
                          onTap: disable
                              ? null
                              : () {
                                  context
                                      .read<LiveMessageBloc>()
                                      .add(SendEvent(controller.text));
                                  FocusScope.of(context).unfocus();
                                  NotificationCenter.post(channel: showOption);
                                },
                          behavior: HitTestBehavior.opaque,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: SizedBox.square(
                              dimension: 40,
                              child: Center(
                                child: ImageWidget(
                                  IconAppConstants.icLiveSend,
                                  color: disable
                                      ? AppColors.grey2
                                      : Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom,
            ),
          ],
        ),
      ),
    );
  }
}
