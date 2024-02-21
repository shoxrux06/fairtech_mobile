import 'package:fairtech_mobile/src/config/router/app_routes.dart';
import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/local_storage.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:go_router/go_router.dart';
import '../../../components/loading_widgets/staggered_dots_wave.dart';
import '../bloc/splash_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    context.read<SplashBloc>().add(const SplashEvent());
  }

  Widget logoutDialog(BuildContext context) {
    return AlertDialog(
      title: Text(context.tr('pleaseConfirm'),
          style: context.textStyle.regularTitle2
              .copyWith(color: context.color?.red)),
      content: Text(context.tr('deleteProfileMessage'),
          style: context.textStyle.regularTitle2
              .copyWith(color: context.theme.primaryColor)),
      actions: [
        TextButton(
          onPressed: () => context.pop(false),
          child: Text(context.tr('no'),
              style: context.textStyle.regularTitle2
                  .copyWith(color: context.theme.primaryColor)),
        ),
        TextButton(
          onPressed: () => context.pop(true),
          child: Text(context.tr('yes'),
              style: context.textStyle.regularTitle2
                  .copyWith(color: context.color?.red)),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => BlocListener<SplashBloc, SplashState>(
        listener: (context, state) async {
          if (state.isTimerFinished) {

            // context.pushReplacement(Routes.main);

            if (LocalStorage.instance.getToken().isNotEmpty) {
              final passCode = LocalStorage.instance.getPinCode();
              if (passCode.isNotEmpty) {
                screenLock(
                  context: context,
                  correctString: passCode,
                  useBlur: false,
                  canCancel: false,
                  config: const ScreenLockConfig(
                    backgroundColor: Colors.white,
                  ),
                  secretsConfig: const SecretsConfig(
                      secretConfig: SecretConfig(
                          disabledColor: Colors.black,
                          enabledColor: Colors.amber,
                          size: 24)
                  ),
                  onUnlocked: () {
                    context.pop();
                    context.pushReplacement(Routes.main);
                  },
                );
              } else {
                context.push(Routes.emptyPage);
              }
            }else{
              context.pushReplacement(Routes.signIn);
            }



            // if ((LocalStorage.instance.isGuest() == false) && LocalStorage.instance.getToken().isEmpty) {
            //   showDialog(
            //     barrierDismissible: true,
            //     barrierColor: Colors.grey.withOpacity(0.989),
            //     context: context,
            //     builder: (ctx) => Theme(
            //       data: ThemeData(
            //         backgroundColor: Colors.grey.withOpacity(0.989),
            //       ),
            //       child: CupertinoAlertDialog(
            //         content: Column(
            //           mainAxisSize: MainAxisSize.min,
            //           children: [
            //             Text(
            //               'Ilovadagi mavjud barcha xizmatlardan foydalanishni hoxlaysizmi?',
            //               style: ctx.textStyle.largeTitle2.copyWith(color: ctx.color?.primaryText),
            //               textAlign: TextAlign.center,
            //             ),
            //           ],
            //         ),
            //         actions: [
            //           CupertinoDialogAction(
            //             isDestructiveAction: true,
            //             onPressed: ()async {
            //               ctx.pop();
            //               ctx.go(Routes.main);
            //               await LocalStorage.instance.setGuest(true);
            //             },
            //             child: Text('Yo\'q'),
            //           ),
            //           CupertinoDialogAction(
            //             isDefaultAction: true,
            //             onPressed: () {
            //               ctx.pop();
            //             },
            //             child: Text('Ha'),
            //           ),
            //         ],
            //       ),
            //     ),
            //   );
            // }
            // if (!LocalStorage.instance.isGuest()) {
            //   if (LocalStorage.instance.getToken().isNotEmpty) {
            //     final passCode = LocalStorage.instance.getPinCode();
            //     if (passCode.isNotEmpty) {
            //       screenLock(
            //         context: context,
            //         correctString: passCode,
            //         useBlur: false,
            //         canCancel: false,
            //         config: const ScreenLockConfig(
            //           backgroundColor: Colors.white,
            //         ),
            //         secretsConfig: const SecretsConfig(
            //             secretConfig: SecretConfig(
            //                 disabledColor: Colors.black,
            //                 enabledColor: Colors.amber,
            //                 size: 24)
            //         ),
            //         onUnlocked: () {
            //           context.pop();
            //           context.pushReplacement(Routes.main);
            //         },
            //       );
            //     } else {
            //       context.push(Routes.emptyPage);
            //     }
            //   } else {
            //     context.pushReplacement(Routes.signIn);
            //   }
            // } else {
            //   context.pushReplacement(Routes.main);
            // }


          }
        },
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF029783),
                    Color(0xFF168070),
                    Color(0xFF2A675B),
                  ],
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(32),
                          child: Image.asset(
                            AppConstants.logoPng,
                            width: Responsive.width(80, context),
                            height: Responsive.height(25, context),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                    bottom: 80,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: StaggeredDotsWave(
                        color: Colors.white,
                        size: 48,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
