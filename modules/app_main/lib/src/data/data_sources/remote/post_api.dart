import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/networking/api_response.dart';
import 'package:app_main/src/data/models/payloads/social/new_post_payload.dart';
import 'package:app_main/src/data/models/payloads/social/react_payload.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'post_api.g.dart';

class PostApiConstants {
  static const String posts = 'api/post/user/{id}';
  static const String reactPost = 'api/post/{id}/react';
  static const String createPost = 'api/post';

}

@RestApi()
@injectable
abstract class PostAPI {
  @factoryMethod
  factory PostAPI(Dio dio) = _PostAPI;

  @GET(PostApiConstants.posts)
  Future<ApiResponse<List<Post>>> getPostsByType(
    @Path('id') int id,
    @Query('page') int page,
    @Query('pageSize') int pageSize,
    @Query('type') String type,
  );

  @POST(PostApiConstants.reactPost)
  Future<ApiResponse> react(
    @Path('id') int id,
    @Body() ReactPayload reactPayload,
  );

  @POST(PostApiConstants.createPost)
  Future<ApiResponse<Post>> createPost(
    @Body() NewPostPayload newPostPayload,
  );
}
