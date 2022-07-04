import 'package:flutter/material.dart';
import 'package:mvvm_practice_app/models/user.models.dart';
import 'package:mvvm_practice_app/resources/app_urls.resources.dart';

import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  //save user data

  Future<bool> saveUser(UserModel userModel) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(AppUrls.appToken, userModel.token.toString());
    notifyListeners();
    return true;
  }

//get user data
  Future<UserModel> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString(AppUrls.appToken);
    return UserModel(
      token: token.toString(),
    );
  }

  //logout

  Future<bool> logoutUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(AppUrls.appToken);
    return true;
  }
}
