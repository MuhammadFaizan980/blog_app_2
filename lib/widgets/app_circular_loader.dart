import 'package:blog_app_2/utils/app_colors.dart';
import 'package:blog_app_2/utils/screen_utils.dart';
import 'package:flutter/material.dart';

class AppCircularLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtils.getScreenWidth(),
      height: ScreenUtils.getScreenHeight(),
      alignment: Alignment.center,
      color: Colors.black.withOpacity(0.1),
      child: const CircularProgressIndicator(
        color: AppColors.primaryColor,
      ),
    );
  }
}
