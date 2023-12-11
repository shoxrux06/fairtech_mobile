import 'package:fairtech_mobile/src/config/router/app_routes.dart';
import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/utils/local_storage.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/presentation/pages/empty_page.dart';
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

  @override
  Widget build(BuildContext context) => BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state.isTimerFinished) {
            context.pushReplacement(Routes.main);
            // if (LocalStorage.instance.getToken().isNotEmpty) {
            //   final passCode = LocalStorage.instance.getPinCode();
            //   if (passCode.isNotEmpty) {
            //     screenLock(
            //       context: context,
            //       correctString: passCode,
            //       useBlur: false,
            //       canCancel: false,
            //       config: const ScreenLockConfig(
            //         backgroundColor: Colors.white,
            //       ),
            //       secretsConfig: const SecretsConfig(
            //         secretConfig: SecretConfig(
            //           disabledColor: Colors.black,
            //           enabledColor: Colors.amber,
            //           size: 24
            //         )
            //       ),
            //       onUnlocked: () {
            //         Navigator.of(context).pop();
            //         context.pushReplacement(Routes.main);
            //       },
            //     );
            //   } else {
            //     Navigator.of(context).push(MaterialPageRoute(builder: (_) => const EmptyPage()));
            //   }
            // } else {
            //   context.pushReplacement(Routes.signIn);
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
                        Image.asset(
                          AppConstants.logoPng,
                          color: Colors.white,
                          width: Responsive.width(80, context),
                          height: Responsive.height(25, context),
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
