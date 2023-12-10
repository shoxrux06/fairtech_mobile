import 'package:fairtech_mobile/src/config/router/app_routes.dart';
import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/core/utils/local_storage.dart';
import 'package:fairtech_mobile/src/features/components/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:go_router/go_router.dart';

class AuthConfirmedPage extends StatefulWidget {
  const AuthConfirmedPage({super.key});

  @override
  State<AuthConfirmedPage> createState() => _AuthConfirmedPageState();
}

class _AuthConfirmedPageState extends State<AuthConfirmedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:  Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppUtils.kGap40,
              Image.asset(
                AppConstants.logoPng,
                width: 140,
                height: 140,
              ),
              AppUtils.kGap40,
              Stack(
                children: [
                  Image.asset(
                    AppConstants.authConfBack,
                    width: 100,
                    height: 100,
                  ),
                  Positioned(
                    right: 20,
                    bottom: 0,
                    child: Image.asset(
                      AppConstants.authConfFront,
                      width: 40,
                      height: 80,
                    ),
                  ),
                  Positioned(
                    left: 20,
                    bottom: 0,
                    child: Image.asset(
                      AppConstants.authConfFront2,
                      width: 40,
                      height: 80,
                    ),
                  ),
                ],
              ),
              AppUtils.kGap40,
              Text(
                'Tasdiqlandi!',
                style: TextStyle(
                  color: context.color?.primaryText,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
              AppUtils.kGap24,
              Text(
                'Siz oneID tizimidan muvaffaqiyali o‘tdingiz',
                style: TextStyle(
                  color: context.color?.primaryText.withOpacity(0.5),
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              AppUtils.kGap12,
              InkWell(
                onTap: () {
                  final controller = InputController();
                  screenLockCreate(
                    context: context,
                    inputController: controller,
                    onConfirmed: (matchedText) async {
                      if (controller.confirmedInput == matchedText) {
                        await LocalStorage.instance.setPinCode(controller.confirmedInput);
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
                },
                child: const CustomButton(text: 'Tizimga kirish',),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
