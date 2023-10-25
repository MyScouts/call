import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../domain/entities/user.dart';
import '../../models/responses/api_response.dart';

part 'user_api.g.dart';

class UserApiConstants {
  static const getFollows = 'api/users/{userId}/list-follow';

  static const follow = 'api/users/follow';
  static const unfollow = 'api/users/unfollow';
  static const userById = 'api/users/{id}';
  static const delete = 'api/users/{id}';

  static const blockUser = 'api/users/block-user/{id}';
  static const unblockUser = 'api/settings/user-block/{id}';
  static const listBlockUser =
      'api/settings/user-block?page={page}&pageSize={pageSize}';
  static const listHideDiaryOfUser =
      'api/settings/user-hide-diary?page={page}&pageSize={pageSize}';
  static const removeHideDiaryUser = '/api/settings/user-hide-diary/{id}';
  static const hideDiaryUser = 'api/post/hide-user/{id}';
  static const reportUser = 'api/users/report-user/{id}';
  static const changePass = 'api/users/change-password';

  static const relatedParticipants = '/api/chat/participants/related';
  static const userChatInfo = 'api/users/conversation-participant/{id}';
}

@RestApi()
@injectable
abstract class UserApi {
  @factoryMethod
  factory UserApi(Dio dio) = _UserApi;

  @GET(UserApiConstants.userById)
  Future<ApiResponse<User?>> getUserById({
    @Path('id') required int id,
  });

  @DELETE(UserApiConstants.delete)
  Future<ApiResponse<bool>> delete({
    @Path('id') required int id,
    @Body() required Map<String, String> payload,
  });

  @DELETE(UserApiConstants.unblockUser)
  Future<ApiResponse<bool>> unblockUser(@Path('id') int id);


  @DELETE(UserApiConstants.removeHideDiaryUser)
  Future<ApiResponse<bool>> removeHideDiaryUser(@Path('id') int id);

  @POST(UserApiConstants.blockUser)
  Future<ApiResponse<dynamic>> blockUser({@Path('id') required int id});

  @POST(UserApiConstants.hideDiaryUser)
  Future<ApiResponse<dynamic>> hideDiaryUser({@Path('id') required int id});

  @POST(UserApiConstants.reportUser)
  Future<ApiResponse<bool>> reportUser({
    @Path('id') required int id,
    @Body() required Map<String, dynamic> body,
  });

  @GET(UserApiConstants.relatedParticipants)
  Future<ApiResponse<List<User>>> relatedParticipants({
    @Query('page') required int page,
    @Query('pageSize') required int pageSize,
    @Query('ignoreUserIds')
    required String ignoreUserIds, // =>>> ignoreUserIds.join(',')
    @Query('search') String? keyword,
  });

  @GET(UserApiConstants.userChatInfo)
  Future<ApiResponse<User>> userChatInfo(@Path('id') int id);
}
