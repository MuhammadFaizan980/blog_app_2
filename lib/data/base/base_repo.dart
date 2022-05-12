import 'package:blog_app_2/data/api_client.dart';
import 'package:get_it/get_it.dart';

class BaseRepo {
  ApiClient apiClient = GetIt.I.get<ApiClient>();
}