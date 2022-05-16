import 'package:blog_app_2/data/end_points.dart';
import 'package:blog_app_2/data/local_data.dart';
import 'package:blog_app_2/data/models/response_model.dart';
import 'package:blog_app_2/utils/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class ApiClient {
  late Dio _dio;
  final LocalData _localData = GetIt.I.get<LocalData>();

  ApiClient() {
    initDio();
  }

  Future<void> initDio() async {
    _dio = Dio();
    _dio.options.baseUrl = EndPoints.baseUrl;
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
      'email': email,
      'password': password,
    };
    return _parseResponse(await _dio.post(EndPoints.login, data: data));
  }

  Future<ResponseModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> data = {
      'name': name,
      'email': email,
      'password': password,
    };
    return _parseResponse(await _dio.post(EndPoints.register, data: data));
  }

  Future<ResponseModel> getUserPosts({
    required int page,
  }) async {
    return _parseResponse(await _dio.get(EndPoints.allPosts + page.toString()));
  }

  Future<ResponseModel> deleteUserPost({
    required String postId,
  }) async {
    return _parseResponse(await _dio.delete(EndPoints.deletePost + postId));
  }

  Future<ResponseModel> createPost({
    required String image,
    required String title,
    required String description,
  }) async {
    Map<String, dynamic> data = {
      'title': title,
      'description': description,
      'image': image,
    };
    return _parseResponse(await _dio.post(EndPoints.createPost, data: data));
  }

  Future<ResponseModel> getUserProfileData() async {
    return _parseResponse(await _dio.get(EndPoints.myProfile));
  }

  Future<ResponseModel> updateUserProfileImage({
    required String image,
  }) async {
    Map<String, dynamic> data = {
      'image': image,
    };
    return _parseResponse(
        await _dio.post(EndPoints.updateUserImage, data: data));
  }

  Future<ResponseModel> updateUserName({
    required String userName,
  }) async {
    Map<String, dynamic> data = {
      'name': userName,
    };
    return _parseResponse(
        await _dio.post(EndPoints.updateUserName, data: data));
  }
}
