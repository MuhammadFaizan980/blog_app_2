import 'package:blog_app_2/utils/app_colors.dart';
import 'package:blog_app_2/utils/screen_utils.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  final bool expanded;
  final bool isLoading;

  AppButton({
    required this.label,
    required this.onTap,
    this.isLoading = false,
  }) : expanded = false;

  AppButton.expanded({
    required this.label,
    required this.onTap,
    this.isLoading = false,
  }) : expanded = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: expanded ? ScreenUtils.getScreenWidth() : null,
      child: TextButton(
        onPressed: onTap,
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 1,
                ),
              )
            : Text(
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
