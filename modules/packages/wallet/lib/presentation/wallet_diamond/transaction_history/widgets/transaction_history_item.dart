// import 'package:design_system/design_system.dart';
// import 'package:flutter/material.dart';
// import 'package:imagewidget/imagewidget.dart';
//
// import '../../../../core/core.dart';
// import '../../wallet_diamond_coodinator.dart';
//
// class TransactionHistoryItem extends StatelessWidget {
//   const TransactionHistoryItem(this.transactionHistory, {super.key});
//
//   final DiamondTransactionHistory transactionHistory;
//
//   Future<void> handleOnTap(BuildContext context) =>
//       context.diamondTransactionHistoryDetail(transactionHistory.id);
//
//   @override
//   Widget build(BuildContext context) {
//     final backgroundColor = transactionHistory.status
//         .getBackgroundColor(transactionHistory.transactionType);
//     return ListTile(
//       onTap: () => handleOnTap(context),
//       dense: true,
//       tileColor: backgroundColor,
//       title: Text(
//         transactionHistory.content,
//         style: context.text.titleMedium?.copyWith(
//           color: WalletTheme.black,
//           fontSize: 14,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//       subtitle: Text(
//         (transactionHistory.createdAt ?? DateTime.now()).toAppDateTimeFormat(),
//         style: context.text.displayMedium?.copyWith(
//           color: WalletTheme.greyTextColor,
//           fontSize: 12,
//           fontWeight: FontWeight.w400,
//         ),
//       ),
//       trailing: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Builder(builder: (context) {
//             final colorStatus = transactionHistory.transactionType
//                 .toColorStatus(transactionHistory.status);
//             return Text(
//               colorStatus.parse(transactionHistory.value),
//               style: context.text.titleMedium?.copyWith(
//                 color: colorStatus.color,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//               ),
//             );
//           }),
//           const SizedBox(width: 5),
//           ImageWidget(
//             IconAppConstants.group,
//             color: transactionHistory.status.textColor,
//             width: 20,
//           ),
//         ],
//       ),
//     );
//   }
// }
