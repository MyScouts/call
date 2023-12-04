// ignore_for_file: lines_longer_than_80_chars

import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:ui/ui.dart';
import '../../../../../wallet.dart';
import '../../../../core/theme/wallet_theme.dart';
import '../../../../domain/entities/agency/agency.dart';
import '../../../../domain/entities/wallet/bank_account.dart';
import '../../../shared/widgets/app_bar.dart';
import '../../../shared/widgets/gradiant_button.dart';
import '../../wallet_point_coodinator.dart';
import '../bloc/agency_bloc.dart';

class PointAgencyScreen extends StatefulWidget {
  static const routeName = '/all-agency';

  PointAgencyScreen({Key? key}) : super(key: key);
  int? selectedAgencyId;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PointAgencyScreenState();
  }
}

class _PointAgencyScreenState extends State<PointAgencyScreen> {
  late final _agencyBloc = context.read<AgencyBloc>();
  AgencyDetailResponse? agencyResponse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarBuilder(context, title: 'Tìm đại lý xu'),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          context.horizontal,
          25,
          context.horizontal,
          MediaQuery.of(context).padding.bottom,
        ),
        child: BlocListener<AgencyBloc, AgencyState>(
          listener: (BuildContext context, AgencyState state) {
            state.whenOrNull(getAgencyInfoSuccess: (agency) {
              agencyResponse = agency;
              Future.delayed(const Duration(milliseconds: 200)).then((value) {
                setState(() {});
              });
            }, getAgencyInfoLoading: () {
              agencyResponse = null;
            });
          },
          child: BlocBuilder<AgencyBloc, AgencyState>(
            buildWhen: (previous, current) =>
                current.whenOrNull(getAllAgencyLoaded: (agencies) => true) ??
                false,
            builder: (context, state) {
              return state.maybeWhen(
                  orElse: () => const LoadingWidget(),
                  getAllAgencyLoaded: (agencies) {
                    return StatefulBuilder(
                      builder: (context, setState) {
                        return Stack(
                          children: [
                            _buildSearchAgency(context, agencies),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: GradiantButton(
                                onPressed: widget.selectedAgencyId != null
                                    ? () => context
                                        .agencyInfo(widget.selectedAgencyId!)
                                    : null,
                                child: const Text('XEM ĐẠI LÝ'),
                              ),
                            )
                          ],
                        );
                      },
                    );
                  });
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSearchAgency(
      BuildContext context, List<AgencyResponse> agencies) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Danh sách Đại lý xu',
          style: context.text.titleMedium?.copyWith(
            color: AppColors.blue10,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        SearchInputInformationWidget<AgencyResponse>(
          required: true,
          suggestions: agencies
              .map((e) => SuggestionsField(name: ' ${e.name}', data: e))
              .toList(),
          initialValue: null,
          onSelected: (value) {
            if (value != null) {
              widget.selectedAgencyId = value.id;
              _agencyBloc
                  .add(AgencyEvent.getAgencyInfo(widget.selectedAgencyId!));
              // _agencyBloc.add(
              //   AgencyEvent.exchange(widget.agencyId, money.toInt(), coin.toInt(),
              //       _userIDController.text),
              // );
              Future.delayed(const Duration(milliseconds: 200)).then((value) {
                setState(() {});
              });
            }
          },
          onChanged: (val) {},
        ),
        _buildAgencyInfo(context),
        const SizedBox(height: 50),
      ],
    );
  }

  Widget _buildAgencyInfo(BuildContext context) {
    if (agencyResponse == null) {
      return Container();
    }

    return Expanded(child: Container(
      margin: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Kho: ',
              style: context.textTheme.titleLarge!.copyWith(
                fontSize: 18,
              ),
              children: [
                TextSpan(
                  text:
                  '${agencyResponse!.coinAgency.availableCoin!.toAppCurrencyString(isWithSymbol: false)} xu',
                  style: context.textTheme.titleLarge!
                      .copyWith(fontSize: 18, color: const Color(0xFFC6650C)),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          if ((agencyResponse!.coinAgency.coinDiscounts ?? []).isNotEmpty) ...[
            Text(
              'Ưu đãi',
              style: context.textTheme.titleLarge!
                  .copyWith(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(16)),
              child: Table(
                border: TableBorder.all(
                  color: const Color(0xFF4B84F7),
                  borderRadius: BorderRadius.circular(12),
                ),
                children: [
                  TableRow(
                    decoration: const BoxDecoration(
                        color: Color(0xFF4B84F7),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12))),
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          'Số lượng mua',
                          style: context.textTheme.titleLarge!
                              .copyWith(color: AppColors.white, fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          'Tặng thêm',
                          style: context.textTheme.titleLarge!
                              .copyWith(color: AppColors.white, fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  ...(agencyResponse!.coinAgency.coinDiscounts ?? [])
                      .map((e) => TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        e.thresholdVnd.toAppCurrencyString(),
                        style: context.textTheme.titleMedium!.copyWith(
                            color: const Color(0xFF6E6E6E),
                            fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        '${e.discountRate}%',
                        style: context.textTheme.titleMedium!.copyWith(
                            color: const Color(0xFF6E6E6E),
                            fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ]))
                ],
              ),
            ),
          ],
          _buildAgencyBankAccount(context),
        ],
      ),
    ));
  }

  Widget _buildAgencyBankAccount(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Phương thức thanh toán',
            style: context.textTheme.titleLarge!
                .copyWith(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          SizedBox(
            height: 300,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...(agencyResponse?.bankAccounts ?? [])
                      .map((e) => _agencyBankAccElement(context, e))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _agencyBankAccElement(BuildContext context, BankAccount bankAccount) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.black10.withOpacity(0.4))),
      child: Row(
        children: [
          ImageWidget(
            bankAccount.bank?.logo ?? '',
            fit: BoxFit.cover,
            height: 40,
          ),
          Expanded(
            child: Text(
              bankAccount.bank?.name ?? '',
              style: context.textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
