import 'package:blog_app_2/ui/user_profile/user_profile_vm.dart';
import 'package:blog_app_2/utils/assets.dart';
import 'package:blog_app_2/widgets/app_circular_loader.dart';
import 'package:blog_app_2/widgets/application_app_bar.dart';
import 'package:blog_app_2/widgets/profile_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';

class UserProfileScreen extends StatelessWidget {
  static const String routeName = 'user_profile';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserProfileVm>.reactive(
      viewModelBuilder: () => UserProfileVm(),
      onModelReady: (vm) => vm.getUserProfileData(),
      builder: (context, vm, _) => Scaffold(
        appBar: getAppBar(
          title: 'User Profile',
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
              ),
            ),
          ],
        ),
        body: vm.isLoading
            ? AppCircularLoader()
            : Column(
                children: [
                  ProfileInfoWidget(),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: LottieBuilder.asset(
                      Assets.helloAnimation,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
