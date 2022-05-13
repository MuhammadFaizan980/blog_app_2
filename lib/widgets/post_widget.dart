import 'package:blog_app_2/data/end_points.dart';
import 'package:blog_app_2/data/models/post_model.dart';
import 'package:blog_app_2/ui/home/home_vm.dart';
import 'package:blog_app_2/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PostWidget extends ViewModelWidget<HomeVm> {
  final PostModel userPost;

  PostWidget({required this.userPost});

  @override
  Widget build(BuildContext context, HomeVm vm) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                EndPoints.baseUrl + EndPoints.image + userPost.sId!,
                width: ScreenUtils.getScreenWidth(),
                height: 220,
                fit: BoxFit.fitWidth,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    userPost.title!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () =>
                      vm.deleteUserPost(index: vm.userPosts.indexOf(userPost)),
                  icon: const Icon(
                    Icons.delete_outline,
                  ),
                ),
              ],
            ),
            Text(
              userPost.description!,
              style: TextStyle(
                fontSize: 13,
                color: Colors.black.withOpacity(0.5),
              ),
            )
          ],
        ),
      ),
    );
  }
}
