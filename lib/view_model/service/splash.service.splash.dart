import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_practice_app/models/user.models.dart';
import 'package:mvvm_practice_app/view_model/user/user.view_model.dart';

import '../../../utils/routes/routes_name.routes.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  //check authentication

  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) async {
      if (value.token == "null" || value.token == "") {
        await Future.delayed(const Duration(seconds: 5));
        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        await Future.delayed(const Duration(seconds: 5));
        // ignore: use_build_context_synchronously
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesName.home,
          (route) => false,
        );
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
        print(stackTrace.toString());
      }
    });
  }
}
