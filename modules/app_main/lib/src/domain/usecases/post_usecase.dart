import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/data_sources/remote/resource_api.dart';
import 'package:app_main/src/data/models/payloads/social/new_post_payload.dart';
import 'package:app_main/src/data/models/payloads/social/react_payload.dart';
import 'package:app_main/src/data/repositories/post_repository.dart';
import 'package:app_main/src/domain/usecases/comment_usecase.dart';
import 'package:app_main/src/data/models/payloads/social/create_post_payload.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@injectable
class PostUsecase {
  final PostRepository _postRepository;
  final CommentUsecase _commentUsecase;
  final ResourceApi _resourceApi;

  PostUsecase(
    this._postRepository,
    this._commentUsecase,
    this._resourceApi,
  );

  Future<List<Post>> getPostsByType({
    required int id,
    required int page,
    required String type,
    int pageSize = 10,
  }) async {
    final posts = await _postRepository.getPostsByType(
        id: id, page: page, type: type, pageSize: pageSize);
    final newPosts = <Post>[];

    for (final post in posts) {
      final latestComment =
          await _commentUsecase.getComments(postId: post.id!, page: 1);
      if (latestComment.isNotEmpty) {
        final newPost = post.copyWith(latestComment: latestComment.first);
        newPosts.add(newPost);
      } else {
        newPosts.add(post);
      }
    }

    return newPosts;
  }

  Future<void> react({
    required int postId,
    required ReactPayload reactPayload,
  }) async {
    return _postRepository.react(postId: postId, reactPayload: reactPayload);
  }

  Future<Post> createPost(CreatePostPayload payload) async {
    List<String> urlMedias = [];

    if (payload.mediaFiles != null && payload.mediaFiles!.isNotEmpty) {
      for (var mediaFile in payload.mediaFiles!) {
        if (mediaFile != null) {
          final url =
              await _resourceApi.storageUploadUrl(XFile(mediaFile.path), '');
          urlMedias.add(url);
        }
      }
    }

    final newPostPayload = NewPostPayload(
      subject: payload.subject,
      content: payload.content,
      type: payload.postType.name,
      typeScope: payload.scopeType.value,
      medias: urlMedias,
    );

    var post = await _postRepository.createPost(newPostPayload);

    if (urlMedias.isNotEmpty) {
      post = post.copyWith(
          medias: urlMedias.map((url) => Media(link: url)).toList());
    }

    return post;
  }
}
