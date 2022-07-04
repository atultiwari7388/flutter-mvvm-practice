import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:mvvm_practice_app/resources/components/round_button.components.resources.dart';
import 'package:mvvm_practice_app/utils/app.utils.dart';
import 'package:mvvm_practice_app/view_model/auth/auth.view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _obsecurePassword.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authView = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email_outlined),
              ),
              onFieldSubmitted: (value) {
                AppUtils.fieldFocusChange(
                  context,
                  emailFocusNode,
                  passwordFocusNode,
                );
              },
            ),
            ValueListenableBuilder(
              valueListenable: _obsecurePassword,
              builder: (BuildContext context, dynamic value, Widget? child) {
                return TextFormField(
                  controller: _passwordController,
                  obscureText: _obsecurePassword.value,
                  obscuringCharacter: '*',
                  focusNode: passwordFocusNode,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: 'password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        _obsecurePassword.value = !_obsecurePassword.value;
                      },
                      child: Icon(
                        _obsecurePassword.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: Adaptive.h(10)),
            RoundButton(
              text: "Login",
              loading: authView.loading,
              onPressed: () {
                if (_emailController.text.isEmpty &&
                    _passwordController.text.isEmpty) {
                  AppUtils.flushErrorMessage(
                      "Please enter email and password", context);
                } else if (_passwordController.text.length < 6) {
                  AppUtils.flushErrorMessage(
                      "Password must be at least 6 characters", context);
                } else {
                  Map data = {
                    "email": _emailController.text,
                    "password": _passwordController.text,
                  };

                  authView.loginUser(data, context);
                }
              },
            ),
            SizedBox(height: Adaptive.h(16)),
            InkWell(
              onTap: () {},
              child: const Text("Don't have an account? Sign up"),
            ),
          ],
        ),
      ),
    );
  }
}
