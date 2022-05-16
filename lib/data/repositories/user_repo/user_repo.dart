import 'package:blog_app_2/data/base/base_repo.dart';
import 'package:blog_app_2/data/models/response_model.dart';

abstract class UserRepo extends BaseRepo {
  Future<ResponseModel> getUserProfileData();

  Future<ResponseModel> updateUserName({required String userName});

  Future<ResponseModel> updateUserProfileImage({required String image});
}
