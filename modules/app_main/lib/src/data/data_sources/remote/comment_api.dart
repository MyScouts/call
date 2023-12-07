import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/networking/api_response.dart';
import 'package:app_main/src/data/models/payloads/social/react_payload.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'comment_api.g.dart';

class CommentApiConstants {
  static const String comment = 'api/comment';
  static const String reactComment = 'api/comment/{id}/react';
}

@RestApi()
@injectable
abstract class CommentAPI {
  @factoryMethod
  factory CommentAPI(Dio dio) = _CommentAPI;

  @GET(CommentApiConstants.comment)
  Future<ApiResponse<List<Comment>>> getComments(
    @Query('page') int page,
    @Query('pageSize') int pageSize,
    @Query('postId') int postId,
  );

  @POST(CommentApiConstants.reactComment)
  Future<ApiResponse> react(
    @Path('id') int id,
    @Body() ReactPayload reactPayload,
  );
}
