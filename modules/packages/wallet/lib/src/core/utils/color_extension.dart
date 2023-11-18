import 'package:flutter/material.dart';

import '../core.dart';

extension ColorStatusExt on TransactionHistoryStatus {
  Color get numberColor {
    switch (this) {
      case TransactionHistoryStatus.success:
        return WalletTheme.primaryColor6;
      case TransactionHistoryStatus.waitingWithdraw:
      case TransactionHistoryStatus.pending:
        return WalletTheme.white50;
      case TransactionHistoryStatus.failed:
        return WalletTheme.dustRed;
    }
  }

  Color get textColor {
    switch (this) {
      case TransactionHistoryStatus.success:
        return WalletTheme.polarGreen;
      case TransactionHistoryStatus.waitingWithdraw:
      case TransactionHistoryStatus.pending:
        return WalletTheme.grey72;
      case TransactionHistoryStatus.failed:
        return WalletTheme.red66;
    }
  }

  // if transactionType in [commission_from_order, commission_from_buy_account,
  // commission_from_livestream] {
  //     if status == 3 return gray;
  //     if status == 1 return blue;
  // }
  Color getBackgroundColor(TransactionHistoryType transactionType) {
    if (transactionType == TransactionHistoryType.commissionFromOrder ||
        transactionType == TransactionHistoryType.commissionFromBuyAccount ||
        transactionType == TransactionHistoryType.commissionFromLivestream) {
      if (this == TransactionHistoryStatus.success) {
        return WalletTheme.blueCheckedColor.withOpacity(0.1);
      }

      if (this == TransactionHistoryStatus.pending) {
        return WalletTheme.greyBackgroundColor;
      }
    }

    return WalletTheme.white;
  }

  ColorStatus getColorStatus(TransactionHistoryType transactionType) {
    if (transactionType == TransactionHistoryType.withdraw) {
      return ColorStatus.minus;
    }

    return ColorStatus.plus;
  }
}

extension DiamondColorStatusExt on DiamondTransactionHistoryStatus {
  Color get numberColor {
    switch (this) {
      case DiamondTransactionHistoryStatus.success:
        return WalletTheme.primaryColor6;
      case DiamondTransactionHistoryStatus.pending:
        return WalletTheme.white50;
      case DiamondTransactionHistoryStatus.failed:
        return WalletTheme.dustRed;
    }
  }

  Color? get textColor {
    switch (this) {
      case DiamondTransactionHistoryStatus.success:
      case DiamondTransactionHistoryStatus.failed:
        return null;
      case DiamondTransactionHistoryStatus.pending:
        return WalletTheme.grey72;
    }
  }

  // if transactionType in [receive_gift, receive_vote, receive_voucher] {
  //     if status == 3 return gray;
  //     if status == 1 return blue;
  // }
  Color getBackgroundColor(DiamondTransactionHistoryType transactionType) {
    if (transactionType == DiamondTransactionHistoryType.receiveGift ||
        transactionType == DiamondTransactionHistoryType.receiveVote ||
        transactionType == DiamondTransactionHistoryType.receiveVoucher) {
      if (this == DiamondTransactionHistoryStatus.success) {
        return WalletTheme.blueCheckedColor.withOpacity(0.1);
      }

      if (this == DiamondTransactionHistoryStatus.pending) {
        return WalletTheme.greyBackgroundColor;
      }
    }

    return WalletTheme.white;
  }
}

extension PointColorStatusExt on PointTransactionHistoryType {
  Color get numberColor {
    switch (this) {
      case PointTransactionHistoryType.rechargePoint:
      case PointTransactionHistoryType.subsidizeContest:
        return WalletTheme.primaryColor6;
      case PointTransactionHistoryType.gift:
      case PointTransactionHistoryType.vote:
      case PointTransactionHistoryType.entryFee:
      case PointTransactionHistoryType.sendRegisterCoach:
        return WalletTheme.dustRed;
    }
  }
}
