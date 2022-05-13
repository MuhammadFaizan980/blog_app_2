import 'package:blog_app_2/data/models/response_model.dart';
import 'package:blog_app_2/data/repositories/post_repo/post_repo.dart';

class PostRepoImp extends PostRepo {
  @override
  Future<ResponseModel> createPost(
          {required String title,
          required description,
          required String image}) async =>
      apiClient.createPost(
          image: image, title: title, description: description);

  @override
  Future<ResponseModel> deletePost({required String postId}) async =>
      await apiClient.deleteUserPost(postId: postId);

  @override
  Future<ResponseModel> getAllPosts({required int page}) async =>
      await apiClient.getUserPosts(page: page);
}
