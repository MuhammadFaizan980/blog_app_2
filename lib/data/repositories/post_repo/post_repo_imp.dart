import 'package:blog_app_2/data/models/response_model.dart';
import 'package:blog_app_2/data/repositories/post_repo/post_repo.dart';

class PostRepoImp extends PostRepo {
  @override
  Future<ResponseModel> createPost(
      {required String title, required description, required String image}) {
    // TODO: implement createPost
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> deletePost({required String postId}) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getAllPosts() {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }
}
