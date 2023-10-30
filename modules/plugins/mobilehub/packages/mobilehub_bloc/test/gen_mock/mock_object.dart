import 'package:dio/dio.dart';
// ignore: depend_on_referenced_packages
import 'package:mockito/annotations.dart';

@GenerateMocks([
  Dio,
  ServiceGetList,
])
void main() {}

abstract class ServiceGetList {
  Future<List<String>> getListingString();
  Future<List<String>> getListingStringParam1(int param);
}
