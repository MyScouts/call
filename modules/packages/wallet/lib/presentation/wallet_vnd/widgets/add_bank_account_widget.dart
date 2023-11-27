import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:wallet/presentation/presentation.dart';

import '../../../../wallet.dart';
import '../bank_account/bloc/bank_account_bloc.dart';

class AddBankAccountWidget extends StatelessWidget {
  const AddBankAccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => context.addBankAccount(
        bankAccountBloc: context.read<BankAccountBloc>(),
      ),
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 0,
      leading: ImageWidget(IconAppConstants.communityCharity, width: 25),
      title: Text(
        'Thêm tài khoản ngân hàng',
        style: context.text.titleSmall
            ?.copyWith(fontWeight: FontWeight.w500, fontSize: 16),
      ),
    );
  }
}
