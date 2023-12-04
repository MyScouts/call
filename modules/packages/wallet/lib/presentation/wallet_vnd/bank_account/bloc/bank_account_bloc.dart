import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/data.dart';
import '../../../../domain/domain.dart';
import '../screens/add_bank_account_screen.dart';

part 'bank_account_bloc.freezed.dart';

part 'bank_account_event.dart';

part 'bank_account_state.dart';

class BankAccountBloc extends Bloc<BankAccountEvent, BankAccountState> {
  final WalletVndUseCase _walletVndUseCase;

  List<Bank> cloneBanks = [];
  List<Bank> banks = [];
  late String qrImage;
  late Otp otp;

  late num taxValue;

  AddBankAccountParams _addBankAccountParams = AddBankAccountParams();

  AddBankAccountParams get addBankAccountParams => _addBankAccountParams;

  // ignore: use_setters_to_change_properties
  void setAddBankAccountParams(AddBankAccountParams params) =>
      _addBankAccountParams = params;

  BankAccountBloc(this._walletVndUseCase) : super(const _Initial()) {
    on<_GetAllBanksInfo>((event, emit) async {
      try {
        emit(const _GetAllBanksInfoLoading());
        banks = await _walletVndUseCase.getAllBanksInfo();
        cloneBanks = banks;
        emit(const _GetAllBanksInfoSuccess());
      } catch (e) {
        const errMessage = 'Đã xảy ra lỗi';
        emit(const _Error(errMessage));
      }
    });

    on<_GetBankAccounts>((event, emit) async {
      try {
        emit(const _GetBankAccountsLoading());
        final response = await _walletVndUseCase.getBankAccounts();
        emit(_GetBankAccountsSuccess(bankAccounts: response));
      } catch (e) {
        const errMessage = 'Đã xảy ra lỗi';
        emit(const _Error(errMessage));
      }
    });

    on<_UploadImage>((event, emit) async {
      try {
        emit(const _UploadImageLoading());
        qrImage = await _walletVndUseCase.uploadImage(event.file);
        emit(_UploadImageSuccess(imgUrl: qrImage));
      } catch (e) {
        const errMessage = 'Đã xảy ra lỗi';
        emit(const _Error(errMessage));
      }
    });

    on<_AddBankAccount>((event, emit) async {
      try {
        emit(const _AddBankAccountLoading());
        final bankAccount =
            await _walletVndUseCase.addBankAccount(event.request);
        emit(_AddBankAccountSuccess(bankAccount: bankAccount));
      } catch (e) {
        const errMessage = 'Đã xảy ra lỗi';
        if (e is DioError) {
          if (e.response?.data?['code'] == 'OTP_NOT_MATCH') {
            emit(const _AddBankAccountOtpNotMatch());
          }
        } else {
          emit(const _Error(errMessage));
        }
      }
    });

    on<_DeleteBankAccount>((event, emit) async {
      try {
        emit(const _DeleteBankAccountLoading());
        await _walletVndUseCase.deleteBankAccount(bankId: event.bankId);
        emit(const _DeleteBankAccountSuccess());
      } catch (e) {
        const errMessage = 'Đã xảy ra lỗi';
        emit(const _Error(errMessage));
      }
    });

    on<_GetOtp>(
      (event, emit) async {
        try {
          if (event.isResend) {
            emit(const _ResendOtpLoading());
            otp = await _walletVndUseCase.getOtp();
            emit(const _ResendOtpSuccess());
          } else {
            emit(const _GetOtpLoading());
            otp = await _walletVndUseCase.getOtp();
            emit(const _GetOtpSuccess());
          }
        } on DioError catch (e) {
          String errorMessage = 'Đã xảy ra lỗi';
          final String code = e.response?.data?['code'] ?? '';
          if (code.contains('PHONE_NUMBER_INVALID')) {
            errorMessage = 'PHONE_NUMBER_INVALID';
          }
          emit(_Error(errorMessage));
        }
      },
    );

    on<_GetVndWalletInfo>((event, emit) async {
      try {
        emit(const _GetVndWalletInfoLoading());
        final response = await _walletVndUseCase.getVndWalletInfo();
        emit(_GetVndWalletInfoSuccess(response));
      } catch (e) {
        const errMessage = 'Đã xảy ra lỗi';
        emit(const _Error(errMessage));
      }
    });

    on<_EstimateTax>((event, emit) async {
      try {
        emit(const _EstimateTaxLoading());
        taxValue = await _walletVndUseCase.estimateTax(value: event.value);
        emit(_EstimateTaxSuccess(taxValue));
      } catch (e) {
        const errMessage = 'Đã xảy ra lỗi';
        emit(const _Error(errMessage));
      }
    });

    on<_Withdraw>((event, emit) async {
      try {
        emit(const _WithdrawLoading());
        await _walletVndUseCase.withdraw(request: event.request);
        emit(const _WithdrawLoaded());
      } catch (e) {
        const errMessage = 'Đã xảy ra lỗi';
        emit(const _Error(errMessage));
      }
    });

    on<_SetDefaultBankAccount>((event, emit) async {
      try {
        emit(const _SetDefaultBankAccountLoading());
        await _walletVndUseCase.setDefaultBankAccount(
          bankAccountId: event.bankAccountId,
          isDefault: event.isDefault,
        );
        emit(const _SetDefaultBankAccountSuccess());
      } catch (e) {
        const errMessage = 'Đã xảy ra lỗi';
        emit(const _Error(errMessage));
      }
    });

    on<_SearchBank>((event, emit) async {
      try {
        emit(const _GetAllBanksInfoLoading());
        if (event.search.isNotEmpty) {
          banks = banks.where((element) {
            return '${element.name}${element.code}${element.shortName}'
                .contains(event.search);
          }).toList();
        } else {
          banks = cloneBanks;
        }
        emit(const _GetAllBanksInfoSuccess());
      } catch (e) {
        const errMessage = 'Đã xảy ra lỗi';
        emit(const _Error(errMessage));
      }
    });
  }
}
