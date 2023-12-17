import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:wallet/core/core.dart';

import '../../wallet_constant.dart';
import 'common_button.dart';

class TransactionFilterSheet extends StatefulWidget {
  final WalletType walletType;
  final ValueChanged<FilterOption> onFilterSelected;
  final VoidCallback onResetFilter;
  final FilterOption initValue;

  const TransactionFilterSheet({
    super.key,
    required this.onFilterSelected,
    required this.walletType,
    required this.initValue,
    required this.onResetFilter,
  });

  @override
  State<TransactionFilterSheet> createState() => _TransactionFilterSheetState();
}

class _TransactionFilterSheetState extends State<TransactionFilterSheet> {
  late final List<TransactionResolvedStatus> _selectedStatus =
      widget.initValue.status;

  late final List<TransactionType> _selectedTransactionType =
      widget.initValue.type;

  List<TransactionType> _listFilter() {
    if (widget.walletType == WalletType.vnd) {
      return [
        TransactionType.REQUEST_WITHDRAW_VND,
        TransactionType.DIAMOND_TO_VND,
        TransactionType.MARSHOP_COMMISSION,
        TransactionType.GROUP_INCOME,
        TransactionType.TEAM_INCOME,
        TransactionType.VND_AVAILABLE,
      ];
    } else if (widget.walletType == WalletType.diamond) {
      return [
        TransactionType.LIVE_GIFT,
        TransactionType.LIVE_VOTE,
        TransactionType.DIAMOND_TO_VND,
        TransactionType.DIAMOND_AVAILABLE,
      ];
    }
    return [
      TransactionType.BUY_COIN_FROM_AGENCY,
      TransactionType.LIVE_GIFT,
      TransactionType.LIVE_VOTE,
      TransactionType.LUCKY_WHEEL,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(12),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(),
            const Divider(color: WalletTheme.dividerColor, thickness: 2),
            const SizedBox(height: 10),
            _buildMethods(),
            const SizedBox(height: 10),
            const Divider(color: WalletTheme.dividerColor, thickness: 10),
            const SizedBox(height: 10),
            _buildStatus(),
            const SizedBox(height: 25),
            _buildButtons(),
            SizedBox(height: MediaQuery.of(context).padding.bottom)
          ],
        ),
      ),
    );
  }

  _buildHeader() {
    return Padding(
      padding: EdgeInsets.only(
        left: context.horizontal,
        right: context.horizontal,
        top: 20,
        bottom: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: context.popNavigator,
            child: const Icon(
              Icons.close,
              color: Color(0xFF1D2B39),
              size: 24,
            ),
          ),
          Text(
            'Lọc',
            style: context.text.titleLarge?.copyWith(
              fontSize: 16,
              height: 24 / 16,
            ),
          ),
          Opacity(
            opacity: 0,
            child: GestureDetector(
              onTap: context.popNavigator,
              child: const Icon(
                Icons.close,
                color: Color(0xFF1D2B39),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildMethods() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.horizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hình thức',
            style: context.text.titleLarge?.copyWith(
              fontSize: 16,
              height: 24 / 16,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                ..._listFilter().map(
                  (type) => _buildChip(
                    text: type.filterText(walletType: widget.walletType),
                    isSelected: _selectedTransactionType.contains(type),
                    onTap: () {
                      if (_selectedTransactionType.contains(type)) {
                        _selectedTransactionType.remove(type);
                      } else {
                        _selectedTransactionType.add(type);
                      }

                      setState(() {});
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildStatus() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.horizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trạng thái',
            style: context.text.titleLarge?.copyWith(
              fontSize: 16,
              height: 24 / 16,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: (widget.walletType == WalletType.coin
                      ? TransactionResolvedStatus.values
                      : [
                          TransactionResolvedStatus.pending,
                          TransactionResolvedStatus.succeed,
                          TransactionResolvedStatus.failed
                        ])
                  .map(
                    (status) => _buildChip(
                      text: status.text,
                      isSelected: _selectedStatus.contains(status),
                      onTap: () {
                        if (_selectedStatus.contains(status)) {
                          _selectedStatus.remove(status);
                        } else {
                          _selectedStatus.add(status);
                        }
                        setState(() {});
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  _buildButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.horizontal),
      child: Row(
        children: [
          Expanded(
            child: CommonButton(
              onPressed: () {
                _selectedStatus.clear();
                _selectedTransactionType.clear();
                widget.onResetFilter.call();
                context.popNavigator();
              },
              title: 'Thiết lập lại',
              textColor: const Color(0xFF4B84F7),
              backgroundColor: const Color(0xFFE8F0FE),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: CommonButton(
              onPressed: () {
                widget.onFilterSelected(
                  FilterOption(
                    status: _selectedStatus,
                    type: _selectedTransactionType,
                  ),
                );
                context.popNavigator();
              },
              title: 'Áp dụng',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(
      {required String text,
      required bool isSelected,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90),
            border: Border.all(
              color: isSelected
                  ? const Color(0xFF4B84F7)
                  : const Color(0xFFD0D6DD),
            ),
            color: AppColors.white),
        child: Text(
          text,
          style: context.text.titleLarge?.copyWith(
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            color:
                isSelected ? const Color(0xFF4B84F7) : const Color(0xFF101B28),
            fontSize: 14,
            height: 20 / 14,
          ),
        ),
      ),
    );
  }
}

class FilterOption {
  final List<TransactionResolvedStatus> status;
  final List<TransactionType> type;

  FilterOption({required this.status, required this.type});
}
