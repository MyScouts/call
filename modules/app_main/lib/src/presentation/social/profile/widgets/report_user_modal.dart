import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user_action/user_action_cubit.dart';
import 'package:app_main/src/data/models/payloads/user/user_action_payload.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:ui/ui.dart';

class ReportUserModal extends StatefulWidget {
  final User userInfo;
  const ReportUserModal({
    super.key,
    required this.userInfo,
  });

  @override
  State<ReportUserModal> createState() => _ReportUserModalState();
}

class _ReportUserModalState extends State<ReportUserModal> {
  final TextEditingController _contentCtrl = TextEditingController();
  final ValueNotifier<bool> _formValidCtrl = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _contentCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (p0, isKeyboardVisible) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: isKeyboardVisible
                ? MediaQuery.of(context).viewInsets.bottom
                : 0,
          ),
          child: Container(
            padding: const EdgeInsets.only(
              left: paddingHorizontal,
              right: paddingHorizontal,
              bottom: 30,
            ),
            decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(width: .1)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.arrow_back_ios),
                          ),
                        ),
                      ),
                      Text(
                        "Báo cáo",
                        style: context.text.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Bạn muốn báo cáo điều gì về tài khoản này?",
                  style: context.textTheme.titleMedium!.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 5),
                Text(
                  "Báo cáo của bạn sẽ ở dạng ẩn danh, trừ khi đó là báo về hành vi vi phạm pháp luật. Nếu ai đó đang gặp nguy hiểm đừng ngần ngại mà hãy báo ngay cho dịch vụ khẩn cấp tại địa phương.",
                  style: context.textTheme.labelMedium!.copyWith(
                    color: AppColors.grey14,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Nhập nội dung báo cáo",
                  style: context.textTheme.titleMedium!.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 5),
                TextField(
                  textInputAction: TextInputAction.done,
                  controller: _contentCtrl,
                  maxLines: 5,
                  onChanged: (value) {
                    _formValidCtrl.value = value.trim().isNotEmpty;
                  },
                  decoration:
                      const InputDecoration(hintText: "Nhập nội dung báo cáo"),
                ),
                const SizedBox(height: 20),
                ValueListenableBuilder(
                  valueListenable: _formValidCtrl,
                  builder: (context, isValid, child) {
                    return PrimarySolidButton(
                      title: "Gửi báo cáo",
                      onTap: () => context.read<UserActionCubit>().reportUser(
                          userId: widget.userInfo.id.toString(),
                          payload: ReportUserPayload(
                            content: _contentCtrl.text.trim(),
                          )),
                      disabled: !isValid,
                      color: AppColors.red500,
                      width: null,
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
