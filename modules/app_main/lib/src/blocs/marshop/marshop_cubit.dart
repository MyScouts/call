import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/marshop/marshop_payload.dart';
import 'package:app_main/src/domain/usecases/marshop_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:localization/localization.dart';

part 'marshop_state.dart';

@injectable
class MarshopCubit extends Cubit<MarshopState> {
  final MarshopUsecase _marshopUsecase;
  MarshopCubit(this._marshopUsecase) : super(MarshopInitial());

  Future registerCustomer(RegisterCustomerPayload payload) async {
    if (state is OnRegisterCustomer) return;
    String message = S.current.messages_server_internal_error.capitalize();
    try {
      emit(OnRegisterCustomer());
      await _marshopUsecase.registerCustomer(payload);
      emit(RegisterCustomerSuccess());
      return;
    } on DioException catch (error) {
      final data = error.response!.data;
      switch (data['code']) {
        case "MARSHOP_NOT_FOUND":
          message = "Không tìm thấy mã Marshop!";
          break;
        case "ALREADY_MARSHOP_CUSTOMER":
          message = "Bạn đã đăng ký khách hàng thường xuyên!";
          break;
        case "OTP_NOT_MATCH":
          message = S.current.message_otp_not_match.capitalize();
          break;
        default:
      }
    } catch (error) {
      debugPrint("phoneRegister: $error");
    }
    emit(RegisterCustomerFailed(message: message));
  }

  Future registerMarshop(int userId, RegisterMarshopPayload payload) async {
    if (state is OnRegisterMarshop) return;
    String message = S.current.messages_server_internal_error.capitalize();
    try {
      emit(OnRegisterMarshop());
      await _marshopUsecase.registerMarshop(userId, payload);
      emit(RegisterCustomerSuccess());
      return;
    } on DioException catch (error) {
      final data = error.response!.data;
      switch (data['code']) {
        case "MARSHOP_NOT_FOUND":
          message = "Không tìm thấy mã Marshop!";
          break;
        case "REFERRAL_MUST_BE_MARSHOP":
          message = "Mã marshop liên kết không hợp lệ.";
          break;
        case "NOT_JA":
          message = "Bạn chưa là JA.";
          break;
        case "OTP_NOT_MATCH":
          message = S.current.message_otp_not_match.capitalize();
          break;
        default:
      }
    } catch (error) {
      debugPrint("phoneRegister: $error");
    }
    emit(RegisterMarshopFail(message: message));
  }
}
