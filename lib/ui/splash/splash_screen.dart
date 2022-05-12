import 'package:blog_app_2/ui/splash/saplsh_vm.dart';
import 'package:blog_app_2/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SplashVm(),
      builder: (context, vm, _) => Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: LottieBuilder.asset(Assets.helloAnimation),
          ),
        ),
      ),
    );
  }
}
