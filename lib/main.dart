import 'package:fairtech_mobile/src/app_options.dart';
import 'package:fairtech_mobile/src/config/router/app_routes.dart';
import 'package:fairtech_mobile/src/config/themes/themes.dart';
import 'package:fairtech_mobile/src/core/di/dependency_manager.dart';
import 'package:fairtech_mobile/src/core/l10n/AppLocalizations.dart';
import 'package:fairtech_mobile/src/core/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await LocalStorage.getInstance();
  setUpDependencies();
  // HttpService().setCertificate();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_){
    runApp(
      ModelBinding(
          initialModel: AppOptions(
              themeMode: LocalStorage.instance.themeMode,
              locale: const Locale('uz')
          ),
          child:const MyApp()
      ),
    );
    final token = LocalStorage.instance.getToken();
    final pincode = LocalStorage.instance.getPinCode();

    DateTime from = DateTime(2012, 12, 25);
    DateTime to = DateTime.now();

    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
    print('pincode -->$pincode}');
    print('token -->$token}');
  }
  );
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final token = LocalStorage.instance.getToken();
    return MaterialApp.router(
      title: 'Fair tech',
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: scaffoldMessengerKey,

      /// theme style
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: AppOptions.of(context).themeMode,

      /// lang
      locale: AppOptions.of(context).locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      routerDelegate: AppGoRouter.router.routerDelegate,
      routeInformationParser: AppGoRouter.router.routeInformationParser,
      routeInformationProvider: AppGoRouter.router.routeInformationProvider,
    );
  }
}
