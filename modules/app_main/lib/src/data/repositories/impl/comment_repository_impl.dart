
import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/social/react_payload.dart';
import 'package:app_main/src/data/repositories/comment_repository.dart';
import 'package:injectable/injectable.dart';

import '../../data_sources/remote/comment_api.dart';

@Injectable(as: CommentRepository)
class CommentRepositoryImpl extends CommentRepository {
  final CommentAPI _commentApi;

  CommentRepositoryImpl(this._commentApi);

  @override
  Future<List<Comment>> getComments({
    required int page,
    required int postId,
    int pageSize = 10,
  }) async {
    final response = await _commentApi.getComments(page, pageSize, postId);
    return response.data;
  }

  @override
  Future<void> react({
    required int commentId,
    required ReactPayload reactPayload,
  }) async {
    await _commentApi.react(commentId, reactPayload);
  }
}
