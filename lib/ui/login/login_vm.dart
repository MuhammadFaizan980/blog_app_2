import 'package:blog_app_2/data/base/base_vm.dart';
import 'package:blog_app_2/data/models/response_model.dart';
import 'package:blog_app_2/main.dart';
import 'package:blog_app_2/ui/home/home_screen.dart';
import 'package:blog_app_2/utils/message_utils.dart';
import 'package:flutter/material.dart';

class LoginVm extends BaseVm {
  final BuildContext context = navigatorKey.currentState!.context;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void validateInput() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty) {
      MessageUtils.showMessage(message: 'Email cannot be empty', isError: true);
    } else if (password.isEmpty) {
      MessageUtils.showMessage(
          message: 'Password cannot be empty', isError: true);
    } else {
      _login(email: email, password: password);
    }
  }

  Future<void> _login({
    required String email,
    required String password,
  }) async {
    isLoading = true;
    ResponseModel responseModel = await authRepo.login(
      email: email,
      password: password,
    );
    MessageUtils.showMessage(
        message: responseModel.message, isError: !responseModel.success);

    if (responseModel.success) {
      await authRepo.localData.setToken(token: responseModel.data['jwt']);
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    } else {
      isLoading = false;
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
