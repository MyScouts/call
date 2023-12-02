
import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/social/react_payload.dart';

abstract class PostRepository {
  Future<List<Post>> getPostsByType({
    required int id, 
    required int page, 
    required String type,
    int pageSize = 10,
  });

  Future<void> react({
    required int postId,
    required ReactPayload reactPayload,
  });

}
