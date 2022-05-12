import 'package:blog_app_2/main.dart';
import 'package:flutter/material.dart';

class MessageUtils {
  static void showMessage({
    required String message,
    bool isError = false,
  }) {
    BuildContext context = navigatorKey.currentState!.context;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: isError ? Colors.red : Colors.black,
      ),
    );
  }
}
