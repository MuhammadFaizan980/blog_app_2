import 'package:blog_app_2/data/base/base_repo.dart';
import 'package:blog_app_2/data/models/response_model.dart';

abstract class PostRepo extends BaseRepo {
  Future<ResponseModel> createPost({
    required String title,
    required description,
    required String image,
  });

  Future<ResponseModel> getAllPosts({required int page});

  Future<ResponseModel> deletePost({required String postId});
}
