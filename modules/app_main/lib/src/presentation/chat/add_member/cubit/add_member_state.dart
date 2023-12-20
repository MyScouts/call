
import 'package:app_main/src/domain/entities/chat/member_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_member_state.freezed.dart';

@freezed
abstract class AddMemberState with _$AddMemberState {
  const factory AddMemberState({
    required List<MemberModel> friends,
    required List<MemberModel> listChoice,
    required int page,
    required bool canLoadMore,
    required String keySearch,
  }) = AddMemberStateData;
  const factory AddMemberState.loading() = AddMemberStateLoading;
  const factory AddMemberState.error(dynamic error) = AddMemberStateError;
}