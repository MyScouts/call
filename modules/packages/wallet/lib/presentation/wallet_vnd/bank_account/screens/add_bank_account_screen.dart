import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilehub_core/mobilehub_core.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:wallet/presentation/presentation.dart';
import 'package:wallet/presentation/shared/widgets/toast_message/toast_message.dart';

import '../../../../domain/entities/bank/bank.dart';
import '../../../shared/widgets/gradiant_button.dart';
import '../../../wallet_constant.dart';
import '../../widgets/qrcode_widget.dart';
import '../bloc/bank_account_bloc.dart';

class AddBankAccountScreen extends StatefulWidget {
  static const String routeName = '/add-bank-account';

  const AddBankAccountScreen({Key? key}) : super(key: key);

  @override
  State<AddBankAccountScreen> createState() => _AddBankAccountScreenState();
}

class _AddBankAccountScreenState extends State<AddBankAccountScreen>
    with ValidationMixin {
  final _bankCtrl = TextEditingController();
  final _bankAccountHolderCtrl = TextEditingController();
  final _bankNumberCtrl = TextEditingController();
  Bank? _selectedBank;
  String? qrImage;

  late final paddingBottom = MediaQuery.of(context).padding.bottom;

  late final _bloc = context.read<BankAccountBloc>();

  AddBankAccountParams get addBankAccountParams => AddBankAccountParams();

  @override
  void initState() {
    _bloc.add(const BankAccountEvent.getAllBanksInfo());
    super.initState();
  }

  @override
  void dispose() {
    _bankCtrl.dispose();
    _bankAccountHolderCtrl.dispose();
    _bankNumberCtrl.dispose();
    super.dispose();
  }

  bool get validation =>
      _selectedBank != null &&
      _bankAccountHolderCtrl.text.isNotEmpty &&
      _bankNumberCtrl.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final isShowKeyboard = MediaQuery.of(context).viewInsets.bottom.toInt() > 0;

    return BlocListener<BankAccountBloc, BankAccountState>(
      listener: (context, state) {
        state.whenOrNull(
          getOtpSuccess: () {
            hideLoading();
            context.verifyOtpBankAccount(bankAccountBloc: _bloc);
          },
          uploadImageSuccess: (imgUrl) {
            qrImage = imgUrl;
          },
          error: (err) {
            hideLoading();
            context.showToastText(err);
          },
          getOtpLoading: showLoading,
        );
      },
      child: Scaffold(
        appBar: appbarBuilder(
          context,
          title: 'Thêm tài khoản ngân hàng',
          hasBottom: true,
        ),
        body: BlocBuilder<BankAccountBloc, BankAccountState>(
          buildWhen: (previous, current) =>
              current.whenOrNull(
                getAllBanksInfoSuccess: () => true,
              ) ??
              false,
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const LoadingWidget(),
              getAllBanksInfoSuccess: () {
                return Stack(
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 70),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: context.horizontal,
                              ),
                              child: SelectBankWidget(
                                onSelectedBank: (Bank bank) {
                                  _selectedBank = bank;
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                context.horizontal,
                                0,
                                context.horizontal,
                                20,
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(height: 10),
                                  FormElement(
                                    isRequired: true,
                                    name:
                                        BankAccountField.bankAccountNumber.name,
                                    title: BankAccountField
                                        .bankAccountNumber.title,
                                    hintText: BankAccountField
                                        .bankAccountNumber.hintText,
                                    controller: _bankNumberCtrl,
                                    keyBoardType: TextInputType.number,
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                  ),
                                  FormElement(
                                    name:
                                        BankAccountField.bankAccountHolder.name,
                                    title: BankAccountField
                                        .bankAccountHolder.title,
                                    hintText: BankAccountField
                                        .bankAccountHolder.hintText,
                                    controller: _bankAccountHolderCtrl,
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                  ),
                                  const SizedBox(height: 5),
                                  QrCodeWidget(
                                    isChecked: false,
                                    qrCodeFile: (value) {
                                      if (value != null) {
                                        _bloc.add(
                                          BankAccountEvent.uploadImage(
                                              file: value),
                                        );
                                      }
                                    },
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).padding.bottom),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Visibility(
                          visible: !isShowKeyboard,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: context.horizontal,
                            ),
                            child: GradiantButton(
                              onPressed: validation
                                  ? () {
                                      final params = AddBankAccountParams(
                                        bank: _selectedBank,
                                        bankNumber: _bankNumberCtrl.text,
                                        bankHolderName:
                                            _bankAccountHolderCtrl.text,
                                        qrImage: qrImage,
                                        isDefault: false,
                                      );
                                      _bloc.setAddBankAccountParams(params);
                                      _bloc
                                          .add(const BankAccountEvent.getOtp());
                                    }
                                  : null,
                              child: const Text('TIẾP THEO'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class AddBankAccountParams {
  Bank? bank;
  String? bankNumber;
  String? bankHolderName;
  String? otpCode;
  String? qrImage;
  bool? isDefault;

  AddBankAccountParams({
    this.bankNumber,
    this.bank,
    this.bankHolderName,
    this.otpCode,
    this.qrImage,
    this.isDefault,
  });
}
