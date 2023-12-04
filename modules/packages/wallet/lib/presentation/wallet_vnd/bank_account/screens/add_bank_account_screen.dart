import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilehub_core/mobilehub_core.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:ui/ui.dart';
import 'package:wallet/presentation/presentation.dart';
import 'package:wallet/presentation/shared/widgets/toast_message/toast_message.dart';

import '../../../../domain/entities/bank/bank.dart';
import '../../../wallet_constant.dart';
import '../../widgets/bank_widget.dart';
import '../../widgets/qrcode_widget.dart';
import '../bloc/bank_account_bloc.dart';

class AddBankAccountScreen extends StatefulWidget {
  static const String routeName = '/add-bank-account';

  const AddBankAccountScreen({super.key});

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

  List<Bank> banks = [];

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

    _pageCtrl.dispose();

    super.dispose();
  }

  bool get validation =>
      _selectedBank != null &&
      _bankAccountHolderCtrl.text.isNotEmpty &&
      _bankNumberCtrl.text.isNotEmpty;

  late final PageController _pageCtrl = PageController(initialPage: 0);
  String _titleAppbar = 'Thêm liên kết ngân hàng';

  @override
  Widget build(BuildContext context) {
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
        appBar: BaseAppBar(
          title: _titleAppbar,
          onPressed: () {
            if (_pageCtrl.page == 0) {
              Navigator.pop(context);
            } else {
              _pageCtrl.jumpToPage(0);
              _titleAppbar = 'Thêm liên kết ngân hàng';
              setState(() {});
            }
            context.hideKeyboard();
          },
          isClose: false,
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
                banks = context.read<BankAccountBloc>().banks;

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.horizontal),
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _pageCtrl,
                    children: [
                      _buildFirstPage(),
                      _buildSecondPage(),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Duration debounce = const Duration(milliseconds: 300);

  _buildFirstPage() {
    const double itemHeight = 120;
    final double itemWidth = MediaQuery.of(context).size.width / 3;

    return Builder(
      builder: (context) {
        return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Chọn ngân hàng liên kết',
                style: context.text.titleMedium?.copyWith(
                  color: const Color((0xFF101B28)),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 24 / 16,
                ),
              ),
              const SizedBox(height: 15),
              FormElement(
                name: 'searchBank',
                isRequired: true,
                hintText: 'Nhập tên ngân hàng cần tìm',
                onChanged: (value) {
                  EasyDebounce.debounce(
                    'SEARCH_BANK',
                    debounce,
                    () => _bloc.add(
                      BankAccountEvent.searchBank(search: value ?? ''),
                    ),
                  );
                },
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(15),
                  child: Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: itemWidth / itemHeight,
                  children: banks
                      .map(
                        (bank) => DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: _selectedBank?.id != bank.id
                                  ? Colors.transparent
                                  : const Color(0xFF4B84F7),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              _selectedBank = bank;
                              setState(() {});
                            },
                            child: BankWidget(bank: bank),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: 15),
              PrimaryButton(
                title: 'TIẾP THEO',
                onTap: () {
                  _titleAppbar = '${_selectedBank?.shortName}';
                  _pageCtrl.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeIn,
                  );
                  setState(() {});
                },
                disabled: _selectedBank == null,
                width: double.infinity,
              ),
            ],
          ),
        );
      },
    );
  }

  _buildSecondPage() {
    final isShowKeyboard = MediaQuery.of(context).viewInsets.bottom.toInt() > 0;

    return AutoHideKeyboard(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                const Text(
                  'Vui lòng đảm bảo chính xác thông tin đã cung cấp',
                  style: TextStyle(
                    color: Color(0xFF6E6E6E),
                    fontSize: 14,
                    height: 20 / 14,
                  ),
                ),
                FormElement(
                  isRequired: true,
                  name: BankAccountField.bankAccountHolder.name,
                  title: BankAccountField.bankAccountHolder.title,
                  hintText: BankAccountField.bankAccountHolder.hintText,
                  controller: _bankAccountHolderCtrl,
                  keyBoardType: TextInputType.text,
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                FormElement(
                  isRequired: true,
                  name: BankAccountField.bankAccountNumber.name,
                  title: BankAccountField.bankAccountNumber.title,
                  hintText: BankAccountField.bankAccountNumber.hintText,
                  controller: _bankNumberCtrl,
                  keyBoardType: TextInputType.number,
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
                        BankAccountEvent.uploadImage(file: value),
                      );
                    }
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Visibility(
                visible: !isShowKeyboard,
                child: PrimaryButton(
                  title: 'TIẾP THEO',
                  onTap: () {
                    final params = AddBankAccountParams(
                      bank: _selectedBank,
                      bankNumber: _bankNumberCtrl.text,
                      bankHolderName: _bankAccountHolderCtrl.text,
                      qrImage: qrImage,
                      isDefault: false,
                    );
                    _bloc.setAddBankAccountParams(params);
                    _bloc.add(const BankAccountEvent.getOtp());
                  },
                  disabled: !validation,
                  width: double.infinity,
                ),
              ),
            ),
          ),
        ],
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
