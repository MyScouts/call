import '../getlist_bloc/bloc/get_list_bloc.dart';

typedef OFFSET = int;

typedef LIMIT = int;

///
/// ListingBloc is list items with loamore and pull to refresh
///
/// T is return data type
///
/// P param use get list Usecase
///
/// OFFSET: param start paging
///
/// LIMIT: param limit paging
///

typedef ListingBloc<T, P>
    = GetListBlocParam3<T, P, OFFSET, LIMIT>; // int:1 -> offset, int:2 -> limit
