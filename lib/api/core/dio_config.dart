import 'package:dio/dio.dart';

import 'network_config.dart';

class DioConfig {
  static final DioConfig _instance = DioConfig._internal();

  factory DioConfig() {
    return _instance;
  }

  late Dio dio;

  DioConfig._internal() {
    dio = Dio(BaseOptions(
      baseUrl: ConfigNetwork.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Accept': 'application/json',
      },
    ));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioError e, handler) {
        return handler.next(e);
      },
    ));
  }
}
