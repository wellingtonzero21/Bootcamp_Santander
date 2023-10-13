import 'package:dio/dio.dart';

class JasonPlaceHolderCustonDio {
  final _dio = Dio();

  Dio get dio => _dio;
  JasonPlaceHolderCustonDio() {
    _dio.options.baseUrl = "https://jsonplaceholder.typicode.com";
  }
}