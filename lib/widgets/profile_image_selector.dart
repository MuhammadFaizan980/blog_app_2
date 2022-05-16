import 'package:blog_app_2/data/end_points.dart';
import 'package:blog_app_2/ui/user_profile/user_profile_vm.dart';
import 'package:blog_app_2/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProfileImageSelector extends ViewModelWidget<UserProfileVm> {
  @override
  Widget build(BuildContext context, UserProfileVm vm) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: vm.pickImageFromGallery,
          child: Container(
            width: ScreenUtils.getScreenWidth() * 0.25,
            height: ScreenUtils.getScreenWidth() * 0.25,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.075),
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                EndPoints.baseUrl + EndPoints.image + vm.userModel!.sId!,
                width: ScreenUtils.getScreenWidth(),
                height: ScreenUtils.getScreenHeight() * 0.25,
                fit: BoxFit.cover,
                errorBuilder: (context, err, trace) => Icon(
                  Icons.person_add,
                  color: Colors.black.withOpacity(0.5),
                  size: 40,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
