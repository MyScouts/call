part of 'search_cubit.dart';

@immutable
sealed class SearchState {
  final List<SearchUser> users;
  const SearchState({required this.users});
}

final class SearchInitial extends SearchState {
  const SearchInitial({required super.users});
}

final class OnSearchUser extends SearchState {
  final bool isFirstPage;
  const OnSearchUser({required this.isFirstPage, required super.users});
}

final class SearchUserSuccess extends SearchState {
  const SearchUserSuccess({required super.users});
}

final class SearchUserFail extends SearchState {
  const SearchUserFail({required super.users});
}
