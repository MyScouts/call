import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/social/create_post_payload.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';

abstract class FilmTabEvent {}

class FilmTabInitiated extends FilmTabEvent {
  FilmTabInitiated({
    required this.postType,
    required this.userInfo,
  });
  final PostType postType;
  final User userInfo;
}

class FilmTabLoadMore extends FilmTabEvent {}

class FilmTabRefreshed extends FilmTabEvent {}

class CreateNewFilm extends FilmTabEvent {
  CreateNewFilm({required this.createFilmPayload});
  final CreatePostPayload createFilmPayload;
}

class CreateFilmButtonTapped extends FilmTabEvent {}
