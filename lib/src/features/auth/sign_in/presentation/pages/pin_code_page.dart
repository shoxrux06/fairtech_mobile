import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:go_router/go_router.dart';
import 'package:local_auth/local_auth.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../core/utils/local_storage.dart';

class PinCodePage extends StatefulWidget {
  const PinCodePage({super.key});

  @override
  _PinCodePageState createState() => _PinCodePageState();
}

class _PinCodePageState extends State<PinCodePage> {
  Future<void> localAuth(BuildContext context) async {
    final localAuth = LocalAuthentication();
    final didAuthenticate = await localAuth.authenticate(
      localizedReason: 'Please authenticate',
      // biometricOnly: true,
    );
    if (didAuthenticate) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 700,
              ),
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
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
                            // Release the confirmation state and return to the initial input state.
                            controller.unsetConfirmed();
                          },
                          child: const Text('Reset input'),
                        ),
                      );
                    },
                    child: const Text('Confirm mode'),
                  ),
                  ElevatedButton(
                    onPressed: () => screenLock(
                      context: context,
                      correctString: '1234',
                      customizedButtonChild: const Icon(
                        Icons.fingerprint,
                      ),
                      customizedButtonTap: () async => await localAuth(context),
                      onOpened: () async => await localAuth(context),
                    ),
                    child: const Text(
                      'use local_auth \n(Show local_auth when opened)',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => screenLock(
                      context: context,
                      correctString: '1234',
                      onUnlocked: () {
                        Navigator.pop(context);
                      },
                    ),
                    child: const Text('Next page with unlock'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
