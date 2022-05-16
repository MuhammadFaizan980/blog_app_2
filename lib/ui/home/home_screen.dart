import 'package:blog_app_2/ui/create_post/create_post_screen.dart';
import 'package:blog_app_2/ui/home/home_vm.dart';
import 'package:blog_app_2/utils/app_colors.dart';
import 'package:blog_app_2/widgets/app_circular_loader.dart';
import 'package:blog_app_2/widgets/app_drawer.dart';
import 'package:blog_app_2/widgets/application_app_bar.dart';
import 'package:blog_app_2/widgets/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeVm>.reactive(
      viewModelBuilder: () => HomeVm(),
      onModelReady: (vm) => vm.init(),
      builder: (context, vm, _) => Scaffold(
        appBar: getAppBar(
          title: 'Home',
          actions: [
            IconButton(
              onPressed: () async {
                dynamic flag = await Navigator.of(context)
                    .pushNamed(CreatePostScreen.routeName);
                if (flag != null) {
                  vm.refreshList();
                }
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: vm.isLoading && !vm.paginatingOrRefreshingData
            ? AppCircularLoader()
            : RefreshIndicator(
                color: AppColors.primaryColor,
                onRefresh: () async {
                  await vm.refreshList();
                },
                child: ListView(
                  controller: vm.postListController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    ...vm.userPosts
                        .map(
                          (e) => PostWidget(userPost: e),
                        )
                        .toList(),
                  ],
                ),
              ),
        drawer: AppDrawer(),
      ),
    );
  }
}
