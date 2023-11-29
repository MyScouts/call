import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:ui/ui.dart';
import 'package:wallet/domain/domain.dart';
import 'package:wallet/presentation/presentation.dart';
import 'package:wallet/presentation/wallet_vnd/widgets/bank_widget.dart';
import '../../widgets/bank_account_detail_widget.dart';
import '../bloc/bank_account_bloc.dart';

class BankAccountsScreen extends StatefulWidget {
  static const String routeName = '/my-bank-accounts';

  const BankAccountsScreen({super.key});

  @override
  State<BankAccountsScreen> createState() => _BankAccountsScreenState();
}

class _BankAccountsScreenState extends State<BankAccountsScreen> {
  late final bloc = context.read<BankAccountBloc>();

  @override
  void initState() {
    bloc.add(const BankAccountEvent.getBankAccounts());
    super.initState();
  }

  late final PageController _pageCtrl = PageController(initialPage: 0);

  UserBankAccount? _selectedBank;

  String _titleAppbar = 'Tài khoản ngân hàng';

  @override
  void dispose() {
    _pageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: _titleAppbar,
        onPressed: () {
          if (_pageCtrl.page == 0) {
            Navigator.pop(context);
          } else {
            _pageCtrl.jumpToPage(0);
            _titleAppbar = 'Tài khoản ngân hàng';
            setState(() {});
          }
        },
        isClose: false,
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<BankAccountBloc, BankAccountState>(
        bloc: bloc,
        buildWhen: (previous, current) =>
            current.whenOrNull(
              getBankAccountsSuccess: (bankAccounts) => true,
              getBankAccountsError: (err) => true,
              deleteBankAccountSuccess: () => true,
              addBankAccountSuccess: (bankAccount) => true,
            ) ??
            false,
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const LoadingWidget(),
            getBankAccountsError: Text.new,
            getBankAccountsSuccess: (bankAccounts) {
              return PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageCtrl,
                children: [
                  _buildFirstPage(bankAccounts),
                  _buildSecondPage(),
                ],
              );
            },
          );
        },
      ),
    );
  }

  _buildFirstPage(List<BankAccount> bankAccounts) {
    final Map<String, List<BankAccount>> map1 = {};
    final Map<String, Bank?> map2 = {};
    final Map<Bank?, List<BankAccount>> map3 = {};

    for (var account in bankAccounts) {
      final bankId = account.bank?.id;
      final List<BankAccount>? b1 = map1['$bankId'];
      final Bank? b2 = account.bank;
      if (b1 == null) {
        map1['$bankId'] = [];
      }

      map1['$bankId']?.add(account);
      map2['$bankId'] = b2;
    }
    map1.forEach((key, value) {
      map3[map2[key]] = value;
    });

    List<UserBankAccount> listUserBankAccount = [];

    map3.forEach((key, value) {
      listUserBankAccount.add(UserBankAccount(bank: key, bankAccounts: value));
    });

    const double itemHeight = 120;
    final double itemWidth = MediaQuery.of(context).size.width / 3;

    return Builder(builder: (_) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
        child: Column(
          children: [
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: itemWidth / itemHeight,
              children: listUserBankAccount
                  .map(
                    (userBankAccount) => GestureDetector(
                      onTap: () {
                        _selectedBank = userBankAccount;
                        _titleAppbar =
                            'Tài khoản ${_selectedBank?.bank?.shortName}';
                        setState(() {});
                        _pageCtrl.animateToPage(
                          1,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn,
                        );
                      },
                      child: BankWidget(bank: userBankAccount.bank),
                    ),
                  )
                  .toList(),
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                backgroundColor: const Color(0xFFE8F0FE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                context.addBankAccount(
                  bankAccountBloc: context.read<BankAccountBloc>(),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.add, color: Color(0xFF3F3F46), size: 20),
                  const SizedBox(width: 5),
                  Text(
                    'Liên kết ngân hàng',
                    style: context.text.bodyLarge?.copyWith(
                      color: AppColors.blue10,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      height: 24 / 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  _buildSecondPage() {
    final bankAccounts = _selectedBank?.bankAccounts ?? [];
    return Builder(builder: (_) {
      return ListView(
        padding: EdgeInsets.only(
          top: 20,
          right: context.horizontal,
          left: context.horizontal,
        ),
        children: [
          Text(
            'Tài khoản đã liên kết',
            style: context.text.titleMedium?.copyWith(
              color: const Color(0xFF212121),
              fontSize: 16,
              height: 24 / 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          ...bankAccounts.map(
            (bankAccount) => Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: BankAccountDetailWidget(
                bankAccount: bankAccount,
                onTap: () {
                  context.bankAccountDetails(
                    bankAccount: bankAccount,
                    bankAccountBloc: context.read<BankAccountBloc>(),
                  );
                },
              ),
            ),
          ),
        ],
      );
    });
  }
}

class UserBankAccount {
  final Bank? bank;
  final List<BankAccount>? bankAccounts;

  UserBankAccount({required this.bank, required this.bankAccounts});
}
