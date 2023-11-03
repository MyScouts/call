import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';

class EKycIdCardRequest {
  const EKycIdCardRequest({required this.backImg, required this.fontImg});

  final String fontImg;
  final String backImg;
}

@injectable
class EKycViettel {
  final Dio _dio;

  EKycViettel(this._dio);

  Future<Map<String, dynamic>> extractIdCard(EKycIdCardRequest request) async {
    final backImage = await MultipartFile.fromFile(request.backImg,
        filename: request.backImg.split(Platform.pathSeparator).last,
        contentType: MediaType('image', 'jpeg'));
    final frontImage = await MultipartFile.fromFile(request.fontImg,
        filename: request.fontImg.split(Platform.pathSeparator).last,
        contentType: MediaType('image', 'jpeg'));
    var data = FormData.fromMap({
      'token': '0d06ff8a023fdd0f32f4a4507160f2a1',
      'image_back': backImage,
      'image_front': frontImage,
    });
    final result = await _dio.post('https://viettelai.vn/ekyc/id_card',
        data: data, options: Options(contentType: 'multipart/form-data'));
    return result.data as Map<String, dynamic>;
  }
}
