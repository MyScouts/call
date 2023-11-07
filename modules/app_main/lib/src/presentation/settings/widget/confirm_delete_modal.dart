import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/data/models/payloads/user/user_action_payload.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:ui/ui.dart';

import '../../authentication/widget/custom_text_field.dart';

class ConfirmDeleteModal extends StatefulWidget {
  final int userId;
  const ConfirmDeleteModal({
    super.key,
    required this.userId,
  });

  @override
  State<ConfirmDeleteModal> createState() => _ConfirmDeleteModalState();
}

class _ConfirmDeleteModalState extends State<ConfirmDeleteModal>
    with ValidationMixin {
  final _passwordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: paddingHorizontal,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomBackButton(),
            Text(
              "Xác nhận xoá tài khoản",
              style: context.textTheme.titleMedium!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              S.current.lbl_password.capitalize(),
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF212121),
                  height: 20 / 14,
                  leadingDistribution: TextLeadingDistribution.even),
            ),
            const SizedBox(height: 4),
            Form(
              key: formKey,
              child: CustomTextField(
                controller: _passwordCtrl,
                validator: ValidationHelper.password,
                hintText: "**************",
                onChange: (value) => onValidation(),
                hintStyle: const TextStyle(
                  color: Color(0xFF8C8C8C),
                  fontSize: 14,
                  height: 20 / 14,
                  leadingDistribution: TextLeadingDistribution.even,
                ),
                isPassword: true,
              ),
            ),
            const SizedBox(height: 40),
            validationListenableBuilder(
              builder: (isValid) {
                return PrimaryButton(
                  title: S.current.confirm,
                  onTap: _onDelete,
                  color: Colors.white,
                  disabled: !isValid,
                  width: MediaQuery.of(context).size.width,
                );
              },
            )
          ],
        ),
      ),
    );
  }

  _onDelete() {
    context.read<UserCubit>().deleteUSer(
          userId: widget.userId,
          payload: DeleteUserPayload(
            password: _passwordCtrl.text,
          ),
        );
  }
}
