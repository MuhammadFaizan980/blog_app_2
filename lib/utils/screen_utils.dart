import 'package:blog_app_2/main.dart';
import 'package:flutter/material.dart';

class ScreenUtils {
  static double getScreenWidth() {
    BuildContext context = navigatorKey.currentState!.context;
    return MediaQuery.of(context).size.width;
  }
  static double getScreenHeight() {
    BuildContext context = navigatorKey.currentState!.context;
    return MediaQuery.of(context).size.height;
  }
}