import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:ui/ui.dart';
import 'package:wallet/core/core.dart';
import 'package:wallet/presentation/shared/model/infomation_pdone_profile.dart';

import '../../../shared/bloc/wallet_bloc.dart';
import '../../../shared/widgets/app_bar.dart';
import '../bloc/bank_account_bloc.dart';
import 'add_bank_account_screen.dart';

class ConfirmInformationScreen extends StatefulWidget {
  final AddBankAccountParams confirmBankAccountParams;
  static const String routeName = '/confirm-bank-account-information';

  const ConfirmInformationScreen({
    super.key,
    required this.confirmBankAccountParams,
  });

  @override
  State<ConfirmInformationScreen> createState() =>
      _ConfirmInformationScreenState();
}

class _ConfirmInformationScreenState extends State<ConfirmInformationScreen> {
  late final params = widget.confirmBankAccountParams;
  late final _bloc = context.read<BankAccountBloc>();
  final _walletBloc = injector.get<WalletBloc>();

  @override
  void initState() {
    _walletBloc.add(const WalletEvent.getPDoneProfile());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AutoHideKeyboard(
      child: Scaffold(
        appBar: appbarBuilder(
          context,
          title: 'Xác nhận thông tin',
          leading: IconButton(
            padding: const EdgeInsets.all(2),
            icon: const Icon(Icons.arrow_back),
            onPressed: context.popNavigator,
          ),
        ),
        body: BlocBuilder<WalletBloc, WalletState>(
          bloc: _walletBloc,
          buildWhen: (previous, current) =>
              current.whenOrNull(
                getPDoneProfileSuccess: (walletInfo) => true,
                getPDoneProfileFailed: (mess) => true,
              ) ??
              false,
          builder: (context, state) {
            return state.maybeWhen(
                orElse: () => const LoadingWidget(),
                getPDoneProfileSuccess: (pdone) {
                  return Column(
                    children: [
                      const SizedBox(height: 15),
                      _buildUserInfo(pdone),
                      const SizedBox(height: 15),
                      const Divider(
                          color: WalletTheme.dividerColor, thickness: 8),
                      const SizedBox(height: 15),
                      _buildBankAccountInfo(),
                      if (params.qrImage != null && params.qrImage!.isNotEmpty)
                        _buildQrWidget(),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(
                          right: context.horizontal,
                          left: context.horizontal,
                          bottom: MediaQuery.of(context).padding.bottom,
                        ),
                        child: PrimaryButton(
                          title: 'Hoàn thành',
                          onTap: () {
                            _bloc.add(const BankAccountEvent.getOtp());
                          },
                          disabled: false,
                          width: double.infinity,
                        ),
                      ),
                    ],
                  );
                });
          },
        ),
      ),
    );
  }

  _buildQrWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: context.horizontal,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Mã QR',
            style: context.text.titleMedium?.copyWith(
              color: const Color(0xFF101B28),
              height: 20 / 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF4F4F4),
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.all(8),
            child: ImageWidget(params.qrImage!, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }

  _buildUserInfo(PDoneProfile profile) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.horizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'THÔNG TIN CÁ NHÂN',
            style: context.text.titleMedium?.copyWith(
              color: const Color(0xFF667385),
              fontWeight: FontWeight.w400,
              height: 20 / 14,
            ),
          ),
          const SizedBox(height: 15),
          _buildInfoWidget(
            title: 'Họ và tên',
            content:
                '${profile.firstName}${' ${profile.middleName ?? ''}'}${profile.lastName}',
          ),
          _buildInfoWidget(
            title: 'Số CMNN/CCCD',
            content: '${profile.identityNumber}',
          ),
        ],
      ),
    );
  }

  _buildBankAccountInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.horizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'THÔNG TIN TÀI KHOẢN NGÂN HÀNG',
            style: context.text.titleMedium?.copyWith(
              color: const Color(0xFF667385),
              fontWeight: FontWeight.w400,
              height: 20 / 14,
            ),
          ),
          const SizedBox(height: 15),
          _buildInfoWidget(
            title: 'Tên ngân hàng',
            content: '${params.bank?.shortName}',
          ),
          _buildInfoWidget(
            title: 'Số thẻ/ Số tài khoản',
            content: '${params.bankNumber}',
          ),
          _buildInfoWidget(
            title: 'Tên chủ tài khoản',
            content: '${params.bankHolderName}',
          ),
        ],
      ),
    );
  }

  _buildInfoWidget({required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.text.titleMedium?.copyWith(
              color: const Color(0xFF101B28),
              height: 20 / 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            content,
            style: context.text.titleMedium?.copyWith(
              color: const Color(0xFF00452E),
              height: 20 / 14,
            ),
          ),
        ],
      ),
    );
  }
}
