import 'package:dio/dio.dart';

abstract class Api {
  final dio = Dio(
    BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 1), // 60 seconds
      receiveTimeout: const Duration(seconds: 1), // 60 seconds
    ),
  )
    // ..options.headers['Access-Control-Allow-Origin'] = '*'
    ..options.headers['x-api-key'] = '18be70c0-4e4d-44ff-a475-50c51ece99a0';
  final String apiUrl = "https://edspert.widyaedu.com/";
}
