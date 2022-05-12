import 'package:blog_app_2/data/api_client.dart';
import 'package:blog_app_2/data/app_model.dart';
import 'package:blog_app_2/data/repositories/auth_repo/auth_repo.dart';
import 'package:blog_app_2/data/repositories/auth_repo/auth_repo_imp.dart';
import 'package:blog_app_2/data/repositories/post_repo/post_repo.dart';
import 'package:blog_app_2/data/repositories/post_repo/post_repo_imp.dart';
import 'package:blog_app_2/data/repositories/user_repo/user_repo.dart';
import 'package:blog_app_2/data/repositories/user_repo/user_repo_imp.dart';
import 'package:blog_app_2/routes.dart';
import 'package:blog_app_2/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey();

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerSingleton<ApiClient>(ApiClient());
  GetIt.I.registerSingleton<AppModel>(AppModel());
  GetIt.I.registerSingleton<UserRepo>(UserRepoImp());
  GetIt.I.registerSingleton<AuthRepo>(AuthRepoImp());
  GetIt.I.registerSingleton<PostRepo>(PostRepoImp());
  await GetIt.I.allReady();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: onGenerateRoute,
      navigatorKey: navigatorKey,
      initialRoute: SplashScreen.routeName,
    );
  }
}
