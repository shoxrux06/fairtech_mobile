import 'package:fairtech_mobile/main.dart';
import 'package:fairtech_mobile/src/core/di/dependency_manager.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/presentation/pages/auth_confirmed_page.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/presentation/pages/auth_oneid_page.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/presentation/pages/pin_code_page.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/presentation/pages/sign_in_page.dart';
import 'package:fairtech_mobile/src/features/drawer/about_system/presentation/pages/about_system_page.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/presentaion/bloc/appeals_bloc.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/presentaion/pages/appeals_page.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/presentaion/pages/create_appeals_page.dart';
import 'package:fairtech_mobile/src/features/drawer/presentation/help_page.dart';
import 'package:fairtech_mobile/src/features/drawer/personal_information/presentation/pages/personal_inforamtion_page.dart';
import 'package:fairtech_mobile/src/features/main/menu/services/presentation/bloc/services_bloc.dart';
import 'package:fairtech_mobile/src/features/main/menu/services/presentation/pages/qr_code_screen_page.dart';
import 'package:fairtech_mobile/src/features/main/menu/services/presentation/pages/scanner_result_page.dart';
import 'package:fairtech_mobile/src/features/main/menu/services/presentation/pages/widgets/tn_ved_code_response_widget.dart';
import 'package:fairtech_mobile/src/features/main/menu/services/presentation/pages/tnved_code_page.dart';
import 'package:fairtech_mobile/src/features/main/presentation/bloc/main/main_bloc.dart';
import 'package:fairtech_mobile/src/features/main/presentation/pages/main_page.dart';
import 'package:fairtech_mobile/src/features/drawer/settings/presentation/pages/settings_page.dart';
import 'package:fairtech_mobile/src/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:fairtech_mobile/src/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'routes.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class AppGoRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: Routes.initial,
    routes: <RouteBase>[
      ///splash
      GoRoute(
        name: Routes.initial,
        path: Routes.initial,
        pageBuilder: (_, state) => CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 1200),
          child: BlocProvider(
            create: (_) => SplashBloc(),
            child: const SplashPage(),
          ),
          transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          ),
        ),
      ),

      /// main
      GoRoute(
        name: Routes.main,
        path: Routes.main,
        pageBuilder: (_, state) => CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 1200),
          child: MultiBlocProvider(
            providers: [
              BlocProvider<MainBloc>(create: (_) => sl<MainBloc>()),
              BlocProvider<ServicesBloc>(create: (_) => sl<ServicesBloc>()),
            ],
            child: MainPage(),
          ),
          transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
        name: Routes.authOneId,
        path: Routes.authOneId,
        pageBuilder: (_, state) => CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 1200),
          child: BlocProvider(
            create: (_) => SignInBloc(signInRepository),
            child: const AuthOneIDPage(),
          ),
          transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
        name: Routes.signIn,
        path: Routes.signIn,
        pageBuilder: (_, state) => CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 1200),
          child: BlocProvider(
            create: (_) => SignInBloc(signInRepository),
            child: const SignInPage(),
          ),
          transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
        name: Routes.authConfirmed,
        path: Routes.authConfirmed,
        pageBuilder: (_, state) => CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 1200),
          child: const AuthConfirmedPage(),
          transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
        name: Routes.settings,
        path: Routes.settings,
        pageBuilder: (_, state) => CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 1200),
          child: const SettingsPage(),
          transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
        name: Routes.help,
        path: Routes.help,
        pageBuilder: (_, state) => CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 1200),
          child: const HelpPage(),
          transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
          name: Routes.setPinCode,
          path: Routes.setPinCode,
          pageBuilder: (_, state) {
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 1200),
              child: BlocProvider(
                create: (_) => SignInBloc(signInRepository),
                child: PinCodePage(),
              ),
              transitionsBuilder: (_, animation, __, child) => FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              ),
            );
          }),
      GoRoute(
        name: Routes.personalInformation,
        path: Routes.personalInformation,
        pageBuilder: (_, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 1200),
            child: PersonalInformationPage(),
            transitionsBuilder: (_, animation, __, child) => FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            ),
          );
        },
      ),
      GoRoute(
        name: Routes.appeals,
        path: Routes.appeals,
        pageBuilder: (_, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 1200),
            child: const AppealsPage(),
            transitionsBuilder: (_, animation, __, child) => FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            ),
          );
        },
      ),
      GoRoute(
        name: Routes.createAppeals,
        path: Routes.createAppeals,
        pageBuilder: (_, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 1200),
            child: BlocProvider(
              create: (context) => AppealsBloc(appealsRepository),
              child: const CreateAppealsPage(),
            ),
            transitionsBuilder: (_, animation, __, child) => FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            ),
          );
        },
      ),
      GoRoute(
        name: Routes.aboutSystem,
        path: Routes.aboutSystem,
        pageBuilder: (_, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 1200),
            child: const AboutSystemPage(),
            transitionsBuilder: (_, animation, __, child) => FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            ),
          );
        },
      ),
      GoRoute(
        name: Routes.qrCode,
        path: Routes.qrCode,
        pageBuilder: (_, state) => CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 1200),
          child: BlocProvider(
            create: (_) => ServicesBloc(servicesRepository),
            child: const QrCodeScreenPage(),
          ),
          transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
        name: Routes.tnVedCode,
        path: Routes.tnVedCode,
        pageBuilder: (_, state) => CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 1200),
          child: BlocProvider(
            create: (_) => ServicesBloc(servicesRepository),
            child: TnVedCodePage(),
          ),
          transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
          name: Routes.scannerResult,
          path: Routes.scannerResult,
          pageBuilder: (_, state) {
            final extra = state.extra as Map;
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 1200),
              child: ScannerResultPage(
                code: extra['code'],
                onClose: extra['closeScreen'],
              ),
              transitionsBuilder: (_, animation, __, child) => FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              ),
            );
          }),
    ],
  );
}

class FadePageRoute<T> extends PageRouteBuilder<T> {
  FadePageRoute({required this.builder})
      : super(
          pageBuilder: (
            context,
            animation,
            secondaryAnimation,
          ) =>
              builder(context),
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
  final WidgetBuilder builder;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 1000);
}
