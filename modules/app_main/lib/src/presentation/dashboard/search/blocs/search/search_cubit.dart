import 'package:app_main/src/data/models/payloads/user/user_action_payload.dart';
import 'package:app_main/src/data/models/responses/search_user_response.dart';
import 'package:app_main/src/domain/usecases/user_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  final UserUsecase _userUsecase;
  final int pageSize = 20;
  final List<SearchDetail> _users = [];
  int _page = 1;

  SearchCubit(this._userUsecase) : super(const SearchInitial(users: []));

  Future searchUser({
    bool isReset = false,
    required String query,
  }) async {
    if (state is OnSearchUser) return;
    try {
      if (isReset) {
        _page = 1;
        _users.clear();
      }
      emit(OnSearchUser(isFirstPage: _page == 1, users: _users));
      final response = await _userUsecase.searchUser(SearchUserPayload(
        query: query,
        page: _page,
        pageSize: pageSize,
      ));
      _users.addAll(response);
      _page++;
      emit(SearchUserSuccess(users: _users));
    } catch (e) {
      emit(SearchUserFail(users: _users));
    }
  }
}
