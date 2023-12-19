import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/resource/resource_payload.dart';
import 'package:app_main/src/data/models/responses/update_none_pdone_profile_response.dart';
import 'package:app_main/src/domain/entities/update_account/information_none_pdone_profile.dart';
import 'package:app_main/src/domain/usecases/resource_usecase.dart';
import 'package:app_main/src/domain/usecases/user_usecase.dart';
import 'package:app_main/src/presentation/general_setting/contracts/contract_constant.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'contract_bloc_state.dart';

@injectable
class ContractBlocCubit extends Cubit<ContractBlocState> {
  final UserUsecase _userUsecase;
  final ResourceUsecase _resourceUsecase;
  ContractBlocCubit(
    this._resourceUsecase,
    this._userUsecase,
  ) : super(ContractBlocInitial());

  renderPDF({
    required TypeContract type,
    dynamic payload,
  }) async {
    if (state is OnRenderPDF) return;
    try {
      emit(OnRenderPDF());
      UpdateNonePDoneProfileReponse response =
          await _userUsecase.getPDoneProfile();
      InformationNonePdoneProfile profile = response.profile;
      DateTime now = DateTime.now();
      List<String?> address = [
        profile.currentPlace?.countryName,
        profile.currentPlace?.provinceName,
        profile.currentPlace?.districtName,
        profile.currentPlace?.wardName,
        profile.currentPlace?.address
      ];

      List<String?> birthAddress = [
        profile.birthPlace?.countryName,
        profile.birthPlace?.provinceName,
        profile.birthPlace?.districtName,
        profile.birthPlace?.wardName,
        profile.birthPlace?.address
      ];
      address.removeWhere((element) => element == null || element.isEmpty);
      dynamic params;

      UserInfo userInfo = await _userUsecase.getMe();

      switch (type) {
        case TypeContract.bossGroup:
          params = BossGroupContractPram(
            contractNumber: userInfo.pDoneId,
            address: address.join(","),
            birthday: profile.birthday,
            date: now.day.toString(),
            month: now.month.toString(),
            year: now.year.toString(),
            email: userInfo.email ?? "",
            fullName: userInfo.fullName ?? "",
            identityNumber: profile.identityNumber ?? '',
            phoneNumber: userInfo.phone,
            residentAddress: profile.supplyAddress ?? "",
            issuedDate: profile.supplyDate ?? now.ddMMyyyy,
            issuer: profile.supplyAddress ?? "",
          );
          break;
        case TypeContract.rentPack:
          params = (payload as RentMarShopPackParam).copyWith(
            contractNumber: "${userInfo.pDoneId}M",
            address: address.join(","),
            date: now.day.toString(),
            month: now.month.toString(),
            year: now.year.toString(),
            issuedDate: profile.supplyDate ?? now.ddMMyyyy,
            identityNumber: profile.identityNumber ?? '',
            phoneNumber: userInfo.phone,
            depositAmount: "",
            email: userInfo.email,
            issuedPlace: profile.supplyAddress,
            position: "",
            rentCost: "",
            representative: "",
            wordDepositAmount: "",
            wordRentCost: "",
            taxCode: "",
            residentAddress: birthAddress.join(","),
          );
        case TypeContract.purchasePack:
          params = (payload as PurchaseMarShopPackParam).copyWith(
            contractNumber: "${userInfo.pDoneId}M",
            address: address.join(","),
            date: now.day.toString(),
            month: now.month.toString(),
            year: now.year.toString(),
            issuedDate: profile.supplyDate ?? now.ddMMyyyy,
            identityNumber: profile.identityNumber ?? '',
            phoneNumber: userInfo.phone,
            email: userInfo.email,
            issuedPlace: profile.supplyAddress,
            position: "",
            price: "",
            representative: "",
            taxCode: "",
            wordPrice: "",
            residentAddress: birthAddress.join(","),
          );
        case TypeContract.jA:
          params = JAContractParam(
            contractNumber: "${userInfo.pDoneId}JA",
            address: address.join(","),
            birthday: profile.birthday,
            date: now.day.toString(),
            month: now.month.toString(),
            year: now.year.toString(),
            email: userInfo.email ?? "",
            fullName: userInfo.fullName ?? "",
            fullname: userInfo.fullName ?? "",
            identityNumber: profile.identityNumber ?? '',
            issuedDate: profile.supplyDate ?? now.ddMMyyyy,
            issuer: profile.supplyAddress ?? "",
            phoneNumber: userInfo.phone.formatPhone ?? "",
            residentAddress: birthAddress.join(","),
          );
        default:
      }
      final pdfResponse = await _resourceUsecase.renderPDF(RenderPDFPayload(
        type: type.getValue(),
        params: params,
      ));
      emit(RenderPDFSuccess(url: pdfResponse));
    } catch (e) {
      emit(RenderPDFFail());
    }
  }
}
