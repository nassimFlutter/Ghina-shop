import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<dynamic> get(
      {required String endPoint, CancelToken? cancelToken}) async {
    dio.options.headers['Accept-Language'] = 'en';

    // String token = await CacheHelper.getData(key: Constant.kToken);
    // print(token);
    // dio.options.headers["Authorization"] = "Bearer $token";
    // dio.options.headers[]
    var response = await dio.get(endPoint, cancelToken: cancelToken);
    print(response.data);
    return response.data;
  }

  Future<Map<String, dynamic>> getWithBody({
    required String endPoint,
    CancelToken? cancelToken,
    required var data,
  }) async {
    dio.options.headers['Accept-Language'] = 'en';
    // String token = await CasheHelper.getData(key: Constants.kToken);
    // print(token);
    // dio.options.headers["Authorization"] = "Bearer $token";
    // dio.options.headers[]
    var response = await dio.get(endPoint, data: data);
    print('-----------------------------------------------------------');
    // print(response.data);
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required var data,
    bool isLogin = false,
    CancelToken? cancelToken,
  }) async {
    print(endPoint);
    if (!isLogin) {
      // String token = await CasheHelper.getData(key: Constants.kToken);
      // dio.options.headers["Authorization"] = "Bearer $token";
    }
    var response =
        await dio.post(endPoint, data: data, cancelToken: cancelToken);
    return response.data;
  }

  Future<Map<String, dynamic>> put({
    required String endPoint,
    required var data,
  }) async {
    // String token = await CasheHelper.getData(key: Constants.kToken);

    // dio.options.headers["Authorization"] = "Bearer $token";
    // print('heeeere');
    var response = await dio.put(endPoint, data: data);

    return response.data;
  }

  Future<Map<String, dynamic>> delete(
      {required String endPoint, required int id}) async {
    // String token = await CasheHelper.getData(key: Constants.kToken);
    // dio.options.headers["Authorization"] = "Bearer $token";
    // headers: {
    //       'Content-Type': 'application/json',
    //     },
    dio.options.headers['Content-Type'] = "application/json";
    var response = await dio.delete('$endPoint$id');
    return response.data;
  }

  Future<Map<String, dynamic>> deleteMany(
      {required String endPoint, required var data}) async {
    // String token = await CasheHelper.getData(key: Constants.kToken);
    // dio.options.headers["Authorization"] = "Bearer $token";
    dio.options.headers['Content-Type'] = "application/json";

    var response = await dio.delete(endPoint, data: data);
    return response.data;
  }
}
