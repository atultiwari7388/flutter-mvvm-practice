import 'package:flutter/material.dart';
import 'package:mvvm_practice_app/utils/app.utils.dart';
import 'package:mvvm_practice_app/utils/routes/routes_name.routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            // AppUtils.toastMessage('Yay ! You are logged in');
            AppUtils.flushErrorMessage(
                "Ohh snap! , some error occured", context);
          },
          child: Text('Click Here to home screen'),
        ),
      ),
    );
  }
}
