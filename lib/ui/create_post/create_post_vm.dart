import 'dart:convert';
import 'dart:io';

import 'package:blog_app_2/data/base/base_vm.dart';
import 'package:blog_app_2/data/models/response_model.dart';
import 'package:blog_app_2/main.dart';
import 'package:blog_app_2/utils/message_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostVm extends BaseVm {
  BuildContext context = navigatorKey.currentState!.context;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool _isLoading = false;
  File? _postImage;

  File? get postImage => _postImage;

  set postImage(File? value) {
    _postImage = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> pickImageFromGallery() async {
    XFile? xFile = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 25);
    if (xFile != null) {
      postImage = File(xFile.path);
    }
  }

  void validateInputs() {
    String title = titleController.text.trim();
    String description = descriptionController.text.trim();
    if (_postImage == null) {
      MessageUtils.showMessage(message: 'Select an image first', isError: true);
    } else if (title.isEmpty) {
      MessageUtils.showMessage(message: 'Title cannot be empty', isError: true);
    } else if (description.isEmpty) {
      MessageUtils.showMessage(
          message: 'Description cannot be empty', isError: true);
    } else {
      _addPost(title: title, description: description);
    }
  }

  Future<void> _addPost({
    required String title,
    required String description,
  }) async {
    isLoading = true;
    ResponseModel responseModel = await postRepo.createPost(
      title: title,
      description: description,
      image: base64Encode(_postImage!.readAsBytesSync()),
    );
    MessageUtils.showMessage(
        message: responseModel.message, isError: !responseModel.success);

    if (responseModel.success) {
      Navigator.of(context).pop(true);
    } else {
      isLoading = false;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
