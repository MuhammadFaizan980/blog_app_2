import 'package:blog_app_2/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText;
  final int? maxLines;

  AppTextField({
    required this.controller,
    required this.label,
    this.obscureText = false,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: AppColors.primaryColor,
      maxLines: maxLines,
      style: const TextStyle(
        color: AppColors.primaryColor,
      ),
      decoration: InputDecoration(
        label: Text(
          label,
          style: const TextStyle(
            color: AppColors.primaryColor,
          ),
        ),
        contentPadding: const EdgeInsets.all(12),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 1,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 1,
          ),
        ),
      ),
    );
  }
}
