part of 'contract_bloc_cubit.dart';

@immutable
sealed class ContractBlocState {}

final class ContractBlocInitial extends ContractBlocState {}

final class OnRenderPDF extends ContractBlocState {}

final class RenderPDFSuccess extends ContractBlocState {
  final String url;
  RenderPDFSuccess({required this.url});
}

final class RenderPDFFail extends ContractBlocState {
  RenderPDFFail();
}
