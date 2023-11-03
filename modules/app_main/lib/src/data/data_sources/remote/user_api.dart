import 'package:app_core/app_core.dart';
import 'package:app_main/src/domain/entities/update_account/pdone_account.dart';
import 'package:app_main/src/domain/entities/update_account/pdone_profile.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/responses/api_response.dart';

part 'user_api.g.dart';

class UserApiConstants {
  static const pDoneProfile = 'api/account-p-done/profile';
  static const userById = 'api/users/{id}';
}

@RestApi()
@injectable
abstract class UserApi {
  @factoryMethod
  factory UserApi(Dio dio) = _UserApi;

  @GET(UserApiConstants.pDoneProfile)
  Future<ApiResponse<User?>> getProfile();

  @GET(UserApiConstants.userById)
  Future<ApiResponse<User?>> getUserById({
    @Path('id') required int id,
  });
}
