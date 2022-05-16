import 'package:blog_app_2/utils/app_colors.dart';
import 'package:blog_app_2/utils/screen_utils.dart';
import 'package:flutter/material.dart';

class ApplicationAppBar extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  final Function()? onLeadingTapped;
  double? elevation;

  ApplicationAppBar({
    required this.title,
    required this.actions,
    this.onLeadingTapped,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      leading: onLeadingTapped == null
          ? null
          : IconButton(
              onPressed: onLeadingTapped,
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
      title: Text(title),
      actions: actions,
      backgroundColor: AppColors.primaryColor,
    );
  }
}

PreferredSize getAppBar({
  required String title,
  List<Widget>? actions,
  Function()? onLeadingTapped,
  double? elevation,
}) {
  return PreferredSize(
    preferredSize: Size(
      ScreenUtils.getScreenWidth(),
      55,
    ),
    child: ApplicationAppBar(
      title: title,
      actions: actions,
      onLeadingTapped: onLeadingTapped,
      elevation: elevation,
    ),
  );
}
