import 'dart:convert';
import 'dart:io';

import 'package:blog_app_2/data/base/base_vm.dart';
import 'package:blog_app_2/data/models/response_model.dart';
import 'package:blog_app_2/data/models/user_model.dart';
import 'package:blog_app_2/main.dart';
import 'package:blog_app_2/ui/user_profile/user_profile_screen.dart';
import 'package:blog_app_2/utils/message_utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserProfileVm extends BaseVm {
  BuildContext context = navigatorKey.currentState!.context;
  TextEditingController nameController = TextEditingController();
  UserModel? _userModel;
  bool _isLoading = true;
  bool _isUpdatingUserName = false;

  File? _postImage;

  File? get postImage => _postImage;

  set postImage(File? value) {
    _postImage = value;
    notifyListeners();
  }

  bool get isUpdatingUserName => _isUpdatingUserName;

  set isUpdatingUserName(bool value) {
    _isUpdatingUserName = value;
    notifyListeners();
  }

  UserModel? get userModel => _userModel;

  set userModel(UserModel? value) {
    _userModel = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getUserProfileData() async {
    ResponseModel responseModel = await userRepo.getUserProfileData();
    if (responseModel.success) {
      _userModel = UserModel.fromJson(responseModel.data);
    } else {
      MessageUtils.showMessage(message: responseModel.message, isError: true);
    }
    isLoading = false;
  }

  Future<void> _updateUserProfileImage() async {
    ResponseModel responseModel = await userRepo.updateUserProfileImage(
        image: base64Encode(postImage!.readAsBytesSync()));
    if (responseModel.success) {
      Navigator.of(context).pushReplacementNamed(UserProfileScreen.routeName);
    }
  }

  Future<void> pickImageFromGallery() async {
    XFile? xFile = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 25);
    if (xFile != null) {
      postImage = File(xFile.path);
      _updateUserProfileImage();
    }
  }

  void validateUserName() {
    String userName = nameController.text.trim();
    if (userName.isEmpty) {
      MessageUtils.showToast(message: 'User name cannot be empty');
    } else {
      _updateUserName(userName: userName);
    }
  }

  Future<void> _updateUserName({required String userName}) async {
    isUpdatingUserName = true;
    ResponseModel responseModel =
        await userRepo.updateUserName(userName: userName);
    MessageUtils.showMessage(
        message: responseModel.message, isError: !responseModel.success);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
}
