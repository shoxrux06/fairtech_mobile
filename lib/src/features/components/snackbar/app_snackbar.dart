import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class AppSnackBar {

  static customMessage(BuildContext context,String text, String desc)=> Flushbar(
    title: text,
    titleColor: Colors.white,
    message: desc,
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.FLOATING,
    reverseAnimationCurve: Curves.decelerate,
    forwardAnimationCurve: Curves.elasticOut,
    backgroundColor: Colors.red,
    boxShadows: [BoxShadow(color: Colors.blueAccent.shade100, offset: Offset(0.0, 2.0), blurRadius: 3.0)],
    backgroundGradient: LinearGradient(colors: [Colors.blueGrey, Colors.black]),
    isDismissible: false,
    duration: Duration(seconds: 4),
    icon: Icon(
      Icons.check,
      color: Colors.greenAccent,
    ),
    showProgressIndicator: false,
    progressIndicatorBackgroundColor: Colors.blueGrey,
    titleText: Text(
     text,
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.green, fontFamily: "ShadowsIntoLightTwo"),
    ),
    messageText: Text(
      desc,
      style: TextStyle(fontSize: 18.0, color: Colors.green, fontFamily: "ShadowsIntoLightTwo"),
    ),
  )..show(context);

  static showSuc(BuildContext context, String title) =>  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(title),
        backgroundColor: Colors.green,
      ));
  static showSuccessSnackBar(BuildContext context, String text, String desc) {
    Future.delayed(Duration.zero,(){
      Flushbar(
        title: text,
        titleColor: Colors.white,
        message: desc,
        flushbarPosition: FlushbarPosition.TOP,
        flushbarStyle: FlushbarStyle.FLOATING,
        reverseAnimationCurve: Curves.decelerate,
        forwardAnimationCurve: Curves.elasticOut,
        backgroundColor: Colors.red,
        boxShadows: [BoxShadow(color: Colors.blueAccent.shade100, offset: Offset(0.0, 2.0), blurRadius: 3.0)],
        backgroundGradient: LinearGradient(colors: [Colors.blueGrey, Colors.black]),
        isDismissible: false,
        duration: Duration(seconds: 4),
        icon: Icon(
          Icons.check,
          color: Colors.greenAccent,
        ),
        showProgressIndicator: false,
        progressIndicatorBackgroundColor: Colors.blueGrey,
        titleText: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.yellow[600], fontFamily: "ShadowsIntoLightTwo"),
        ),
        messageText: Text(
          desc,
          style: TextStyle(fontSize: 18.0, color: Colors.green, fontFamily: "ShadowsIntoLightTwo"),
        ),
      )..show(context);
    });
  }

  static showWarningSnackBar(BuildContext context, String desc) {
    Future.delayed(Duration.zero,(){
      Flushbar(
        title: 'Warning',
        titleColor: Colors.white,
        message: desc,
        flushbarPosition: FlushbarPosition.TOP,
        flushbarStyle: FlushbarStyle.FLOATING,
        reverseAnimationCurve: Curves.decelerate,
        forwardAnimationCurve: Curves.elasticOut,
        backgroundColor: Colors.red,
        boxShadows: [BoxShadow(color: Colors.blueAccent.shade100, offset: Offset(0.0, 2.0), blurRadius: 3.0)],
        backgroundGradient: LinearGradient(colors: [Colors.blueGrey, Colors.black]),
        isDismissible: false,
        duration: Duration(seconds: 4),
        icon: const Icon(
          Icons.check,
          color: Colors.greenAccent,
        ),
        showProgressIndicator: false,
        progressIndicatorBackgroundColor: Colors.blueGrey,
        titleText: Text(
          'Warning',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.yellow[600], fontFamily: "ShadowsIntoLightTwo"),
        ),
        messageText: Text(
          desc,
          style: TextStyle(fontSize: 18.0, color: Colors.green, fontFamily: "ShadowsIntoLightTwo"),
        ),
      ).show(context);
    });
  }

  static showErrorSnackBar(BuildContext context, String text, String desc) =>
      Flushbar(
        title: text,
        titleColor: Colors.white,
        message: desc,
        flushbarPosition: FlushbarPosition.TOP,
        flushbarStyle: FlushbarStyle.FLOATING,
        reverseAnimationCurve: Curves.decelerate,
        forwardAnimationCurve: Curves.elasticOut,
        backgroundColor: Colors.red,
        boxShadows: [BoxShadow(color: Colors.red.shade100, offset: Offset(0.0, 2.0), blurRadius: 3.0)],
        backgroundGradient: LinearGradient(colors: [Colors.red, Colors.red.shade100]),
        isDismissible: false,
        duration: const Duration(seconds: 4),
        icon: const Icon(
          Icons.check,
          color: Colors.white,
        ),
        showProgressIndicator: false,
        progressIndicatorBackgroundColor: Colors.blueGrey,
        titleText: Text(
          text,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white, fontFamily: "ShadowsIntoLightTwo"),
        ),
        messageText: Text(
          desc,
          style: const TextStyle(fontSize: 18.0, color: Colors.white, fontFamily: "ShadowsIntoLightTwo"),
        ),
      )..show(context);
}
