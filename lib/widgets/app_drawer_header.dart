import 'package:blog_app_2/ui/user_profile/user_profile_screen.dart';
import 'package:blog_app_2/utils/app_colors.dart';
import 'package:blog_app_2/utils/screen_utils.dart';
import 'package:flutter/material.dart';

class AppDrawerHeader extends StatelessWidget {
  const AppDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: ScreenUtils.getScreenWidth(),
      height: ScreenUtils.getScreenHeight() * 0.25,
      color: AppColors.primaryColor,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).pushNamed(UserProfileScreen.routeName);
          },
          child: const Icon(
            Icons.snowing,
            color: Colors.white,
            size: 128,
          ),
        ),
      ),
    );
  }
}
