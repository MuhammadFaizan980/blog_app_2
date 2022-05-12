import 'package:blog_app_2/utils/app_constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalData {
  final FlutterSecureStorage _flutterSecureStorage = FlutterSecureStorage();

  Future<String?> getToken() async =>
      await _flutterSecureStorage.read(key: AppConstants.token);

  Future<void> clearStorage() async => await _flutterSecureStorage.deleteAll();
}
