import 'package:blog_app_2/ui/create_post/create_post_screen.dart';
import 'package:blog_app_2/ui/home/home_screen.dart';
import 'package:blog_app_2/ui/login/login_screen.dart';
import 'package:blog_app_2/ui/register/register_screen.dart';
import 'package:blog_app_2/ui/splash/splash_screen.dart';
import 'package:blog_app_2/ui/user_profile/user_profile_screen.dart';
import 'package:flutter/material.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      {
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );
      }
    case LoginScreen.routeName:
      {
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
      }
    case RegisterScreen.routeName:
      {
        return MaterialPageRoute(
          builder: (context) => RegisterScreen(),
        );
      }
    case HomeScreen.routeName:
      {
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      }
    case CreatePostScreen.routeName:
      {
        return MaterialPageRoute(
          builder: (context) => CreatePostScreen(),
        );
      }
    case UserProfileScreen.routeName:
      {
        return MaterialPageRoute(
          builder: (context) => UserProfileScreen(),
        );
      }
    default:
      {
        return MaterialPageRoute(
          builder: (context) => ErrorRoute(),
        );
      }
  }
}

class ErrorRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('You should not be here...'),
      ),
    );
  }
}
