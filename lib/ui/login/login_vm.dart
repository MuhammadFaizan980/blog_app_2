import 'package:blog_app_2/data/base/base_vm.dart';
import 'package:blog_app_2/data/models/response_model.dart';
import 'package:blog_app_2/utils/message_utils.dart';
import 'package:flutter/cupertino.dart';

class LoginVm extends BaseVm {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void validateInput() {
    String email = emailController.text;
    String password = passwordController.text;

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
      email: 'email',
      password: 'password',
    );
    MessageUtils.showMessage(message: responseModel.message);
    isLoading = false;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
