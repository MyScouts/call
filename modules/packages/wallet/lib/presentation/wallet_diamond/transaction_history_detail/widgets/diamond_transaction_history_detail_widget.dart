// import 'package:design_system/design_system.dart';
// import 'package:flutter/material.dart';
// import 'package:imagewidget/imagewidget.dart';
//
// import '../../../../core/core.dart';
// import '../../../../domain/domain.dart';
// import '../../../shared/shared.dart';
// import 'attribute_generator.dart';
//
// class DiamondTransactionHistoryDetailWidget extends StatefulWidget {
//   final DiamondTransactionHistoryDetail data;
//
//   const DiamondTransactionHistoryDetailWidget({
//     super.key,
//     required this.data,
//   });
//
//   @override
//   State<DiamondTransactionHistoryDetailWidget> createState() =>
//       _DiamondTransactionHistoryDetailWidgetState();
// }
//
// class _DiamondTransactionHistoryDetailWidgetState
//     extends State<DiamondTransactionHistoryDetailWidget> {
//   Map<String, Widget> generateFormData(DiamondTransactionHistoryDetail data) {
//     final colorStatus = data.transactionType.toColorStatus(data.status);
//
//     final valueWidget = Row(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         Text(
//           colorStatus.parse(data.value),
//           style: context.text.titleMedium?.copyWith(
//             color: colorStatus.color,
//             fontSize: 15,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         const SizedBox(width: 5),
//         ImageWidget(
//           IconAppConstants.icArrowLeft,
//           color: data.status.textColor,
//           width: 18,
//         ),
//       ],
//     );
//
//     return {
//       'Ngày thực hiện': Text(data.createdAt?.toAppDateTimeFormat() ?? ''),
//       'Loại giao dịch': Text(data.transactionType.title),
//       if (data.transactionType ==
//           DiamondTransactionHistoryType.exchangeDiamondToVnd) ...{
//         'Số lượng kim cương': valueWidget,
//       },
//       if (data.transactionType !=
//           DiamondTransactionHistoryType.exchangeDiamondToVnd) ...{
//         'Giá trị quà': valueWidget,
//       },
//       if (data.transactionType ==
//           DiamondTransactionHistoryType.receiveRegisterCoach) ...{
//         // pending
//         'Thời gian huấn luyện': Text('${data.metaData?.hourCount}'),
//         'Tên người trả phí': Text(data.senderName),
//         'ID người tặng': Text(data.senderPDoneId),
//       },
//       if (data.transactionType == DiamondTransactionHistoryType.receiveGift ||
//           data.transactionType ==
//               DiamondTransactionHistoryType.receiveVote) ...{
//         'Tên người tặng': Text(data.senderName),
//         'ID người tặng': Text(data.senderPDoneId),
//       },
//       if (data.transactionType ==
//           DiamondTransactionHistoryType.receiveVoucher) ...{
//         'Tên người xem': Text(data.senderName),
//         'ID người xem': Text(data.senderPDoneId),
//         'ID phòng': Text(data.roomId),
//       },
//       if (data.metaData != null && data.metaData!.pDoneId != null) ...{
//         'ID người nhận': Text('${data.metaData!.pDoneId}'),
//       },
//       'Trạng thái': Text(
//         data.status.title,
//         style: context.text.titleMedium?.copyWith(
//           color: data.status.numberColor,
//           fontSize: 15,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//     };
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final formData = generateFormData(widget.data);
//
//     return Column(
//       children: [
//         Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.centerLeft,
//               end: Alignment.centerRight,
//               colors: [Color(0xFF025DB4), Color(0xFF0E88FE)],
//             ),
//           ),
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//           width: double.infinity,
//           child: Text(
//             'Mã giao dịch ${widget.data.code}',
//             style: context.text.titleMedium?.copyWith(
//               color: WalletTheme.white,
//               fontWeight: FontWeight.w500,
//               fontSize: 16,
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 16,
//                 ),
//                 AttributeGenerator(
//                   data: formData,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         const Spacer(),
//         const ContactWidget(),
//         const SizedBox(height: 16),
//       ],
//     );
//   }
// }
