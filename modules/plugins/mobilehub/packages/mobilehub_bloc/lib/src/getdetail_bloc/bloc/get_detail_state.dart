part of 'get_detail_bloc.dart';

@immutable
abstract class GetDetailState extends Equatable {}

class GetDetailInitial extends GetDetailState {
  @override
  List<Object?> get props => [];
}

class GetDetailDataLoading<T> extends GetDetailState {
  @override
  List<Object?> get props => [];
}

class GetDetailDataSuccess<T> extends GetDetailState {
  final T data;
  GetDetailDataSuccess(this.data);

  @override
  List<Object?> get props => [data, T];
}

class GetDetailError<T> extends GetDetailState {
  final dynamic error;

  GetDetailError(this.error);

  @override
  List<Object?> get props => [error];
}

class GetDetailErrorHasData<T> extends GetDetailDataSuccess {
  final dynamic error;

  GetDetailErrorHasData(super.data, this.error);
}
