import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/data_sources/remote/post_api.dart';
import 'package:app_main/src/data/models/payloads/social/new_post_payload.dart';
import 'package:app_main/src/data/models/payloads/social/react_payload.dart';
import 'package:app_main/src/data/repositories/post_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PostRepository)
class PostRepositoryImpl extends PostRepository {
  final PostAPI _postApi;

  PostRepositoryImpl(this._postApi);

  @override
  Future<List<Post>> getPostsByType({
    required int id,
    required int page,
    required String type,
    int pageSize = 10,
  }) async {
    final response = await _postApi.getPostsByType(id, page, pageSize, type);
    return response.data;
  }

  @override
  Future<void> react({
    required int postId,
    required ReactPayload reactPayload,
  }) async {
    await _postApi.react(postId, reactPayload);
  }

  @override
  Future<Post> createPost(NewPostPayload newPostPayload)async {
    final response = await _postApi.createPost(newPostPayload);
    return response.data;
  }
}

  
  

