import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';
import 'package:wallet/core/core.dart';
import 'package:wallet/presentation/wallet_constant.dart';

import '../data/datasources/models/response/transactions_response.dart';
import 'shared/bloc/wallet_bloc.dart';

class TransactionHistoryDetailParams {
  final String id;
  final WalletType walletType;

  TransactionHistoryDetailParams({
    required this.id,
    required this.walletType,
  });
}

class TransactionHistoryDetailScreen extends StatefulWidget {
  final TransactionHistoryDetailParams params;
  static const String routeName = '/transaction-history-detail';

  const TransactionHistoryDetailScreen({super.key, required this.params});

  @override
  State<TransactionHistoryDetailScreen> createState() =>
      _TransactionHistoryDetailScreenState();
}

class _TransactionHistoryDetailScreenState
    extends State<TransactionHistoryDetailScreen> {
  late final _bloc = injector<WalletBloc>();

  late final walletType = widget.params.walletType;

  @override
  void initState() {
    _bloc.add(WalletEvent.getWalletTransactionDetail(id: widget.params.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: BaseAppBar(
          title: 'Chi tiết giao dịch',
          isClose: false,
          backgroundColor: Colors.white,
        ),
      ),
      backgroundColor: WalletTheme.bgColor,
      body: BlocBuilder<WalletBloc, WalletState>(
        bloc: _bloc,
        buildWhen: (previous, current) =>
            current.whenOrNull(
              getWalletTransactionDetailSuccess: (info) => true,
              getWalletTransactionDetailLoading: () => true,
            ) ??
            false,
        builder: (BuildContext context, state) {
          return state.maybeWhen(
            getWalletTransactionDetailSuccess: (data) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: context.horizontal),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    _buildStatusWidget(data),
                    const SizedBox(height: 20),
                    _buildInfoWidget(data),
                  ],
                ),
              );
            },
            getWalletTransactionDetailLoading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            orElse: () {
              return Container();
            },
          );
        },
      ),
    );
  }

  _buildStatusWidget(TransactionItem data) {
    final value =
    (data.transactionType == TransactionType.LIVE_GIFT.value ||
        data.transactionType ==
            TransactionType.LIVE_VOTE.value) &&
        walletType == WalletType.diamond
        ? data.toValue
        : data.fromValue;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: WalletConstant.borderRadius12,
      ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: '${TransactionType.values.firstWhere(
                        (type) => type.value == data.transactionType,
                      ).operator(context, receiverPDoneId: data.receiver?.pDoneId, walletType: widget.params.walletType)} ${value.toAppCurrencyString(
                    isWithSymbol: false,
                  )}',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        height: 24 / 16,
                        color: const Color(0xFF4B84F7),
                      ),
                  children: <InlineSpan>[
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: widget.params.walletType.iconTransaction(
                          context,
                          size: 25,
                          textSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                TransactionResolvedStatus.values
                    .firstWhere((status) => status.name == data.resolvedStatus)
                    .text,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 20 / 14,
                      color: TransactionResolvedStatus.values
                          .firstWhere(
                              (status) => status.name == data.resolvedStatus)
                          .color,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildInfoWidget(TransactionItem data) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: WalletConstant.borderRadius12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Thông tin giao dịch',
            style: context.text.titleLarge?.copyWith(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 15),
          _buildItemInfo(
              title: 'Mã giao dịch',
              content: '#${data.id?.substring(0, 8).toUpperCase()}'),
          _buildItemInfo(
              title: 'Loại giao dịch',
              content: TransactionType.getInstance(data.transactionType!)
                  .title(context, receiverPDoneId: data.receiver!.pDoneId)),
          if (data.transactionType == TransactionType.LIVE_GIFT.name &&
              walletType == WalletType.diamond)
            _buildItemInfo(
              title: 'Tên người tặng',
              content: data.sender != null &&
                      data.sender!.fullName != null &&
                      data.sender!.fullName!.isNotEmpty
                  ? data.sender!.fullName!
                  : '${data.sender?.getdisplayName}',
            ),
          if (data.transactionType == TransactionType.LIVE_GIFT.name &&
              walletType == WalletType.diamond)
            _buildItemInfo(
                title: 'ID người tặng', content: data.sender!.pDoneId!),
          if (data.transactionType == TransactionType.LIVE_GIFT.name &&
              walletType == WalletType.coin)
            _buildItemInfo(
              title: 'Tên người nhận',
              content: data.receiver?.fullName ?? '',
            ),
          if (data.transactionType == TransactionType.LIVE_GIFT.name &&
              walletType == WalletType.coin)
            _buildItemInfo(
                title: 'ID người nhận', content: data.receiver!.pDoneId!),
          _buildItemInfo(
            title: 'Thời gian giao dịch',
            content: data.createdAt!.toLocal().datePreOrder,
            isLastItem: true,
          ),
        ],
      ),
    );
  }

  _buildItemInfo({
    required String title,
    required String content,
    bool isLastItem = false,
  }) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: context.text.titleMedium?.copyWith(
                color: const Color(0xFF667385),
                fontSize: 14,
                height: 20 / 14,
              ),
            ),
            Text(
              content,
              style: context.text.titleLarge?.copyWith(
                color: const Color(0xFF101B28),
                fontSize: 14,
                height: 20 / 14,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        if (!isLastItem) const Divider(color: Color(0xFFEAEDF0), thickness: 1.5)
      ],
    );
  }
}
