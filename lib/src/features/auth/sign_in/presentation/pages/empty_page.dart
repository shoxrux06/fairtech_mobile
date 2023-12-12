import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/router/app_routes.dart';

class EmptyPage extends StatefulWidget {
  const EmptyPage({super.key});

  @override
  State<EmptyPage> createState() => _EmptyPageState();
}

class _EmptyPageState extends State<EmptyPage> {
  @override
  void initState() {
    print('Empty Screen *************');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero,(){
      final controller = InputController();
      screenLockCreate(
        context: context,
        inputController: controller,
        useBlur: false,
        config: const ScreenLockConfig(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(fontSize: 24),
        ),
        onConfirmed: (matchedText) {
          if (controller.confirmedInput == matchedText) {
            print('************ Confirmed ************');
            Navigator.of(context).pop();
            context.pushReplacement(Routes.main);
          }
        },
        footer: TextButton(
          onPressed: () {
            controller.unsetConfirmed();
          },
          child: const Text('Reset input'),
        ),
      );
    });
    return Scaffold();
  }
}
