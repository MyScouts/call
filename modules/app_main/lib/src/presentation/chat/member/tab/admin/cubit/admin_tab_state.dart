import 'package:app_main/src/domain/entities/chat/member_list_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'admin_tab_state.freezed.dart';

@freezed
abstract class AdminTabState with _$AdminTabState {
  const factory AdminTabState({required MemberListModel data}) =
      AdminTabStateData;
  const factory AdminTabState.loading() = AdminTabStateLoading;
  const factory AdminTabState.error(dynamic error) = AdminTabStateError;
}
