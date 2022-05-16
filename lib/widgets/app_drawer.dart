import 'package:blog_app_2/ui/home/home_vm.dart';
import 'package:blog_app_2/ui/splash/splash_screen.dart';
import 'package:blog_app_2/widgets/app_drawer_header.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AppDrawer extends ViewModelWidget<HomeVm> {
  @override
  Widget build(BuildContext context, HomeVm vm) {
    return Drawer(
      child: Column(
        children: [
          const AppDrawerHeader(),
          const Expanded(
            child: SizedBox(),
          ),
          ListTile(
            onTap: () async {
              await vm.postRepo.localData.clearStorage();
              Navigator.of(context)
                  .pushReplacementNamed(SplashScreen.routeName);
            },
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
