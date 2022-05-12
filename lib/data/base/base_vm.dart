import 'package:blog_app_2/data/repositories/auth_repo/auth_repo.dart';
import 'package:blog_app_2/data/repositories/post_repo/post_repo.dart';
import 'package:blog_app_2/data/repositories/user_repo/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class BaseVm extends ChangeNotifier {
  AuthRepo authRepo = GetIt.I.get<AuthRepo>();
  UserRepo userRepo = GetIt.I.get<UserRepo>();
  PostRepo postRepo = GetIt.I.get<PostRepo>();
}
