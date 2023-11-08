import 'package:flutter/material.dart';

class AppConstants{
  ///api
  static const baseUrl = 'https://app.fairtech.uz';
  static const redirect = '/api/v.1/product-auth/auth/oneid/redirectUri';
  static const editPassword = '/api/v.1/product-auth/edit-password?';
  static const getProductInfo = '/api/v.1/bojxona/tnved-code';
  AppConstants._();
  ///prefs
  static const String keyToken = 'keyToken';
  static const String keyLang = 'keyLang';
  static const String keyUserId = 'keyUserId';
  static const String keyUserName = 'keyUserName';
  static const String keyFullName = 'keyFullName';
  static const String keyUserPhone = 'keyUserPhone';
  static const String keyThemMode = 'keyThemMode';
  static const String keyPinCode = 'keyPinCode';

  ///icons
  static const IconData home = Icons.home;
  static const IconData fav = Icons.more;
  static const IconData account = Icons.person;
  static const IconData service = Icons.home_repair_service;

  ///svg
  static const String homeSvg = 'assets/icons/home.svg';
  static const String journalSvg = 'assets/icons/journal.svg';
  static const String educationSvg = 'assets/icons/education.svg';
  static const String moreSvg = 'assets/icons/more.svg';
  static const String oneId = 'assets/icons/oneId.svg';
  static const String personalInfoSvg = 'assets/icons/personalInfo.svg';
  static const String appealsSvg = 'assets/icons/appeals.svg';
  static const String helpSvg = 'assets/icons/help.svg';
  static const String settingsSvg = 'assets/icons/settings.svg';
  static const String privacySvg = 'assets/icons/privacy.svg';
  static const String offertaSvg = 'assets/icons/offerta.svg';
  static const String infoSvg = 'assets/icons/info.svg';
  static const String logoutSvg = 'assets/icons/logout.svg';
  static const String webLabel = 'assets/icons/webLabel.svg';
  static const String profileSvg = 'assets/icons/profile.svg';
  static const String notificationSvg = 'assets/icons/notification.svg';
  static const String textboxSvg = 'assets/icons/textbox.svg';
  static const String langSvg = 'assets/icons/lang.svg';
  static const String themeSvg = 'assets/icons/theme.svg';
  static const String deleteSvg = 'assets/icons/delete.svg';
  static const String scannerSvg = 'assets/icons/scanner.svg';
  static const String foodSvg = 'assets/icons/food.svg';
  static const String ingredientSvg = 'assets/icons/ingredient.svg';


  ///png
  static const String userPng = 'assets/images/user.png';
  static const String logoPng = 'assets/images/logo.png';
  static const String instagramPng = 'assets/images/insta.png';
  static const String telegramPng = 'assets/images/telegram.png';
  static const String youTubePng = 'assets/images/youtube.png';
  static const String authConfBack = 'assets/images/authConfBack.png';
  static const String authConfFront = 'assets/images/authConfFront.png';
  static const String authConfFront2 = 'assets/images/authConfFront2.png';
  static const String profileImg = 'assets/images/profileImg.png';
  static const String foodImg = 'assets/images/food.png';
  static const String ingredientImg = 'assets/images/ingredient.png';
  static const String sunImg = 'assets/images/sun.png';


}