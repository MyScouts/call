import 'dart:io';

import 'package:cross_file/cross_file.dart';
import 'package:injectable/injectable.dart';
import 'package:wallet/data/datasources/models/response/onboarding_response.dart';

import '../../data/data.dart';
import '../../data/datasources/models/response/estimate_tax_response.dart';
import '../entities/bank/bank.dart';
import '../entities/otp/otp.dart';
import '../entities/wallet/bank_account.dart';
import '../entities/wallet/vnd_wallet_info/vnd_wallet_info.dart';
import '../repository/wallet_vnd_repository.dart';

@injectable
class WalletVndUseCase {
  final WalletVndRepository _walletVndRepository;

  WalletVndUseCase(this._walletVndRepository);

  Future<List<Bank>> getBanks() async {
    return <Bank>[];
  }

  Future<VndWalletInfo> getVndWalletInfo() async {
    return _walletVndRepository.getVndWalletInfo();
  }

  Future<List<Bank>> getAllBanksInfo() async {
    return _walletVndRepository.getAllBanksInfo();
  }

  Future<List<BankAccount>> getBankAccounts() async {
    return _walletVndRepository.getBankAccounts();
  }

  Future<Otp> getOtp() async {
    return _walletVndRepository.getOtp();
  }

  // Future<String> uploadImage(File image) {
  //   return _walletVndRepository.uploadImage(image);
  // }
  Future<String> storageUploadUrl(String filePath, String prefix) async {
    final res =
        await _walletVndRepository.storageUploadUrl(XFile(filePath), prefix);
    return res;
  }

  Future<BankAccount> addBankAccount(AddBankAccountRequest request) {
    return _walletVndRepository.addBankAccount(request);
  }

  Future<bool> deleteBankAccount({required int bankId}) {
    return _walletVndRepository.deleteBankAccount(bankId: bankId);
  }

  Future<EstimateTaxResponse> estimateTax({required num value}) {
    return _walletVndRepository.estimateTax(value);
  }

  Future requestWithdrawOtp() {
    return _walletVndRepository.requestWithdrawOtp();
  }

  Future<void> withdraw({required WithdrawRequest request}) {
    return _walletVndRepository.withdraw(request);
  }

  Future<void> setDefaultBankAccount(
      {required int bankAccountId, required bool isDefault}) {
    return _walletVndRepository.setDefaultBankAccount(
        id: bankAccountId, isDefault: isDefault);
  }
}

