import 'package:blog_app_2/ui/user_profile/user_profile_vm.dart';
import 'package:blog_app_2/utils/app_colors.dart';
import 'package:blog_app_2/widgets/profile_image_selector.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProfileInfoWidget extends ViewModelWidget<UserProfileVm> {
  @override
  Widget build(BuildContext context, UserProfileVm vm) {
    return Container(
      color: AppColors.primaryColor,
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
      child: Column(
        children: [
          ProfileImageSelector(),
          const SizedBox(
            height: 8,
          ),
          Text(
            vm.userModel!.name!,
            style: const TextStyle(
              fontSize: 17,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            vm.userModel!.email!,
            style: const TextStyle(
              fontSize: 17,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
