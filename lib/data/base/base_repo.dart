import 'package:blog_app_2/data/api_client.dart';
import 'package:blog_app_2/data/local_data.dart';
import 'package:get_it/get_it.dart';

class BaseRepo {
  ApiClient apiClient = GetIt.I.get<ApiClient>();
  LocalData localData = GetIt.I.get<LocalData>();
}