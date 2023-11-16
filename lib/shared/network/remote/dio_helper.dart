import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  //static method for initialize dio object
  //take baseUrl
  static init() {
    dio = Dio(
      BaseOptions(
          receiveDataWhenStatusError: true,
          baseUrl: 'https://api.themoviedb.org/3',
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MmYyNjIxOWMyZjQ4OWNkOTA4ZDRmNmMwMmUwYTNkZCIsInN1YiI6IjY1MmQ1NGQxNjYxMWI0MDBjNTBmZDBjMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.00YSrzaNtH0N19i-XeYHeunn11MPKreJBZMWHhmuQw8',
            'accept': ' application/json',
          }),
    );
  }

  static Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    dynamic data,
  }) async {
    return await dio.get(endPoint,
        queryParameters: queryParameters, data: data);
  }

  Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    dynamic data,
  }) async {
    return await dio.post(endPoint,
        queryParameters: queryParameters, data: data);
  }
}
