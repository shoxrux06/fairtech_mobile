import 'package:flutter/material.dart';

class AppConstants {
  ///api

  ///Base Url API
  static const baseUrl = 'https://app.fairtech.uz';
  static const baseUrlLocal = 'http://10.10.5.82:8085';

  ///Sign in with One Id and Update token API
  static const redirect = '/api/v.1/product-auth/auth/oneid/redirectUri';
  static const updateToken = '/api/v.1/product-auth/auth-payload';
  static const editPassword = '/api/v.1/product-auth/edit-password?';

  ///Appeal API
  static const getProductAppealsList = '/api/v.1/outer-cabinet/list-search-status?';
  static const getAppealsCount = '/api/v.1/outer-cabinet/get/status-count';
  static const getProductAppealsCount = '/api/v.1/pharm/checkOutside?';

  ///Product Info API
  static const getProductInfoTnVed = '/api/v.1/bojxona/tnved-code?';
  static const getProductInfoByScanner = '/api/v.1/soliq/getInfo?';

  static const getPharmInfo = '/api/v.1/pharm/searchOutside?';
  static const getRegionList = '/api/v.1/geographical-region/get-region-soatos';
  static const getAllRegionList = '/api/v.1/geographical-region/get-all-region';
  static const getProfileData = '/api/v.1/outer-cabinet/profile-data';

  ///Fair Price API
  static const getMarketList = '/api/v.1/price_market/get/type';
  static const getOuterMarketList = '/api/v.1/price_market/list-search-outer?';
  static const getMarketProductListByType = '/api/v.1/price_product/list-search';
  static const getMarketProductList = '/api/v.1/price_sum/parents-table';
  static const getMarketProductListById = '/api/v.1//price_product/get-with-child/';
  static const getMarketBranchEmployeeProductList = '/api/v.1/price_product/outer/list-search';
  static const createProduct = '/api/v.1/price_sum/create?';
  static const createObyekt = '/api/v.1/price_market/create';
  static const oneProductAllSums = '/api/v.1/price_sum/one-product-all-sums';
  static const getYuridikInfo = '/api/v.1/yuridik-shaxs/get-info?';
  static const getYttInfo = '/api/v.1/ytt/get-info?';
  static const getObyektTypeList = '/api/v.1/price_market_type/list-search?keyword=';

  // https://app.fairtech.uz/api/v.1/price_product/list-search?keyword=&code=FOODS&type=

  static const productPriceHistoryList = '/api/v.1/price_sum/list-searchSet';
  static const getMeasuresList = '/api/v.1/price_measure/list-search';


  AppConstants._();
  ///prefs
  static const String keyToken = 'keyToken';
  static const String keyUserImageUrl = 'keyUserImageUrl';
  static const String keyIsGuest = 'keyIsGuest';
  static const String keyLang = 'keyLang';
  static const String keyUserId = 'keyUserId';
  static const String keyUserName = 'keyUserName';
  static const String keyUserPassword = 'keyUserPassword';
  static const String keyFullName = 'keyFullName';
  static const String keyUserPhone = 'keyUserPhone';
  static const String keyThemMode = 'keyThemMode';
  static const String keyPinCode = 'keyPinCode';
  static const String keyAllNumber = 'keyAllNumber';
  static const String keyProcessNumber = 'keyProcessNumber';
  static const String keyFinishedNumber = 'keyFinishedNumber';

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
  static const String idPerson = 'assets/icons/idperson.svg';
  static const String idPerson2 = 'assets/icons/idperson2.svg';
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

  static const String productInfoSvg = 'assets/icons/product_info.svg';
  static const String pharmInfoSvg = 'assets/icons/pharm_info.svg';
  static const String fairPriceSvg = 'assets/icons/fair_price.svg';
  static const String appealMonitoringSvg = 'assets/icons/appeal_monitoring.svg';
  static const String appealCreateSvg = 'assets/icons/appeal_create.svg';
  static const String complianceSvg = 'assets/icons/compliance.svg';
  static const String tablesSvg = 'assets/icons/tables.svg';
  static const String tnVedSvg = 'assets/icons/pi_tnved.svg';
  static const String more3Svg = 'assets/icons/more_3.svg';
  static const String barcodeSvg = 'assets/icons/pi_barcode.svg';
  static const String scanSvg = 'assets/icons/pi_scan.svg';
  static const String allSvg = 'assets/icons/pi_descAll.svg';
  static const String productNameSvg = 'assets/icons/pi_productName.svg';
  static const String servicesSvg = 'assets/icons/pi_productLocation.svg';
  static const String addPriceSvg = 'assets/icons/addPrice.svg';
  static const String objectPriceSvg = 'assets/icons/objectPrice.svg';
  static const String userSvg = 'assets/icons/user.svg';
  static const String mapSvg = 'assets/icons/map.svg';


  ///png
  static const String userPng = 'assets/images/user.png';
  static const String logoPng = 'assets/images/logo.png';
  static const String instagramPng = 'assets/images/insta.png';
  static const String telegramPng = 'assets/images/telegram.png';
  static const String barcodePng = 'assets/images/barcode.png';
  static const String youTubePng = 'assets/images/youtube.png';
  static const String authConfBack = 'assets/images/authConfBack.png';
  static const String authConfFront = 'assets/images/authConfFront.png';
  static const String authConfFront2 = 'assets/images/authConfFront2.png';
  static const String profileImg = 'assets/images/profileImg.png';
  static const String foodImg = 'assets/images/food.png';
  static const String ingredientImg = 'assets/images/ingredient.png';
  static const String sunImg = 'assets/images/sun.png';
  static const String noImage = 'assets/images/no_image.png';
  static const String noInternet = 'assets/images/noInternet.png';
  static const String oilPng = 'assets/images/oil.png';
  static const String oil2Png = 'assets/images/oil2.png';
  static const String fairPrice = 'assets/images/fairPrice.png';
}