import 'package:blog_app_2/data/models/response_model.dart';
import 'package:blog_app_2/data/repositories/auth_repo/auth_repo.dart';

class AuthRepoImp extends AuthRepo {
  @override
  Future<ResponseModel> login({
    required String email,
    required String password,
  }) async {
    return await apiClient.login(email: email, password: password);
  }

  @override
  Future<ResponseModel> register(
      {required String name,
      required String email,
      required String password}) async {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> logout() async {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
