import 'package:blog_app_2/data/end_points.dart';
import 'package:blog_app_2/data/local_data.dart';
import 'package:blog_app_2/data/models/response_model.dart';
import 'package:blog_app_2/utils/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class ApiClient {
  late Dio _dio;
  final LocalData _localData = GetIt.I.get<LocalData>();
  final String _baseUrl = 'http://192.168.1.69:8080';

  ApiClient() {
    initDio();
  }

  Future<void> initDio() async {
    _dio = Dio();
    _dio.options.baseUrl = _baseUrl;
    _setInterceptors();
  }

  Future<void> _setInterceptors() async {
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      _logRequestData(options);
      String? token = await _localData.getToken();
      if (token != null) options.headers['Authorization'] = token;

      return handler.next(options);
    }, onResponse: (response, handler) {
      print('***RESPONSE***');
      print(response.data);

      return handler.next(response);
    }, onError: (DioError e, handler) {
      print('===DIO ERROR:$e===');

      return handler.next(e);
    }));
  }

  void _logRequestData(RequestOptions options) {
    print('***REQUEST***');
    print('***URL***');
    print(options.uri);
    print('***PARAMS***');
    print(options.queryParameters);
    print('***DATA***');
    print(options.data);
  }

  ResponseModel _parseResponse(dynamic response) {
    try {
      return ResponseModel(
        success: response.data[AppConstants.success],
        message: response.data[AppConstants.message],
        data: response.data[AppConstants.data],
      );
    } catch (e) {
      print('===PARSING EXCEPTION===: $e');
      return ResponseModel(
        success: false,
        message: 'Response parsing error!',
        data: null,
      );
    }
  }

  /// API Calls...

  Future<ResponseModel> login({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> data = {
      'email': 'demo@gmail.com',
      'password': '123456',
    };
    return _parseResponse(
      await _dio.post(
        EndPoints.login,
        data: data,
      ),
    );
  }
}
