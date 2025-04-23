import 'package:best_price/core/cache/cache_helper.dart';
import 'package:best_price/core/utils/keys.dart';
import 'package:best_price/core/utils/logger.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<dynamic> get(
      {required String endPoint, CancelToken? cancelToken}) async {
    dio.options.headers['accept-language'] = 'ar';
    String token = await CacheHelper.getData(key: Keys.kUserToken);
    LoggerHelper.info(token);
    dio.options.headers["Authorization"] = "Bearer $token";
    dio.options.headers["accept-language"] = "ar";
    dio.options.headers["x-api-key"] = UrlKeys.apiKey;
    var response = await dio.get(endPoint, cancelToken: cancelToken);
    return response.data;
  }

  Future<Map<String, dynamic>> getWithBody({
    required String endPoint,
    CancelToken? cancelToken,
    required var data,
  }) async {
    dio.options.headers['Accept-Language'] = 'en';
    String token = await CacheHelper.getData(key: Keys.kUserToken);
    LoggerHelper.info(token);
    dio.options.headers["Authorization"] = "Bearer $token";
    var response = await dio.get(endPoint, data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required var data,
    bool isLogin = false,
    CancelToken? cancelToken,
  }) async {
    dio.options.headers["x-api-key"] = UrlKeys.apiKey;
    dio.options.headers["accept-language"] = "ar";

    if (!isLogin) {
      String? token = await CacheHelper.getData(key: Keys.kUserToken);
      LoggerHelper.info(token ?? "cache helper null");
      dio.options.headers["Authorization"] = "Bearer $token";
      // dio.options.headers["x-api-key"] = UrlKeys.apiKey;
    }
    var response =
        await dio.post(endPoint, data: data, cancelToken: cancelToken);
    return response.data;
  }

  Future<Map<String, dynamic>> put({
    required String endPoint,
    required var data,
  }) async {
    String token = await CacheHelper.getData(key: Keys.kUserToken);
    LoggerHelper.info(token);
    dio.options.headers["Authorization"] = "Bearer $token";
    var response = await dio.put(endPoint, data: data);

    return response.data;
  }

  Future<Map<String, dynamic>> delete(
      {required String endPoint, required int id}) async {
    String token = await CacheHelper.getData(key: Keys.kUserToken);
    LoggerHelper.info(token);
    dio.options.headers["Authorization"] = "Bearer $token";
    dio.options.headers['Content-Type'] = "application/json";
    dio.options.headers["x-api-key"] = UrlKeys.apiKey;

    var response = await dio.delete('$endPoint$id');
    return response.data;
  }

  Future<Map<String, dynamic>> deleteMany(
      {required String endPoint, required var data}) async {
    String token = await CacheHelper.getData(key: Keys.kUserToken);
    LoggerHelper.info(token);
    dio.options.headers["Authorization"] = "Bearer $token";
    dio.options.headers['Content-Type'] = "application/json";
    dio.options.headers["x-api-key"] = UrlKeys.apiKey;

    var response = await dio.delete(endPoint, data: data);
    return response.data;
  }
}
