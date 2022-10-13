import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  static Dio getApiHandler() {
    BaseOptions options = new BaseOptions(
      baseUrl: "http://192.168.100.160:3100/api/",
      // baseUrl: "http://150.95.31.137:7704/api/",
      // connectTimeout: 5000,
      // receiveTimeout: 3000,
    );

    Dio dio = new Dio(options);
    dio.interceptors.addAll([
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
      )
    ]);

    return dio;
  }
}
