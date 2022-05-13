import 'package:blog_app_2/data/base/base_vm.dart';
import 'package:blog_app_2/data/models/response_model.dart';
import 'package:blog_app_2/main.dart';
import 'package:blog_app_2/ui/home/home_screen.dart';
import 'package:blog_app_2/utils/message_utils.dart';
import 'package:flutter/material.dart';

class RegisterVm extends BaseVm {
  final BuildContext context = navigatorKey.currentState!.context;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void validateInput() {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (name.isEmpty) {
      MessageUtils.showMessage(message: 'Name cannot be empty', isError: true);
    } else if (email.isEmpty) {
      MessageUtils.showMessage(message: 'Email cannot be empty', isError: true);
    } else if (password.isEmpty) {
      MessageUtils.showMessage(
          message: 'Password cannot be empty', isError: true);
    } else {
      _register(name: name, email: email, password: password);
    }
  }

  Future<void> _register({
    required String name,
    required String email,
    required String password,
  }) async {
    isLoading = true;
    ResponseModel responseModel = await authRepo.register(
      name: name,
      email: email,
      password: password,
    );
    MessageUtils.showMessage(
        message: responseModel.message, isError: !responseModel.success);

    if (responseModel.success) {
      await authRepo.localData.setToken(token: responseModel.data['jwt']);
      await authRepo.localData.setUserId(token: responseModel.data['_id']);
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    } else {
      isLoading = false;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
