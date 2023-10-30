import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/shared/extensions/validation_extension.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';
import 'package:ui/ui.dart';

import '../../../domain/entities/bank.dart';
import 'upgrade_agree_policy.bloc.dart';

class UpdateBankAccountScreen extends StatefulWidget {
  static const String routeName = '/update-bank-account';
  const UpdateBankAccountScreen({super.key});

  @override
  State<UpdateBankAccountScreen> createState() => _UpdateBankAccountScreenState();
}

class _UpdateBankAccountScreenState extends State<UpdateBankAccountScreen> with ValidationMixin {
  final _bankCtrl = TextEditingController();
  final _bankAccountHolderCtrl = TextEditingController();
  final _bankNumberCtrl = TextEditingController();
  Bank? _selectedBank;

  bool get validation =>
      _selectedBank != null && _bankAccountHolderCtrl.text.isNotEmpty && _bankNumberCtrl.text.isNotEmpty;

  final _bankJA = UpdateInformationType.bank;

  GetListBanksBloc get listBanksBloc => context.read();

  @override
  void dispose() {
    _bankCtrl.dispose();
    _bankAccountHolderCtrl.dispose();
    _bankNumberCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isShowKeyboard = MediaQuery.of(context).viewInsets.bottom.toInt() > 0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(15),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: context.horizontal),
            color: AppColors.grey13,
            height: 2,
          ),
        ),
        bottomOpacity: 1,
        elevation: 0.0,
        shape: const Border(bottom: BorderSide(color: Colors.white)),
        title: Text(
          'Thêm tài khoản ngân hàng',
          style: context.text.titleMedium?.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          padding: const EdgeInsets.all(2),
          icon: const Icon(Icons.arrow_back),
          onPressed: Navigator.of(context).pop,
        ),
      ),
      body: AutoHideKeyboard(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.horizontal),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 70),
                  child: Column(
                    children: [
                      BlocBuilder<GetListBanksBloc, GetListState>(
                        builder: (context, state) {
                          var banks = <Bank>[];

                          if (state is GetListDataSuccess<Bank>) {
                            banks = state.data;
                          }

                          return SearchInputInformationWidget<Bank>(
                            type: _bankJA,
                            required: true,
                            maxSuggestionsInViewPort: 5,
                            controller: _bankCtrl,
                            onSelected: (value) {
                              if (value != null) {
                                setState(() {
                                  _selectedBank = value;
                                });

                                _bankAccountHolderCtrl.clear();
                                _bankNumberCtrl.clear();
                              }
                            },
                            initialValue: _selectedBank != null
                                ? SuggestionsField(
                                    name: _selectedBank!.name ?? '',
                                    img: _selectedBank?.logo,
                                    data: _selectedBank!,
                                  )
                                : null,
                            suggestions: banks
                                .map(
                                  (e) => SuggestionsField(name: e.name ?? '', img: e.logo, data: e),
                                )
                                .toList(),
                            validator: (value) => context.validateEmptyInfo(
                              _selectedBank?.name,
                              'Bạn phải chọn Ngân hàng',
                            ),
                            onChanged: (val) {
                              if (val != null && val == (_selectedBank?.name ?? '')) {
                                return;
                              }
                              _bankAccountHolderCtrl.clear();
                              _bankNumberCtrl.clear();
                              setState(() {
                                _selectedBank = null;
                              });
                            },
                          );
                        },
                      ),
                      InformationFieldWidget(
                        required: true,
                        controller: _bankNumberCtrl,
                        onChanged: (value) {
                          setState(() {});
                        },
                        textInputType: TextInputType.number,
                        type: UpdateInformationType.bankNumber,
                        validator: (value) => context.validateEmptyInfo(
                          value,
                          'Vui lòng nhập số tài khoản',
                        ),
                      ),
                      InformationFieldWidget(
                        required: true,
                        controller: _bankAccountHolderCtrl,
                        onChanged: (value) {
                          setState(() {});
                        },
                        type: UpdateInformationType.bankAccountHolder,
                        validator: (value) {
                          return context.validateEmptyInfo(
                            value,
                            'Vui lòng nhập tên chủ tài khoản',
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Visibility(
                  visible: !isShowKeyboard,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: context.horizontal),
                    child: PrimaryButton(
                      title: 'TIẾP THEO',
                      onTap: () {
                        // final params = AddBankAccountParams(
                        //   bank: _selectedBank,
                        //   bankNumber: _bankNumberCtrl.text,
                        //   bankHolderName: _bankAccountHolderCtrl.text,
                        //   qrImage: qrImage,
                        //   isDefault: false,
                        // );
                        // _bloc.setAddBankAccountParams(params);
                        // _bloc.add(const BankAccountEvent.getOtp());
                      },
                      disabled: !validation,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