final fakeData = <Map<String, dynamic>>[
  {
    'id': 1,
    'userId': 1,
    'value': 5000000,
    'content': 'Chiết khấu từ đơn hàng mã: 029983...',
    'status': 0,
    'createdAt': '2023-03-24T17:20:15.769Z'
  },
  {
    'id': 2,
    'userId': 1,
    'value': 50000,
    'content': 'Hoa hồng team V-Shop',
    'status': 0,
    'createdAt': '2023-03-24T17:20:15.769Z'
  },
  {
    'id': 1,
    'userId': 1,
    'value': -5000000,
    'content': 'Rút tiền từ tài khoản V-Shop',
    'status': 1,
    'createdAt': '2023-02-24T17:20:15.769Z'
  },
  {
    'id': 1,
    'userId': 1,
    'value': -5000000,
    'content': 'Rút tiền từ tài khoản V-Shop',
    'status': 2,
    'createdAt': '2023-02-24T17:20:15.769Z'
  },
  {
    'id': 1,
    'userId': 1,
    'value': 5000000,
    'content': 'Chiết khấu từ đơn hàng mã: 029983...',
    'status': 0,
    'createdAt': '2023-03-24T17:20:15.769Z'
  },
  {
    'id': 2,
    'userId': 1,
    'value': 50000,
    'content': 'Hoa hồng team V-Shop',
    'status': 0,
    'createdAt': '2023-03-24T17:20:15.769Z'
  },
  {
    'id': 1,
    'userId': 1,
    'value': -5000000,
    'content': 'Rút tiền từ tài khoản V-Shop',
    'status': 1,
    'createdAt': '2023-02-24T17:20:15.769Z'
  },
  {
    'id': 1,
    'userId': 1,
    'value': -5000000,
    'content': 'Rút tiền từ tài khoản V-Shop',
    'status': 2,
    'createdAt': '2023-02-24T17:20:15.769Z'
  },
  {
    'id': 1,
    'userId': 1,
    'value': 5000000,
    'content': 'Chiết khấu từ đơn hàng mã: 029983...',
    'status': 0,
    'createdAt': '2023-03-24T17:20:15.769Z'
  },
  {
    'id': 2,
    'userId': 1,
    'value': 50000,
    'content': 'Hoa hồng team V-Shop',
    'status': 0,
    'createdAt': '2023-03-24T17:20:15.769Z'
  },
  {
    'id': 1,
    'userId': 1,
    'value': -5000000,
    'content': 'Rút tiền từ tài khoản V-Shop',
    'status': 1,
    'createdAt': '2023-02-24T17:20:15.769Z'
  },
  {
    'id': 1,
    'userId': 1,
    'value': -5000000,
    'content': 'Rút tiền từ tài khoản V-Shop',
    'status': 2,
    'createdAt': '2023-02-24T17:20:15.769Z'
  },
  {
    'id': 1,
    'userId': 1,
    'value': 5000000,
    'content': 'Chiết khấu từ đơn hàng mã: 029983...',
    'status': 0,
    'createdAt': '2023-03-24T17:20:15.769Z'
  },
  {
    'id': 2,
    'userId': 1,
    'value': 50000,
    'content': 'Hoa hồng team V-Shop',
    'status': 0,
    'createdAt': '2023-03-24T17:20:15.769Z'
  },
  {
    'id': 1,
    'userId': 1,
    'value': -5000000,
    'content': 'Rút tiền từ tài khoản V-Shop',
    'status': 1,
    'createdAt': '2023-02-24T17:20:15.769Z'
  },
  {
    'id': 1,
    'userId': 1,
    'value': -5000000,
    'content': 'Rút tiền từ tài khoản V-Shop',
    'status': 2,
    'createdAt': '2023-02-24T17:20:15.769Z'
  },
  {
    'id': 1,
    'userId': 1,
    'value': 5000000,
    'content': 'Chiết khấu từ đơn hàng mã: 029983...',
    'status': 0,
    'createdAt': '2023-03-24T17:20:15.769Z'
  },
  {
    'id': 2,
    'userId': 1,
    'value': 50000,
    'content': 'Hoa hồng team V-Shop',
    'status': 0,
    'createdAt': '2023-03-24T17:20:15.769Z'
  },
  {
    'id': 1,
    'userId': 1,
    'value': -5000000,
    'content': 'Rút tiền từ tài khoản V-Shop',
    'status': 1,
    'createdAt': '2023-02-24T17:20:15.769Z'
  },
  {
    'id': 1,
    'userId': 1,
    'value': -5000000,
    'content': 'Rút tiền từ tài khoản V-Shop',
    'status': 2,
    'createdAt': '2023-02-24T17:20:15.769Z'
  },
  {
    'id': 1,
    'userId': 1,
    'value': 5000000,
    'content': 'Chiết khấu từ đơn hàng mã: 029983...',
    'status': 0,
    'createdAt': '2023-03-24T17:20:15.769Z'
  },
  {
    'id': 2,
    'userId': 1,
    'value': 50000,
    'content': 'Hoa hồng team V-Shop',
    'status': 0,
    'createdAt': '2023-03-24T17:20:15.769Z'
  },
  {
    'id': 1,
    'userId': 1,
    'value': -5000000,
    'content': 'Rút tiền từ tài khoản V-Shop',
    'status': 1,
    'createdAt': '2023-02-24T17:20:15.769Z'
  },
  {
    'id': 1,
    'userId': 1,
    'value': -5000000,
    'content': 'Rút tiền từ tài khoản V-Shop',
    'status': 2,
    'createdAt': '2023-02-24T17:20:15.769Z'
  },
  {
    'id': 1,
    'userId': 1,
    'value': 5000000,
    'content': 'Chiết khấu từ đơn hàng mã: 029983...',
    'status': 0,
    'createdAt': '2023-03-24T17:20:15.769Z'
  },
  {
    'id': 2,
    'userId': 1,
    'value': 50000,
    'content': 'Hoa hồng team V-Shop',
    'status': 0,
    'createdAt': '2023-03-24T17:20:15.769Z'
  },
  {
    'id': 1,
    'userId': 1,
    'value': -5000000,
    'content': 'Rút tiền từ tài khoản V-Shop',
    'status': 1,
    'createdAt': '2023-02-24T17:20:15.769Z'
  },
  {
    'id': 1,
    'userId': 1,
    'value': -5000000,
    'content': 'Rút tiền từ tài khoản V-Shop',
    'status': 2,
    'createdAt': '2023-02-24T17:20:15.769Z'
  },
  {
    'id': 1,
    'userId': 1,
    'value': 5000000,
    'content': 'Chiết khấu từ đơn hàng mã: 029983...',
    'status': 0,
    'createdAt': '2023-03-24T17:20:15.769Z'
  },
  {
    'id': 2,
    'userId': 1,
    'value': 50000,
    'content': 'Hoa hồng team V-Shop',
    'status': 0,
    'createdAt': '2023-03-24T17:20:15.769Z'
  },
  {
    'id': 1,
    'userId': 1,
    'value': -5000000,
    'content': 'Rút tiền từ tài khoản V-Shop',
    'status': 1,
    'createdAt': '2023-02-24T17:20:15.769Z'
  },
  {
    'id': 1,
    'userId': 1,
    'value': -5000000,
    'content': 'Rút tiền từ tài khoản V-Shop',
    'status': 2,
    'createdAt': '2023-02-24T17:20:15.769Z'
  },
  {
    'id': 1,
    'userId': 1,
    'value': 5000000,
    'content': 'Chiết khấu từ đơn hàng mã: 029983...',
    'status': 0,
    'createdAt': '2023-03-24T17:20:15.769Z'
  },
  {
    'id': 2,
    'userId': 1,
    'value': 50000,
    'content': 'Hoa hồng team V-Shop',
    'status': 0,
    'createdAt': '2023-03-24T17:20:15.769Z'
  },
  {
    'id': 1,
    'userId': 1,
    'value': -5000000,
    'content': 'Rút tiền từ tài khoản V-Shop',
    'status': 1,
    'createdAt': '2023-02-24T17:20:15.769Z'
  },
  {
    'id': 1,
    'userId': 1,
    'value': -5000000,
    'content': 'Rút tiền từ tài khoản V-Shop',
    'status': 2,
    'createdAt': '2023-02-24T17:20:15.769Z'
  },
  {
    'id': 1,
    'userId': 1,
    'value': 5000000,
    'content': 'Chiết khấu từ đơn hàng mã: 029983...',
    'status': 0,
    'createdAt': '2023-03-24T17:20:15.769Z'
  },
  {
    'id': 2,
    'userId': 1,
    'value': 50000,
    'content': 'Hoa hồng team V-Shop',
    'status': 0,
    'createdAt': '2023-03-24T17:20:15.769Z'
  },
  {
    'id': 1,
    'userId': 1,
    'value': -5000000,
    'content': 'Rút tiền từ tài khoản V-Shop',
    'status': 1,
    'createdAt': '2023-02-24T17:20:15.769Z'
  },
  {
    'id': 1,
    'userId': 1,
    'value': -5000000,
    'content': 'Rút tiền từ tài khoản V-Shop',
    'status': 2,
    'createdAt': '2023-02-24T17:20:15.769Z'
  },
  {
    'id': 1,
    'userId': 1,
    'value': -5000000,
    'content': 'Rút tiền từ tài khoản V-Shop',
    'status': 2,
    'createdAt': '2023-02-24T17:20:15.769Z'
  },
  {
    'id': 1,
    'userId': 1,
    'value': -5000000,
    'content': 'Rút tiền từ tài khoản V-Shop',
    'status': 2,
    'createdAt': '2023-02-24T17:20:15.769Z'
  },
  {
    'id': 1,
    'userId': 1,
    'value': -5000000,
    'content': 'Rút tiền từ tài khoản V-Shop',
    'status': 2,
    'createdAt': '2023-02-24T17:20:15.769Z'
  },
];

final fakeDataDetail = {
  'id': 1,
  'userId': 1,
  'value': '5000000',
  'transactionType': 'commission_for_boss',
  'taxValue': '500000',
  'content': 'AAABBB',
  'fromSource': 'v_live',
  'status': 1,
  'bankAccount': {
    'id': 0,
    'userId': 0,
    'bankNumber': '12323153123',
    'bankHolder': 'Nguyễn Thị Xuân',
    'isDefault': true,
    'createdAt': '2023-04-11T09:07:15.445Z',
    'bank': {
      'id': 1,
      'name': 'Vietcombank',
      'logo': 'https://portal.vietcombank.com.vn/Resources/v3/img/logo.png'
    }
  },
  'createdAt': '2023-04-11T09:07:15.445Z'
};
