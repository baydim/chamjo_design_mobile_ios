import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../../models/response/respnse_default.dart';

ResponseDefault funcDioExceptionHandler(DioException e) {
  switch (e.type) {
    case DioExceptionType.cancel:
      return ResponseDefault(
        status: false,
        message: 'Perintah dibatalkan',
        data: null,
      );
    case DioExceptionType.connectionTimeout:
      return ResponseDefault(
        status: false,
        message: kDebugMode ? 'Koneksi timeout' : "Waktu tunggu habis",
        data: null,
      );
    case DioExceptionType.unknown:
      return ResponseDefault(
        status: false,
        message: 'Mohon periksa koneksi internet anda',
        data: null,
      );
    case DioExceptionType.receiveTimeout:
      return ResponseDefault(
        status: false,
        message: kDebugMode ? "Receive timeout" : "Waktu tunggu habis",
        data: null,
      );
    case DioExceptionType.badResponse:
      return ResponseDefault(
        status: false,
        message: kDebugMode
            ? 'Received invalid status code: ${e.response?.statusCode}'
            : 'Terjadi kesalahan tidak terduga',
        data: null,
      );
    case DioExceptionType.sendTimeout:
      return ResponseDefault(
        status: false,
        message: kDebugMode ? "Send timeout" : "Waktu tunggu habis",
        data: null,
      );
    case DioExceptionType.badCertificate:
      return ResponseDefault(
        status: false,
        message:
            kDebugMode ? "Bad certificate" : 'Terjadi kesalahan tidak terduga',
        data: null,
      );
    default:
      return ResponseDefault(
        status: false,
        message: 'Mohon periksa koneksi internet anda',
        data: null,
      );
  }
}
