import 'dart:convert';

import 'package:dio/dio.dart';

class CustomInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("[요청] ${options.method} ${options.path}");
    // TODO: implement onRequest
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    print("[data] ${response.data}");
    response.data =jsonDecode(response.data);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    print("[Err] ${err.requestOptions.method} ${err.requestOptions.path}");
    print("[Err] ${err.message} ");

    super.onError(err, handler);
  }
}
