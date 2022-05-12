import 'package:blog_app_2/data/local_data.dart';
import 'package:blog_app_2/data/models/response_model.dart';
import 'package:blog_app_2/utils/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class ApiClient {
  late Dio _dio;
  final LocalData _localData = GetIt.I.get<LocalData>();
  final String _baseUrl = '192.168.1.69';

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
        success: response[AppConstants.success],
        message: response[AppConstants.message],
        data: response[AppConstants.data],
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
}
