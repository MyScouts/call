import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:ui/ui.dart';
import 'package:wallet/presentation/shared/bloc/wallet_bloc.dart';
import 'package:wallet/presentation/wallet_point/wallet_point_coodinator.dart';

import '../../../../../wallet.dart';
import '../../../../core/theme/wallet_theme.dart';
import '../../../../core/utils/deboun_callback.dart';
import '../../../../core/utils/input_formatter.dart';
import '../../../../domain/entities/agency/agency_info.dart';
import '../../../shared/widgets/app_bar.dart';
import '../../../shared/widgets/form_element.dart';
import '../../../shared/widgets/gradiant_button.dart';
import '../../../wallet_constant.dart';
import '../../../wallet_coordinator_external.dart';
import '../../wallet_point_constant.dart';
import '../bloc/agency_bloc.dart';
import '../widgets/agency_input.dart';
import '../widgets/agency_tabbar.dart';

class AgencyInfoScreen extends StatefulWidget {
  static const routeName = '/agency-info';
  final int agencyId;

  const AgencyInfoScreen({Key? key, required this.agencyId}) : super(key: key);

  @override
  State<AgencyInfoScreen> createState() => _AgencyInfoScreenState();
}

class _AgencyInfoScreenState extends State<AgencyInfoScreen>
    with ValidationMixin {
  late final _agencyBloc = context.read<AgencyBloc>();
  final _moneyController = TextEditingController();
  final _coinController = TextEditingController();
  final _userIDController = TextEditingController();

  @override
  void initState() {
    _agencyBloc.add(AgencyEvent.getAgencyInfo(widget.agencyId));
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
      _agencyBloc
          .add(AgencyEvent.exchange(agencyId: widget.agencyId, value: money));
    }
    onValidation();
  }

  @override
  Widget build(BuildContext context) {
    final isShowKeyboard = MediaQuery.of(context).viewInsets.bottom.toInt() > 0;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: context.hideKeyboard,
      child: Container(
        color: ResourceTypeExt.blueBackgroundColor,
        padding: const EdgeInsets.fromLTRB(
          0,
          44,
          0,
          0,
        ),
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
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
                return Column(
                  children: [
                    _buildAgencyInformation(context),
                    AgencyTabBarWidget(
                      widgetByMoney: _buildEnterByMoney(context),
                      widgetByCoin: _buildEnterNumberCoins(context),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      color: AppColors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildCouponCoins(context),
                          Visibility(
                            visible: !isShowKeyboard,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: GradiantButton(
                                onPressed: () {
                                  if (agencyInfo.agency?.id != null) {
                                    context.pointTransactionHistoryDetail(21);
                                  }
                                },
                                child: const Text('Xác nhận'),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildAgencyInformation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'ĐẠI LÝ THANH HẢI',
            style:
                context.textTheme.titleLarge!.copyWith(color: AppColors.blue33),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageWidget(
                ImageConstants.icWalletCoin,
                width: 24,
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                '162.000.000.000',
                style: context.textTheme.titleLarge!
                    .copyWith(color: AppColors.blue33),
              ),
            ],
          ),
          _agencyInformationRow(context, 'ID P-DONE', 'ID142987'),
          _agencyInformationRow(context, 'Số điện thoại', '0912345678'),
          _agencyInformationRow(context, 'Email', 'thanhhaikhoxu@gmail.com'),
        ],
      ),
    );
  }

  Widget _agencyInformationRow(
      BuildContext context, String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.textTheme.titleMedium!
                .copyWith(fontWeight: FontWeight.normal, fontSize: 16),
          ),
          Text(
            content,
            style: context.textTheme.titleMedium!
                .copyWith(color: AppColors.black, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildEnterByMoney(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _buildReceiveUser(context),
          const SizedBox(
            height: 24,
          ),
          _buildInputMoney(context),
        ],
      ),
    );
  }

  Widget _buildEnterNumberCoins(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _buildReceiveUser(context),
          const SizedBox(
            height: 24,
          ),
          _buildInputCoins(context),
        ],
      ),
    );
  }

  Widget _buildCouponCoins(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ImageWidget(
              IconAppConstants.icWalletCoupon,
              fit: BoxFit.fill,
              width: 16,
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              'Mã ưu đãi',
              style: context.textTheme.titleMedium!
                  .copyWith(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'Chọn hoặc nhập mã',
              style: context.textTheme.titleMedium!
                  .copyWith(fontSize: 16, fontWeight: FontWeight.normal),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 18,
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _buildReceiveUser(BuildContext context) {
    return AgencyInputTextField(
      controller: _userIDController,
      required: false,
      shouldEnabled: true,
      onChanged: (value) {
        onValidation();
      },
      type: AgencyInputEnum.userId,
      validator: (value) => null,
    );
  }

  Widget _buildInputCoins(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Số xu muốn mua',
          style: context.textTheme.titleLarge!.copyWith(
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: _coinController,
          onChanged: (val) {
            _moneyController.clear();
            _onEstCoin();
          },
          style: context.textTheme.titleLarge!.copyWith(
            color: AppColors.blue33,
            fontSize: 24,
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: 'Nhập số xu muốn mua',
              hintStyle: TextStyle(
                  fontSize: 16,
                  color: AppColors.black10.withOpacity(0.6),
                  fontWeight: FontWeight.normal)),
          inputFormatters: [
            ThousandsFormatter(),
          ],
        ),
        Container(
          height: 0.5,
          width: 400,
          color: AppColors.black10.withOpacity(0.6),
          margin: const EdgeInsets.symmetric(horizontal: 8),
        ),
        BlocBuilder<AgencyBloc, AgencyState>(builder: (context, state) {
          return state.maybeWhen(
            orElse: () => Container(),
            estCoin: (estCoin) {
              return Padding(
                padding: const EdgeInsets.only(top: 8, left: 16),
                child: Row(
                  children: [
                    ImageWidget(
                      ImageConstants.icWalletVnd,
                      width: 24,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      estCoin.vnd.toAppCurrencyString(isWithSymbol: true),
                      style:
                          context.textTheme.titleMedium!.copyWith(fontSize: 16),
                    )
                  ],
                ),
              );
            },
          );
        })
      ],
    );
  }

  Widget _buildInputMoney(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Số tiền muốn mua xu',
          style: context.textTheme.titleLarge!.copyWith(
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: _moneyController,
          onChanged: (value) {
            _coinController.clear();
            _onEstCoin();
          },
          style: context.textTheme.titleLarge!.copyWith(
            color: AppColors.blue33,
            fontSize: 24,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: 'Nhập số tiền',
            hintStyle: TextStyle(
                fontSize: 16,
                color: AppColors.black10.withOpacity(0.6),
                fontWeight: FontWeight.normal),
          ),
          inputFormatters: [
            ThousandsFormatter(),
          ],
        ),
        Container(
          height: 0.5,
          width: 400,
          color: AppColors.black10.withOpacity(0.6),
          margin: const EdgeInsets.symmetric(horizontal: 8),
        ),
        BlocBuilder<AgencyBloc, AgencyState>(builder: (context, state) {
          return state.maybeWhen(
            orElse: () => Container(),
            estCoin: (estCoin) {
              return Padding(
                padding: const EdgeInsets.only(top: 8, left: 16),
                child: Row(
                  children: [
                    ImageWidget(
                      ImageConstants.icWalletCoin,
                      width: 24,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      estCoin.coin.toAppCurrencyString(isWithSymbol: false),
                      style:
                          context.textTheme.titleMedium!.copyWith(fontSize: 16),
                    )
                  ],
                ),
              );
            },
          );
        })
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

  void _onEstCoin() {
    Debouncer(milliseconds: 1200).run(() {
      _agencyBloc.add(AgencyEvent.est(
          widget.agencyId,
          int.tryParse(_moneyController.text.replaceAll('.', '')) ?? 0,
          int.tryParse(_coinController.text.replaceAll('.', '')) ?? 0));
    });
  }
}
