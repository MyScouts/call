
import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/social/react_payload.dart';

abstract class CommentRepository {
  Future<List<Comment>> getComments({
    required int postId, 
    required int page, 
    int pageSize = 10,
  });

   Future<void> react({
    required int commentId,
    required ReactPayload reactPayload,
  });
}
