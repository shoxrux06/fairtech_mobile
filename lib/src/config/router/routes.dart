part of 'app_routes.dart';

sealed class Routes {
  Routes._();

  static const String initial = '/';

  /// main
  static const String main = '/main';
  static const String internetConnection = '/internet_connection';
  static const String qrCode = '/qr_code';
  static const String scannerResult = '/scanner_result';
  static const String tnVedCode = '/tn_ved_code';
  static const String pharmInfo = '/pharm_info';

  /// auth
  static const String authOneId = '/auth_one_id';
  static const String signIn = '/sign_in';
  static const String authConfirmed = '/auth-confirmed';
  static const String setPinCode = '/set_pinCode';

  ///drawer
  static const String personalInformation = '/personal_information';
  static const String appeals = '/appeals';
  static const String createAppeals = '/create-appeals';
  static const String settings = '/settings';
  static const String help = '/help';
  static const String aboutSystem = '/about_system';

}