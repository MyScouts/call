import 'package:app_main/src/domain/entities/friend/friend_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'all_friends_state.freezed.dart';

@freezed
abstract class AllFriendsState with _$AllFriendsState {
  const factory AllFriendsState(
      {required List<FriendModel> data,
      required bool canLoadMore,
      required int page}) = AllFriendsStateData;
  const factory AllFriendsState.loading() = AllFriendsStateLoading;
  const factory AllFriendsState.error(dynamic error) = AllFriendsStateError;
}
