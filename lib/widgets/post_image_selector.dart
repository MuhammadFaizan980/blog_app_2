import 'package:blog_app_2/ui/create_post/create_post_vm.dart';
import 'package:blog_app_2/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PostImageSelector extends ViewModelWidget<CreatePostVm> {
  @override
  Widget build(BuildContext context, CreatePostVm vm) {
    return InkWell(
      onTap: vm.pickImageFromGallery,
      child: Container(
        width: ScreenUtils.getScreenWidth(),
        height: ScreenUtils.getScreenHeight() * 0.25,
        color: Colors.black.withOpacity(0.075),
        child: vm.postImage == null
            ? Icon(
                Icons.image,
                size: 100,
                color: Colors.black.withOpacity(0.25),
              )
            : Image.file(
                vm.postImage!,
                width: ScreenUtils.getScreenWidth(),
                height: ScreenUtils.getScreenHeight() * 0.25,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
