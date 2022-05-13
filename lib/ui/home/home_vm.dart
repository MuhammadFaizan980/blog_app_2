import 'package:blog_app_2/data/base/base_vm.dart';
import 'package:blog_app_2/data/models/post_model.dart';
import 'package:blog_app_2/data/models/response_model.dart';
import 'package:blog_app_2/utils/message_utils.dart';
import 'package:flutter/material.dart';

class HomeVm extends BaseVm {
  List<PostModel> userPosts = [];
  bool _isLoading = true;
  ScrollController postListController = ScrollController();
  int page = 1;
  bool paginatingOrRefreshingData = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void init() {
    _getUserPosts();
    _attachListenerToList();
  }

  Future<void> _getUserPosts() async {
    isLoading = true;
    ResponseModel responseModel = await postRepo.getAllPosts(page: page);
    if (responseModel.success) {
      userPosts.addAll((responseModel.data as List)
          .map((e) => PostModel.fromJson(e))
          .toList());
    } else {
      MessageUtils.showMessage(message: responseModel.message, isError: true);
    }

    isLoading = false;
  }

  Future<void> deleteUserPost({required int index}) async {
    ResponseModel responseModel =
        await postRepo.deletePost(postId: userPosts[index].sId!);
    MessageUtils.showMessage(
        message: responseModel.message, isError: !responseModel.success);
    if (responseModel.success) {
      userPosts.removeAt(index);
      notifyListeners();
    }
  }

  Future<void> refreshList() async {
    page = 1;
    userPosts.clear();
    paginatingOrRefreshingData = true;
    await _getUserPosts();
    paginatingOrRefreshingData = false;
  }

  void _attachListenerToList() {
    postListController.addListener(() async {
      if (postListController.offset ==
              postListController.position.maxScrollExtent &&
          !_isLoading) {
        page++;
        paginatingOrRefreshingData = true;
        await _getUserPosts();
        paginatingOrRefreshingData = false;
      }
    });
  }
}
