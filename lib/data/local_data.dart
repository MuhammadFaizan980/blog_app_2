import 'package:blog_app_2/utils/app_constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalData {
  final FlutterSecureStorage _flutterSecureStorage = FlutterSecureStorage();

  Future<void> setUserId({required String token}) async =>
      await _flutterSecureStorage.write(key: AppConstants.userId, value: token);

  Future<String?> getUserId() async =>
      await _flutterSecureStorage.read(key: AppConstants.userId);

  Future<void> setToken({required String token}) async =>
      await _flutterSecureStorage.write(key: AppConstants.jwt, value: token);

  Future<String?> getToken() async =>
      await _flutterSecureStorage.read(key: AppConstants.jwt);

  Future<void> clearStorage() async => await _flutterSecureStorage.deleteAll();
}
