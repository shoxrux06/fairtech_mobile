import 'dart:convert';

import 'package:fairtech_mobile/src/config/router/app_routes.dart';
import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/core/utils/local_storage.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  void _launchUrl() async {
    String url = "https://my.fairtech.uz/";
    print("launchingUrl: $url");
    if (await canLaunch(url)) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }


  Widget logoutDialog(BuildContext context){
    return AlertDialog(
      title: Text(context.tr('pleaseConfirm'), style: context.textStyle.regularTitle2.copyWith(color: context.color?.red)),
      content: Text(context.tr('doYouWantLogout'),style: context.textStyle.regularTitle2.copyWith(color: context.theme.primaryColor)),
      actions: [
        TextButton(
          onPressed: () => context.pop(false),
          child: Text(context.tr('no'),style: context.textStyle.regularTitle2.copyWith(color: context.theme.primaryColor)),
        ),
        TextButton(
          onPressed: () => context.pop(true),
          child: Text(context.tr('yes'),style: context.textStyle.regularTitle2.copyWith(color: context.color?.red)),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    String image = LocalStorage.instance.getUserImageUrl();

    final memImage = const Base64Decoder().convert(image);
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          DrawerHeader(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child:(LocalStorage.instance.getUserImageUrl().isEmpty)? Image.asset(
                    AppConstants.userPng,
                    width: 80,
                    height: 80,
                    fit: BoxFit.fill,
                  ): Image.memory(
                    memImage,
                    width: 80,
                    height: 80,
                    fit: BoxFit.fill,
                  ),
                ),
                AppUtils.kGap4,
                Text(
                  LocalStorage.instance.getFullNameName().isNotEmpty ? LocalStorage.instance.getFullNameName() : '---',
                  style: context.textStyle.largeTitle2,
                ),
                Text(
                  'ID ${LocalStorage.instance.getUserId()}',
                    style: context.textStyle.regularTitle1.copyWith(color: Color(0xFF95969D), fontWeight: FontWeight.w400, fontSize: 12),
                )
              ],
            ),
          ),
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
            dense: true,
            leading: SvgPicture.asset(AppConstants.personalInfoSvg),
            title: Text(
              context.tr('personalInformation'),
              style: context.textStyle.regularTitle1,
            ),
            onTap: () {
              context.push(Routes.personalInformation);
            },
          ),
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
            dense: true,
            leading: SvgPicture.asset(AppConstants.appealsSvg),
            title: Text(
              context.tr('appeals'),
              style: context.textStyle.regularTitle1,
            ),
            onTap: () {
              context.push(Routes.appeals);
            },
          ),
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
            dense: true,
            leading: SvgPicture.asset(AppConstants.helpSvg),
            title: Text(
              context.tr('help'),
              style: context.textStyle.regularTitle1,
            ),
            onTap: () {
              context.pushNamed(Routes.help);
              // Share.share(
              //     'Эй, проверьте это замечательное приложение по адресу: https://play.google.com/store/apps/details?id=com.goodafishamarket.afisha_market');
            },
          ),
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
            dense: true,
            leading: SvgPicture.asset(AppConstants.settingsSvg),
            title: Text(
              context.tr('settings'),
              style: context.textStyle.regularTitle1,
            ),
            onTap: () {
              context.pushNamed(Routes.settings);
            },
          ),
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
            dense: true,
            leading: SvgPicture.asset(AppConstants.privacySvg),
            title: Text(
              context.tr('privacyPolicy'),
              style: context.textStyle.regularTitle1,
            ),
            onTap: () {},
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
            dense: true,
            leading: SvgPicture.asset(AppConstants.offertaSvg),
            title: Text(
              context.tr('publicOffering'),
              style: context.textStyle.regularTitle1,
            ),
            onTap: () {

            },
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
            dense: true,
            leading: SvgPicture.asset(AppConstants.infoSvg),
            title: Text(
              context.tr('aboutTheSystem'),
              style: context.textStyle.regularTitle1,
            ),
            onTap: () {
              context.push(Routes.aboutSystem);
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
            dense: true,
            leading: SvgPicture.asset(AppConstants.logoutSvg),
            title: Text(
              context.tr('logout'),
              style: context.textStyle.regularTitle1.copyWith(color: context.color?.red),
            ),
            onTap: () async {
              bool? yes =
                  await showDialog<bool>(context: context, builder: logoutDialog);
              if (yes == true) {
                LocalStorage.instance.deleteToken();
                LocalStorage.instance.deletePinCode();
                LocalStorage.instance.deleteFullName();
                LocalStorage.instance.deleteUserPassword();
                LocalStorage.instance.deleteUserId();
                LocalStorage.instance.deleteUserPhone();
                context.pushReplacement(Routes.signIn);
              } else {
                Navigator.pop(context);
              }
              },
          ),
          AppUtils.kGap24,
          InkWell(
            onTap: () {
              _launchUrl();
            },
            child: Container(
              padding: EdgeInsets.all(12),
              width: Responsive.width(50, context),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFF2A675B),
                    Color(0xFF168070),
                    Color(0xFF029783),
                  ],
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppConstants.webLabel),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      'my.fairtech.uz',
                      style: context.textStyle.regularTitle1.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
