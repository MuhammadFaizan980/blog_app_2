import 'package:blog_app_2/data/base/base_vm.dart';
import 'package:blog_app_2/main.dart';
import 'package:blog_app_2/ui/home/home_screen.dart';
import 'package:blog_app_2/ui/login/login_screen.dart';
import 'package:flutter/material.dart';

class SplashVm extends BaseVm {
  SplashVm() {
    _initTimer();
  }

  Future<void> _initTimer() async {
    await Future.delayed(const Duration(seconds: 4));
    if ((await authRepo.localData.getToken()) != null) {
      Navigator.of(navigatorKey.currentState!.context)
          .pushReplacementNamed(HomeScreen.routeName);
    } else {
      Navigator.of(navigatorKey.currentState!.context)
          .pushReplacementNamed(LoginScreen.routeName);
    }
  }
}
