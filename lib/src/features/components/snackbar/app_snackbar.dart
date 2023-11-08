import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class AppSnackBar {

  static customMessage(BuildContext context,String text, String desc)=>Flushbar(
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
    // mainButton: TextButton(
    //   onPressed: () {},
    //   child: Text(
    //     "CLAP",
    //     style: TextStyle(color: Colors.amber),
    //   ),
    // ),
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

  static showSuccessSnackBar(BuildContext context, String text) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(text),
          backgroundColor: Colors.green,
        ),
      );
  static showWarningSnackBar(BuildContext context, String text) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Align(
              alignment: Alignment.topCenter,
              child: Text(text)),
          backgroundColor: Colors.yellow,
        ),
      );

  static showErrorSnackBar(BuildContext context, String text) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(text),
          backgroundColor: Colors.red,
        ),
      );
}
