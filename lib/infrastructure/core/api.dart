// import 'dart:io';

import 'package:dio/dio.dart';
// import 'package:dio_http2_adapter/dio_http2_adapter.dart';

class _ApiDio {
  const _ApiDio._();

  static final _dio = Dio()
    ..options.baseUrl = 'https://edspert.widyaedu.com'
    ..options.headers['x-api-key'] = '18be70c0-4e4d-44ff-a475-50c51ece99a0';
  // ..httpClientAdapter = Http2Adapter(
  //   ConnectionManager(
  //       idleTimeout: const Duration(seconds: 10),
  //       // Ignore bad certificate
  //       onClientCreate: (_, config) {
  //         config.onBadCertificate = (_) => true;
  //         config.validateCertificate = (_, __, ___) => true;
  //       }),
  // );
  static Dio dio = _dio;
}

abstract class Api {
  final dio = _ApiDio.dio;
  String get apiForwardUrl;
}
