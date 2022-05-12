import 'package:blog_app_2/utils/app_colors.dart';
import 'package:blog_app_2/utils/screen_utils.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  final bool expanded;

  AppButton({
    required this.label,
    required this.onTap,
  }) : expanded = false;

  AppButton.expanded({
    required this.label,
    required this.onTap,
  }) : expanded = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: expanded ? ScreenUtils.getScreenWidth() : null,
      child: TextButton(
        onPressed: onTap,
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        style: TextButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
        ),
      ),
    );
  }
}
