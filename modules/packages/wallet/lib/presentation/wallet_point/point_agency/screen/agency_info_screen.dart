import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:ui/ui.dart';

import '../../../../../wallet.dart';
import '../../../../core/theme/wallet_theme.dart';
import '../../../../core/utils/input_formatter.dart';
import '../../../../domain/entities/agency/agency_info.dart';
import '../../../shared/widgets/app_bar.dart';
import '../../../shared/widgets/form_element.dart';
import '../../../shared/widgets/gradiant_button.dart';
import '../../../wallet_constant.dart';
import '../../../wallet_coordinator_external.dart';
import '../../wallet_point_constant.dart';
import '../bloc/agency_bloc.dart';

class AgencyInfoScreen extends StatefulWidget {
  static const routeName = '/agency-info';
  final int agencyId;

  const AgencyInfoScreen({Key? key, required this.agencyId}) : super(key: key);

  @override
  State<AgencyInfoScreen> createState() => _AgencyInfoScreenState();
}

class _AgencyInfoScreenState extends State<AgencyInfoScreen>
    with ValidationMixin {
  late final _bloc = context.read<AgencyBloc>();
  final _moneyController = TextEditingController();
  final _coinController = TextEditingController();

  @override
  void initState() {
    _bloc.add(AgencyEvent.getAgencyInfo(widget.agencyId));
    super.initState();
  }

  @override
  void dispose() {
    validationListener.dispose();
    _moneyController.dispose();
    _coinController.dispose();
    super.dispose();
  }

  void handleExchangeTap() {
    final money = num.tryParse(_moneyController.text.replaceAll('.', ''));
    if (money != null) {
      _bloc.add(AgencyEvent.exchange(agencyId: widget.agencyId, value: money));
    }
    onValidation();
  }

  @override
  Widget build(BuildContext context) {
    final isShowKeyboard = MediaQuery.of(context).viewInsets.bottom.toInt() > 0;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: context.hideKeyboard,
      child: Scaffold(
        appBar: appbarBuilder(context, title: 'Thông tin Đại lý'),
        body: Padding(
          padding: EdgeInsets.fromLTRB(
            context.horizontal,
            25,
            context.horizontal,
            MediaQuery.of(context).padding.bottom,
          ),
          child: BlocBuilder<AgencyBloc, AgencyState>(
            buildWhen: (previous, current) =>
                current.whenOrNull(
                  getAgencyInfoSuccess: (info) => true,
                  getAgencyInfoLoading: () => true,
                ) ??
                false,
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => const LoadingWidget(),
                getAgencyInfoSuccess: (agencyInfo) {
                  final minAmount = agencyInfo.listPrice!.isNotEmpty
                      ? agencyInfo.listPrice!.first.vndFrom!
                      : 10000;
                  return Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'TỔNG ĐẠI LÝ ${agencyInfo.agency?.agencyName ?? agencyInfo.agency?.displayName}'
                                  .toUpperCase(),
                              style: context.text.titleLarge?.copyWith(
                                color: AppColors.blue10,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 15),
                            agencyInfoWidget(agencyInfo),
                            chargeToCoinWidget(minAmount),
                            const SizedBox(height: 5),
                            Text(
                              WalletPointConstant.chargeCoinMessage,
                              style: context.text.bodySmall?.copyWith(
                                  fontWeight: FontWeight.w400, fontSize: 10),
                            ),
                            const SizedBox(height: 25),
                            if (agencyInfo.listPrice != null)
                              Center(
                                child: ImageWidget(IconAppConstants.camera2),
                              ),
                            if (agencyInfo.listPrice != null)
                              priceTable(agencyInfo),
                            const SizedBox(height: 60),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: !isShowKeyboard,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: GradiantButton(
                            onPressed: () {
                              if (agencyInfo.agency?.id != null) {
                                context.startChat(agencyInfo.agency!.id!);
                              }
                            },
                            child: const Text('LIÊN HỆ'),
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
      ),
    );
  }

  Widget agencyInfoWidget(AgencyInfo agencyInfo) {
    return Row(
      children: [
        RichText(
          text: TextSpan(
            style: context.text.titleMedium?.copyWith(
                fontWeight: FontWeight.w600, fontSize: 14, height: 1.5),
            children: [
              const TextSpan(text: 'ID P-Done:\n'),
              if (agencyInfo.agency?.phone != null)
                const TextSpan(text: 'SĐT:\n'),
              if (agencyInfo.agency?.email != null)
                const TextSpan(text: 'Email:\n'),
            ],
          ),
        ),
        const SizedBox(width: 20),
        RichText(
          text: TextSpan(
            style: context.text.titleMedium?.copyWith(
                fontWeight: FontWeight.w400, fontSize: 14, height: 1.5),
            children: [
              TextSpan(text: '${agencyInfo.agency?.pDoneId}\n'),
              if (agencyInfo.agency?.phone != null)
                TextSpan(text: '${agencyInfo.agency?.phone}\n'),
              if (agencyInfo.agency?.email != null)
                TextSpan(text: '${agencyInfo.agency?.email}\n'),
            ],
          ),
        ),
      ],
    );
  }

  String? validateMoney(String? value, int minAmount) {
    const maxAmount = 10000000000;
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập số tiền';
    }

    final valueInt = num.tryParse(value.replaceAll('.', ''));

    if (valueInt == null) {
      return 'Số tiền không hợp lệ';
    }

    if (valueInt < minAmount) {
      return 'Số tiền tối thiểu là ${minAmount.toAppCurrencyString(isWithSymbol: false)}';
    }

    if (valueInt > maxAmount) {
      return 'Số tiền tối đa là ${maxAmount.toAppCurrencyString(isWithSymbol: false)}';
    }

    return null;
  }

  Widget chargeToCoinWidget(int minAmount) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            children: [
              // money input
              validationFormBuilder(
                child: FormElement(
                  name: 'money',
                  hintText: 'Nhập số tiền',
                  title: 'Số tiền',
                  controller: _moneyController,
                  validator: (value) => validateMoney(value, minAmount),
                  borderRadius: WalletConstant.borderRadius5,
                  filled: true,
                  color: AppColors.white,
                  enableBorderColor: AppColors.grey13,
                  focusedBorderColor: WalletTheme.blueCheckedColor,
                  onChanged: (value) => onValidation(),
                  keyBoardType: TextInputType.number,
                  valueTransformer: AppTextInputFormatter.reversedFromCurrency,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    AppTextInputFormatter.currency,
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // coin input
              BlocListener<AgencyBloc, AgencyState>(
                listener: (context, state) {
                  state.whenOrNull(
                      exchangeSuccess: (value) => _coinController.text =
                          value.toAppCurrencyString(isWithSymbol: false),
                      error: (err) => const Text('Error'));
                },
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(minWidth: 100),
                      child: IntrinsicWidth(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 14,
                            bottom: 14,
                            left: 14,
                          ),
                          child: TextFormField(
                            controller: _coinController,
                            keyboardAppearance: Brightness.light,
                            textAlign: TextAlign.start,
                            style:
                                context.text.bodyMedium!.copyWith(fontSize: 16),
                            decoration: const InputDecoration(
                              disabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.greyLightTextColor,
                                  width: 1,
                                ),
                              ),
                              enabled: false,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ImageWidget(ImageConstants.imgdefault, width: 22),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 35),
            child: GradiantButton(
              onPressed: handleExchangeTap,
              child: Text(
                'Quy đổi',
                style: context.text.bodyMedium?.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget priceTable(AgencyInfo agencyInfo) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.blue10),
        borderRadius: WalletConstant.borderRadius10,
      ),
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          // Giá tiền column
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: WalletTheme.lightBlue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                    ),
                  ),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Giá tiền',
                          style: context.text.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                        TextSpan(
                          text: ' (VNĐ)',
                          style: context.text.titleMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ...agencyInfo.listPrice!
                    .map(
                      (price) => Text(
                        price.vndFrom!.toAppCurrencyString(isWithSymbol: false),
                        style: context.text.titleLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          height: 1.5,
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
          const SizedBox(width: 1),
          // Số xu column
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: WalletTheme.lightBlue,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Số xu',
                    style: context.text.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                ),
                ...agencyInfo.listPrice!
                    .map(
                      (price) => Text(
                        num.parse(price.pointPrice ?? '0')
                            .toAppCurrencyString(isWithSymbol: false),
                        style: context.text.titleLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          height: 1.5,
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
