import 'dart:async';

import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:ui/ui.dart';
import 'package:wallet/data/datasources/models/request/agency_get_payment_information_request.dart';
import 'package:wallet/domain/domain.dart';
import 'package:wallet/presentation/shared/bloc/wallet_bloc.dart';
import 'package:wallet/presentation/shared/widgets/toast_message/toast_message.dart';
import 'package:wallet/presentation/wallet_point/wallet_point_coodinator.dart';
import 'package:wallet/presentation/wallet_point/point_agency/bloc/agency_bloc.dart';
import '../../../../../wallet.dart';
import '../../../../core/configuratons/configurations.dart';
import '../../../../core/theme/wallet_theme.dart';
import '../../../../core/utils/deboun_callback.dart';
import '../../../../core/utils/input_formatter.dart';
import '../../../../data/datasources/models/est_coin_response.dart';
import '../../../../data/datasources/models/exchange_coin_response.dart';
import '../../../../data/datasources/models/wallet_coin_payment_information_response.dart';
import '../../../../domain/entities/agency/agency.dart';
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
  BankAccount? bankAccount;
  Timer? _debounce;
  AgencyDetailResponse? agencyData;

  @override
  void initState() {
    _agencyBloc.add(AgencyEvent.getAgencyInfo(widget.agencyId));
    _userIDController.text = WalletInjectedData.user.pDoneId ?? '';
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
    final money = num.tryParse(_moneyController.text.replaceAll('.', '')) ?? 0;
    final coin = num.tryParse(_coinController.text.replaceAll('.', '')) ?? 0;

    if (bankAccount == null) {
      showToastMessage(
          'Bạn phải chọn phương thức thanh toán', ToastMessageType.warning);
      return;
    }

    if (money + coin == 0) {
      showToastMessage('Số quy đổi không hợp lệ', ToastMessageType.warning);
      return;
    }
    if (_userIDController.text.isEmpty) {
      showToastMessage(
          'ID người nhận không được để trống', ToastMessageType.warning);
      return;
    }

    if (coin > (agencyData?.coinAgency.availableCoin ?? 0)) {
      showToastMessage(
          'Số xu quy đổi không đượt vượt quá số lượng tối đa của đại lý',
          ToastMessageType.error);
      return;
    }

    _agencyBloc.add(
      AgencyEvent.exchange(widget.agencyId, money.toInt(), coin.toInt(),
          _userIDController.text, bankAccount?.id ?? 0),
    );
  }

  late AgencyDetailResponse agency;
  num exchangeVND = 0;
  ExchangeCoinResponse? exchangeCoinResponse;

  @override
  Widget build(BuildContext context) {
    final isShowKeyboard =
        MediaQuery.of(Scaffold.of(context).context).viewInsets.bottom.toInt() >
            0;
    return KeyboardVisibilityBuilder(builder: (context, isVisibility) {
      return AutoHideKeyboard(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: WalletTypeExt.blueBackgroundColor,
            title: Text(
              'Thông tin Đại lý',
              style: context.textTheme.titleLarge!
                  .copyWith(color: AppColors.white),
            ),
            leading: IconButton(
              onPressed: Navigator.of(context).pop,
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.white,
              ),
            ),
          ),
          body: BlocListener<AgencyBloc, AgencyState>(
            listener: (BuildContext context, AgencyState state) {
              state.whenOrNull(
                  initial: () {},
                  error: (msg) {
                    // if (msg == "PROFILE_NOT_FOUND") {
                    //
                    // } else {
                    //   showToastMessage(msg, ToastMessageType.error);
                    // }
                    showToastMessage(msg, ToastMessageType.error);
                  },
                  getAgencyInfoSuccess: (data) {
                    agency = data;
                    bankAccount = agency.bankAccounts![0];
                  },
                  estCoin: (EstCoinResponse response) {
                    exchangeVND = response.vnd;
                    _moneyController.text = response.vnd != 0
                        ? (response.vnd)
                            .toAppCurrencyString(isWithSymbol: false)
                        : '';
                    _coinController.text =
                        (response.coin + response.bonusCoin) != 0
                            ? (response.coin + response.bonusCoin)
                                .toAppCurrencyString(isWithSymbol: false)
                            : '';
                  },
                  exchangeSuccess: (ExchangeCoinResponse response) {
                    exchangeCoinResponse = response;
                    _agencyBloc.add(
                      AgencyEvent.getPaymentInformation(
                        widget.agencyId,
                        AgencyPaymentInformation(
                            vnd: exchangeVND,
                            pDoneId: _userIDController.text,
                            bankAccountId: bankAccount!.id!),
                      ),
                    );
                  },
                  paymentInformation:
                      (WalletCoinPaymentInformation paymentInfo) {
                    // context.pointTransactionHistoryDetail(userId);
                    context.coinPaymentInformation(
                        paymentInfo,
                        agency.coinAgency,
                        _userIDController.text,
                        exchangeCoinResponse!);
                  });
            },
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
                    agencyData = agencyInfo;
                    return Stack(
                      children: [
                        Container(
                          color: WalletTypeExt.blueBackgroundColor,
                          height: MediaQuery.of(context).size.height / 2,
                          padding: const EdgeInsets.fromLTRB(
                            0,
                            22,
                            0,
                            0,
                          ),
                        ),
                        SingleChildScrollView(
                          physics: ClampingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildAgencyInformation(
                                  context, agencyInfo.coinAgency),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 2 -
                                    100,
                                child: AgencyTabBarWidget(
                                  widgetByMoney: _buildEnterByMoney(context),
                                  widgetByCoin: _buildEnterNumberCoins(context),
                                ),
                              ),
                              _buildBankMethod(),
                            ],
                          ),
                        ),
                        if (!isVisibility)
                          Positioned(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    color: AppColors.white,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        _buildCouponCoins(context),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: GradiantButton(
                                            onPressed: handleExchangeTap,
                                            child: const Text(
                                              'Xác nhận',
                                              style: TextStyle(
                                                  color: AppColors.white),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: AppColors.white,
                                    height:
                                        MediaQuery.of(context).padding.bottom +
                                            16,
                                  ),
                                ],
                              ),
                            ),
                          )
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      );
    });
  }

  Widget _buildAgencyInformation(
      BuildContext context, AgencyResponse agencyInfo) {
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
            agencyInfo.name?.toUpperCase() ?? '',
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
                agencyInfo.availableCoin
                        ?.toAppCurrencyString(isWithSymbol: false) ??
                    '',
                style: context.textTheme.titleLarge!.copyWith(
                  color: AppColors.blue33,
                ),
              ),
            ],
          ),
          _agencyInformationRow(
              context, 'ID P-DONE', agencyInfo.user?.pDoneId ?? ''),
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                color: const Color(0xFF4B84F7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageWidget(
                    IconApp.icWalletContact.path,
                    fit: BoxFit.fill,
                    width: 16,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Liên hệ',
                    style: context.textTheme.titleLarge!
                        .copyWith(color: AppColors.white, fontSize: 16),
                  )
                ],
              ),
            ),
            onTap: () {
              context.startChat(agencyInfo.user?.id ?? 0);
            },
          ),
          // if ((agencyInfo.user?.phoneCode != null ||
          //     agencyInfo.user?.phone != null))
          //   _agencyInformationRow(context, 'Số điện thoại',
          //       '${agencyInfo.user?.phoneCode ?? ''} ${agencyInfo.user?.phone ?? ''}'),
          // if((agencyInfo.user?.email != null))_agencyInformationRow(context, 'Email', agencyInfo.user?.email ?? ''),
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
          Expanded(
            child: Text(
              content,
              style: context.textTheme.titleMedium!.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
              textAlign: TextAlign.right,
            ),
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
            height: 16,
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
            height: 8,
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
      inputFormatters: const [
        // FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9]"))
      ],
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
          keyboardType: TextInputType.number,
          onChanged: (val) {
            _moneyController.clear();
            if ((int.tryParse(val.replaceAll('.', '')) ?? 0) >
                (agency.coinAgency.availableCoin ?? 0)) {
              _coinController.text = agency.coinAgency.availableCoin
                  .toAppCurrencyString(isWithSymbol: false);
              _onEstCoin();
            }
          },
          style: context.textTheme.titleLarge!.copyWith(
            color: AppColors.blue33,
            fontSize: 24,
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: AppColors.black10.withOpacity(0.6), width: 1),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: AppColors.black10.withOpacity(0.6), width: 1),
              ),
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: 'Nhập số xu muốn mua',
              suffixIcon: IconButton(
                splashColor: Colors.transparent,
                onPressed: () {
                  _coinController.clear();
                  _moneyController.clear();
                  _onEstCoin();
                },
                icon: Container(
                  margin: const EdgeInsets.only(top: 12),
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: const Color(0XFFACACAC),
                    borderRadius: BorderRadius.circular(90),
                  ),
                  child: const Icon(
                    Icons.clear,
                    size: 12,
                    color: AppColors.white,
                  ),
                ),
              ),
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
          height: 4,
        ),
        TextFormField(
          controller: _moneyController,
          keyboardType: TextInputType.number,
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
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.black10.withOpacity(0.6), width: 1),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.black10.withOpacity(0.6), width: 1),
            ),
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: 'Nhập số tiền',
            hintStyle: TextStyle(
                fontSize: 16,
                color: AppColors.black10.withOpacity(0.6),
                fontWeight: FontWeight.normal),
            suffixIcon: IconButton(
              splashColor: Colors.transparent,
              onPressed: () {
                _moneyController.clear();
                _coinController.clear();
                _onEstCoin();
              },
              icon: Container(
                margin: const EdgeInsets.only(top: 12),
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: const Color(0XFFACACAC),
                  borderRadius: BorderRadius.circular(90),
                ),
                child: const Icon(
                  Icons.clear,
                  size: 12,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          inputFormatters: [
            ThousandsFormatter(),
          ],
        ),
        BlocBuilder<AgencyBloc, AgencyState>(builder: (context, state) {
          return state.maybeWhen(
            orElse: () => Container(),
            estCoin: (estCoin) {
              if (((estCoin.coin + estCoin.bonusCoin)) >
                  (agency.coinAgency.availableCoin ?? 0)) {
                _moneyController.clear();
                _coinController.text = agency.coinAgency.availableCoin
                    .toAppCurrencyString(isWithSymbol: false);
                print(' _coinController.text : ${ _coinController.text}');
                _agencyBloc.add(AgencyEvent.est(
                    widget.agencyId,
                    int.tryParse(_moneyController.text.replaceAll('.', '')) ?? 0,
                    int.tryParse(_coinController.text.replaceAll('.', '')) ?? 0));
              }
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
                      (estCoin.coin + estCoin.bonusCoin)
                          .toAppCurrencyString(isWithSymbol: false),
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

  Widget _buildBankMethod() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'PHƯƠNG THỨC THANH TOÁN',
            style: context.textTheme.labelLarge!
                .copyWith(fontWeight: FontWeight.normal),
          ),
          const SizedBox(
            height: 8,
          ),
          SearchInputInformationWidget<BankAccount>(
            required: true,
            suggestions: (agency.bankAccounts ?? [])
                .map((e) => SuggestionsField(
                    name: e.bank?.name ?? '', data: e, img: e.bank?.logo ?? ''))
                .toList(),
            initialValue: bankAccount != null
                ? SuggestionsField(
                    name: bankAccount!.bank?.name ?? '',
                    data: bankAccount!,
                    img: bankAccount!.bank?.logo ?? '')
                : null,
            onSelected: (value) {
              bankAccount = value;
              Future.delayed(const Duration(milliseconds: 200)).then((value) {
                setState(() {});
              });
            },
            onChanged: (val) {},
          )
        ],
      ),
    );
  }

  void _onEstCoin() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1200), () {
      _agencyBloc.add(AgencyEvent.est(
          widget.agencyId,
          int.tryParse(_moneyController.text.replaceAll('.', '')) ?? 0,
          int.tryParse(_coinController.text.replaceAll('.', '')) ?? 0));
    });
  }
}
