

import 'package:app_main/src/domain/entities/chat/member_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_room_state.freezed.dart';

@freezed
abstract class CreateRoomState with _$CreateRoomState {
  const factory CreateRoomState({
    required List<MemberModel> friends,
    required List<MemberModel> listChoice,
    required int page,
    required bool canLoadMore,
    required String keySearch,
    required int step,
  }) = CreateRoomStateData;
  const factory CreateRoomState.loading() = CreateRoomStateLoading;
  const factory CreateRoomState.error(dynamic error) = CreateRoomStateError;
}