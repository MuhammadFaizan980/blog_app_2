import 'package:blog_app_2/data/models/response_model.dart';
import 'package:blog_app_2/data/repositories/user_repo/user_repo.dart';

class UserRepoImp extends UserRepo {
  @override
  Future<ResponseModel> getUserProfileData() async =>
      apiClient.getUserProfileData();

  @override
  Future<ResponseModel> updateUserName({required String userName}) async =>
      apiClient.updateUserName(userName: userName);

  @override
  Future<ResponseModel> updateUserProfileImage({required String image}) =>
      apiClient.updateUserProfileImage(image: image);
}
