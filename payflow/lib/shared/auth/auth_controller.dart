import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class AuthController {
  var _isAutenticated = false;
  UserModel? _user;

  UserModel get user => _user!;

  void setUser(BuildContext context, UserModel? user) {
    if (user != null) {
      saveUser(user);
      _user = user;
      _isAutenticated = true;
      Navigator.pushReplacementNamed(context, "/home");
    } else {
      _isAutenticated = false;
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  Future<void> saveUser(UserModel? user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString("user", user!.toJson());
    return;
  }

  Future<void> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 2));
    if (instance.containsKey("user")) {
      final json = instance.get("user") as String;
      setUser(
        context,
        UserModel.fromJson(json),
      );
      return null;
    } else {
      setUser(context, null);
    }
  }
}
