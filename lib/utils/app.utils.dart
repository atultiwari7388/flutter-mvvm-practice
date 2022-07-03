import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppUtils {
  //app message
  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  //error message
  static void flushErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.bounceIn,
        reverseAnimationCurve: Curves.easeInBack,
        margin: const EdgeInsets.all(8.0),
        message: message,
        backgroundColor: Colors.red,
        borderRadius: BorderRadius.circular(10),
        positionOffset: 20,
        flushbarPosition: FlushbarPosition.TOP,
        duration: const Duration(seconds: 3),
      )..show(context),
    );
  }
}
