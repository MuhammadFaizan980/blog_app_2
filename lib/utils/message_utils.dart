import 'package:blog_app_2/main.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MessageUtils {
  static void showMessage({
    required String message,
    bool isError = false,
  }) {
    BuildContext context = navigatorKey.currentState!.context;
    ScaffoldMessenger.of(context).clearSnackBars();
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

  static void showToast({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }
}
