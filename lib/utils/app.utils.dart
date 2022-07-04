import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppUtils {
  //focus node
  static void fieldFocusChange(
    BuildContext context,
    FocusNode currentFocusNode,
    FocusNode nextFocusNode,
  ) {
    currentFocusNode.unfocus();
    FocusScope.of(context).requestFocus(nextFocusNode);
  }

  //app message
  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  //success message
  //error message
  static void flushSuccessMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.bounceIn,
        reverseAnimationCurve: Curves.easeInBack,
        margin: const EdgeInsets.all(8.0),
        message: message,
        backgroundColor: Colors.green,
        borderRadius: BorderRadius.circular(10),
        positionOffset: 20,
        flushbarPosition: FlushbarPosition.TOP,
        duration: const Duration(seconds: 3),
      )..show(context),
    );
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
