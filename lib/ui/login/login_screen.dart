import 'package:blog_app_2/ui/login/login_vm.dart';
import 'package:blog_app_2/widgets/app_button.dart';
import 'package:blog_app_2/widgets/app_text_field.dart';
import 'package:blog_app_2/widgets/application_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginVm>.reactive(
      viewModelBuilder: () => LoginVm(),
      builder: (context, vm, _) => Scaffold(
        appBar: getAppBar(title: 'Login'),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    AppTextField(
                      controller: vm.emailController,
                      label: 'Enter Your Here.....',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AppTextField(
                      controller: vm.passwordController,
                      label: 'Password Your Here.....',
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 64,
                    ),
                    AppButton.expanded(
                      label: 'Login',
                      onTap: vm.validateInput,
                      isLoading: vm.isLoading,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
