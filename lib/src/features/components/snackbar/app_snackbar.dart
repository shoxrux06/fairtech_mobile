import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class AppSnackBar {
  static showSuc(BuildContext context, String title) =>  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(title),
        backgroundColor: Colors.green,
      ));
  static showSuccessSnackBar(BuildContext context, String text, String desc) {
    Future.delayed(Duration.zero,(){
      Flushbar(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        borderRadius: BorderRadius.circular(12),
        titleColor: Colors.white,
        message: desc,
        flushbarPosition: FlushbarPosition.TOP,
        flushbarStyle: FlushbarStyle.FLOATING,
        reverseAnimationCurve: Curves.easeInBack,
        forwardAnimationCurve: Curves.easeInOut,
        backgroundColor: Colors.red,
        boxShadows: [BoxShadow(color: Colors.blueAccent.shade100, offset: Offset(0.0, 2.0), blurRadius: 3.0)],
        backgroundGradient: LinearGradient(colors: [Colors.blueGrey, Colors.black]),
        isDismissible: true,
        duration: const Duration(seconds: 4),
        showProgressIndicator: false,
        progressIndicatorBackgroundColor: Colors.blueGrey,
        messageText: Text(
          desc,
          style: TextStyle(fontSize: 18.0, color: Colors.green, fontFamily: "ShadowsIntoLightTwo"),
        ),
      ).show(context);
    });
  }

  static showWarningSnackBar(BuildContext context, String desc) {
    Future.delayed(Duration.zero,(){
      Flushbar(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        borderRadius: BorderRadius.circular(12),
        titleColor: Colors.white,
        message: desc,
        flushbarPosition: FlushbarPosition.TOP,
        flushbarStyle: FlushbarStyle.FLOATING,
        reverseAnimationCurve: Curves.easeInBack,
        forwardAnimationCurve: Curves.easeInOut,
        backgroundColor: Colors.red,
        boxShadows: [BoxShadow(color: Colors.blueAccent.shade100, offset: Offset(0.0, 2.0), blurRadius: 3.0)],
        backgroundGradient: const LinearGradient(colors: [Colors.blueGrey, Colors.black]),
        isDismissible: true,
        duration: const Duration(seconds: 4),
        showProgressIndicator: false,
        progressIndicatorBackgroundColor: Colors.blueGrey,
        messageText: Container(
          margin: const EdgeInsets.all(4),
          child: Text(
            desc,
            style: const TextStyle(fontSize: 18.0, color: Colors.green, fontFamily: "ShadowsIntoLightTwo"),
          ),
        ),
      ).show(context);
    });
  }

  static showErrorSnackBar(BuildContext context, String text, String desc) =>
      Flushbar(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        borderRadius: BorderRadius.circular(12),
        titleColor: Colors.white,
        message: desc,
        flushbarPosition: FlushbarPosition.TOP,
        flushbarStyle: FlushbarStyle.FLOATING,
        reverseAnimationCurve: Curves.easeInBack,
        forwardAnimationCurve: Curves.easeInOut,
        backgroundColor: Colors.red,
        boxShadows: [BoxShadow(color: Colors.red.shade100, offset: Offset(0.0, 2.0), blurRadius: 3.0)],
        backgroundGradient: LinearGradient(colors: [Colors.red, Colors.red.shade100]),
        isDismissible: true,
        duration: const Duration(seconds: 4),
        showProgressIndicator: false,
        progressIndicatorBackgroundColor: Colors.blueGrey,
        messageText: Text(
          desc,
          style: const TextStyle(fontSize: 18.0, color: Colors.white, fontFamily: "ShadowsIntoLightTwo"),
        ),
      )..show(context);
}
