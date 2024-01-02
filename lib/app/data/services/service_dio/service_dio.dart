import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../models/response/respnse_default.dart';
import 'api_interceptor.dart';
import 'dio_error_handler.dart';
import 'url_api.dart';

class ServiceDio {
  static final _defaultInterceptor = ApiInterceptor();
  static Future<BaseOptions> _options() async {
    return BaseOptions(baseUrl: baseUrl);
  }

  static Future<ResponseDefault> getCase({required String url}) async {
    try {
      final dio = Dio(
        await _options(),
      );
      dio.interceptors.add(_defaultInterceptor);
      var response = await dio.get(url);
      var data = ResponseDefault(
        status: true,
        message: response.statusMessage,
        data: response.data,
      );
      log(
        responseDefaultToJson(data),
        name: "REPOS",
      );

      return data;
    } on DioException catch (e) {
      return funcDioExceptionHandler(e);
    }
  }
}
