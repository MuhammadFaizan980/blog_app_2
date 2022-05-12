import 'package:blog_app_2/data/base/base_repo.dart';
import 'package:blog_app_2/data/models/response_model.dart';

abstract class AuthRepo extends BaseRepo {
  Future<ResponseModel> login({
    required String email,
    required String password,
  });

  Future<ResponseModel> register({
    required String name,
    required String email,
    required String password,
  });

  Future<ResponseModel> logout();
}
