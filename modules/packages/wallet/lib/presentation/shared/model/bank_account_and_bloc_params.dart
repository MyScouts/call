import '../../../../wallet.dart';
import '../../../domain/entities/wallet/bank_account.dart';
import '../../wallet_vnd/bank_account/bloc/bank_account_bloc.dart';

class BankAccountParams {
  final BankAccount bankAccount;
  final BankAccountBloc bankAccountBloc;

  BankAccountParams({
    required this.bankAccount,
    required this.bankAccountBloc,
  });
}
