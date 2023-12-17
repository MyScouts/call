

import 'package:app_main/src/domain/entities/chat/member_list_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'member_tab_state.freezed.dart';

@freezed
abstract class MemberTabState with _$MemberTabState {
  const factory MemberTabState({required MemberListModel data}) = MemberTabStateData;
  const factory MemberTabState.loading() = MemberTabStateLoading;
  const factory MemberTabState.error(dynamic error) = MemberTabStateError;
}