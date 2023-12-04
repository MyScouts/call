// import 'package:design_system/design_system.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../core/theme/wallet_theme.dart';
// import '../../../domain/entities/bank/bank.dart';
// import '../../wallet_constant.dart';
// import '../../wallet_vnd/bank_account/bloc/bank_account_bloc.dart';
// import 'searchable_dropdown_button.dart';
//
// class SelectBankWidget extends StatefulWidget {
//   final ValueChanged<Bank> onSelectedBank;
//
//   const SelectBankWidget({
//     super.key,
//     required this.onSelectedBank,
//   });
//
//   @override
//   State<SelectBankWidget> createState() => _SelectBankWidgetState();
// }
//
// class _SelectBankWidgetState extends State<SelectBankWidget> {
//   bool selecting = false;
//
//   List<Bank> banks = [];
//
//   @override
//   void initState() {
//     banks = context.read<BankAccountBloc>().banks;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         RichText(
//           text: TextSpan(
//             text: BankAccountField.bankName.title,
//             style: context.text.titleMedium?.copyWith(
//               color: WalletTheme.greyTextColor,
//               fontSize: 14,
//               fontWeight: FontWeight.w500,
//             ),
//             children: const [
//               TextSpan(
//                 text: ' *',
//                 style: TextStyle(color: AppColors.red20, fontSize: 16),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 10),
//         SearchableDropdownButton(
//           items: banks,
//           hintWidget: Text(
//             'Chọn ngân hàng',
//             overflow: TextOverflow.ellipsis,
//             style: context.text.titleMedium?.copyWith(
//               color: WalletTheme.greyTextColor,
//             ),
//           ),
//           onChanged: (bank) {
//             if (bank != null) {
//               widget.onSelectedBank(bank);
//             }
//           },
//           selectedBuilder: (context) {
//             return banks
//                 .map(
//                   (bank) => Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       '${bank.name}',
//                       style: context.text.titleSmall?.copyWith(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                 )
//                 .toList();
//           },
//           builderItem: (bank) => ListTile(
//             leading: Container(
//               height: 40,
//               width: 70,
//               decoration: BoxDecoration(
//                 color: AppColors.white,
//                 borderRadius: WalletConstant.borderRadius2,
//                 border: Border.all(color: WalletTheme.greyBorder),
//               ),
//               child: Image.network('${bank.logo}', fit: BoxFit.fill),
//             ),
//             title: Text(
//               '${bank.name}',
//               style: context.text.titleSmall?.copyWith(fontSize: 14),
//             ),
//           ),
//           onSearchFn: (item, searchValue) {
//             if (item.name == null) {
//               return false;
//             }
//             return '${item.name}${item.code}${item.shortName}'
//                 .toLowerCase()
//                 .contains(searchValue.toLowerCase());
//           },
//         ),
//       ],
//     );
//   }
// }
