import 'package:app_core/app_core.dart';
import 'package:app_main/src/domain/entities/media/media_file.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:app_main/src/core/bloc/core_state.dart';

class FilmTabState extends CoreState with EquatableMixin {
  final User? userInfo;
  final List<Post>? films;
  final Post? newFilm;
  final bool hasLoadMore;
  final List<MediaFile?>? newMediaFiles;
  final PostType currentPostType;

  FilmTabState({
    this.userInfo,
    this.films,
    this.hasLoadMore = true,
    this.newFilm,
    this.newMediaFiles,
    this.currentPostType = PostType.film,
    super.status,
  });

  FilmTabState copyWith({
    User? userInfo,
    List<Post>? films,
    bool? hasLoadMore,
    Post? newFilm,
    List<MediaFile?>? newMediaFiles,
    PostType? currentPostType,
  }) {
    return FilmTabState(
      userInfo: userInfo ?? this.userInfo,
      films: films ?? this.films,
      hasLoadMore: hasLoadMore ?? this.hasLoadMore,
      newFilm: newFilm,
      newMediaFiles: newMediaFiles,
      currentPostType: currentPostType ?? this.currentPostType,
    );
  }

  bool isInitial() {
    return films == null;
  }

  bool isEmpty() {
    return ((films ?? []).isEmpty) && newFilm == null;
  }

  @override
  List<Object?> get props => [
        currentPostType,
        newMediaFiles,
        newFilm,
        hasLoadMore,
        films,
        userInfo,
      ];
}
