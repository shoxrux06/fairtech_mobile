import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage{
  static SharedPreferences? _preferences;

  LocalStorage._();

  static LocalStorage? _localStorage;

  static LocalStorage instance = LocalStorage._();

  static Future<LocalStorage> getInstance()async{
    if(_localStorage == null){
      _localStorage = LocalStorage._();
      await _localStorage?._init();
    }
    return _localStorage!;
  }

  Future<void> _init() async{
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> setToken(String? token) async {
    if (_preferences != null) {
      await _preferences!.setString(AppConstants.keyToken, token ?? '');
    }
  }

  String getToken() => _preferences?.getString(AppConstants.keyToken) ?? '';

  Future<void> setUserId(int? userId) async {
    if (_preferences != null) {
      await _preferences!.setInt(AppConstants.keyUserId, userId ?? 0);
    }
  }
  Future<void> setUserName(String? username) async {
    if (_preferences != null) {
      await _preferences!.setString(AppConstants.keyUserName, username ?? '');
    }
  }

  Future<void> setFullName(String? fullName) async {
    if (_preferences != null) {
      await _preferences!.setString(AppConstants.keyFullName, fullName ?? '');
    }
  }

  String getFullNameName() => _preferences?.getString(AppConstants.keyFullName) ??'';

  Future<void> setUserPhone(String? phone) async {
    if (_preferences != null) {
      await _preferences!.setString(AppConstants.keyUserPhone, phone ?? '');
    }
  }

  Future<void> setPinCode(String? pinCode) async {
    if (_preferences != null) {
      await _preferences!.setString(AppConstants.keyPinCode, pinCode ?? '');
    }
  }

  int getUserId() => _preferences?.getInt(AppConstants.keyUserId) ??0;

  String getUserName() => _preferences?.getString(AppConstants.keyUserName) ??'';

  String getPinCode() => _preferences?.getString(AppConstants.keyPinCode) ??'';

  String getUserPhone() => _preferences?.getString(AppConstants.keyUserPhone) ??'';

  void deleteToken() => _preferences?.remove(AppConstants.keyToken);

  void deleteUserId() => _preferences?.remove(AppConstants.keyUserId);
  void deleteUsername() => _preferences?.remove(AppConstants.keyUserName);
  void deleteUserPhone() => _preferences?.remove(AppConstants.keyUserPhone);
  void deletePinCode() => _preferences?.remove(AppConstants.keyPinCode);

  Future<void> setThemeMode(ThemeMode mode) async {
    await _preferences?.setString(AppConstants.keyThemMode, mode.name);
  }

  ThemeMode get themeMode => switch (_preferences?.getString(AppConstants.keyThemMode)) {
    'system' => ThemeMode.system,
    'light' => ThemeMode.light,
    'dark' => ThemeMode.dark,
    _ => ThemeMode.system,
  };

  Future<void> setLanguage(String? lang) async {
    if (_preferences != null) {
      await _preferences!.setString(AppConstants.keyLang, lang ?? '');
    }
  }

  String getLanguage() => _preferences?.getString(AppConstants.keyLang) ?? '';
}