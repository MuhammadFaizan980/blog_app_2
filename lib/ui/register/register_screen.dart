import 'package:blog_app_2/ui/login/login_screen.dart';
import 'package:blog_app_2/ui/register/register_vm.dart';
import 'package:blog_app_2/widgets/app_button.dart';
import 'package:blog_app_2/widgets/app_text_field.dart';
import 'package:blog_app_2/widgets/application_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = 'register';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterVm>.reactive(
      viewModelBuilder: () => RegisterVm(),
      builder: (context, vm, _) => Scaffold(
        appBar: getAppBar(title: 'Register'),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    AppTextField(
                      controller: vm.nameController,
                      label: 'Enter Your Name Here.....',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AppTextField(
                      controller: vm.emailController,
                      label: 'Enter Your Email Here.....',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AppTextField(
                      controller: vm.passwordController,
                      label: 'Password Your Password Here.....',
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 64,
                    ),
                    AppButton.expanded(
                      label: 'Register',
                      onTap: vm.validateInput,
                      isLoading: vm.isLoading,
                    ),
                    AppButton.expanded(
                      label: 'Login',
                      onTap: () => Navigator.of(context)
                          .pushReplacementNamed(LoginScreen.routeName),
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
