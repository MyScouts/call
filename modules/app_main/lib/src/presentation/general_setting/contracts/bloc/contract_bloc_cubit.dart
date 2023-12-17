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
      address.removeWhere((element) => element == null || element.isEmpty);
      dynamic params;

      UserInfo _userInfo = await _userUsecase.getMe();

      switch (type) {
        case TypeContract.bossGroup:
          params = BossGroupContractPram(
            address: address.join(","),
            birthday: profile.birthday,
            date: now.day.toString(),
            month: now.month.toString(),
            year: now.year.toString(),
            email: _userInfo.email ?? "",
            fullName: profile.firstName ?? "",
            identityNumber: profile.identityNumber ?? '',
            issuedDate: now.toYYYYmmdd,
            issuer: "",
            phoneNumber: _userInfo.phone,
          );
          break;
        case TypeContract.rentPack:
          params = (payload as RentMarShopPackParam).copyWith(
            address: address.join(","),
            date: now.day.toString(),
            month: now.month.toString(),
            year: now.year.toString(),
            issuedDate: now.toYYYYmmdd,
            identityNumber: profile.identityNumber ?? '',
            phoneNumber: _userInfo.phone,
            depositAmount: "",
            email: _userInfo.email,
            issuedPlace: "",
            position: "",
            rentCost: "",
            representative: "",
            wordDepositAmount: "",
            wordRentCost: "",
            taxCode: "",
          );
        case TypeContract.purchasePack:
          params = (payload as PurchaseMarShopPackParam).copyWith(
            address: address.join(","),
            date: now.day.toString(),
            month: now.month.toString(),
            year: now.year.toString(),
            issuedDate: now.toYYYYmmdd,
            identityNumber: profile.identityNumber ?? '',
            phoneNumber: _userInfo.phone,
            email: _userInfo.email,
            issuedPlace: "",
            position: "",
            price: "",
            representative: "",
            taxCode: "",
            wordPrice: "",
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
