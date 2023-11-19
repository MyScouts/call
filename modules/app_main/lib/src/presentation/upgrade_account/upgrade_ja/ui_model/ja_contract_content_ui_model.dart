import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/responses/pdone/pdone_information_response.dart';

class JAContractContentUIModel {
  JAContractContentUIModel({
    required this.jaContractNumber,
    this.user,
    this.pDoneInformationData,
  });

  final String jaContractNumber;
  final User? user;
  final PDoneInformationData? pDoneInformationData;

  @override
  String toString() => 'jaContractNumber: $jaContractNumber,';
}
