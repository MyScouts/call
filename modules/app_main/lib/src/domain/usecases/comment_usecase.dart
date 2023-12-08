import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/social/react_payload.dart';
import 'package:app_main/src/data/repositories/comment_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CommentUsecase {
  final CommentRepository _commentRepository;

  CommentUsecase(
    this._commentRepository,
  );

  Future<List<Comment>> getLatestComments({required int postId}) async {
    return _commentRepository.getComments(
      postId: postId,
      page: 1,
      pageSize: 1,
    );
  }

  Future<List<Comment>> getComments({
    required int postId,
    required int page,
    int pageSize = 10,
  }) async {
    return _commentRepository.getComments(
      postId: postId,
      page: page,
      pageSize: pageSize,
    );
  }

   Future<void> react({
    required int commentId,
    required ReactPayload reactPayload,
  }) async {
    return _commentRepository.react(commentId: commentId, reactPayload: reactPayload);
  }
}
