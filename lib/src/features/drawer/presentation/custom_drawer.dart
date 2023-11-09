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

  void _logout() {
    showDialog(
      context: scaffoldKey.currentContext!,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Text(ctx.tr('pleaseConfirm'), style: ctx.textStyle.regularTitle2.copyWith(color: ctx.color?.red)),
          content: Text(ctx.tr('doYouWantLogout'),style: ctx.textStyle.regularTitle2.copyWith(color: ctx.theme.primaryColor)),
          actions: [
            TextButton(
              onPressed: () {
                ctx.pop();
              },
              child: Text(ctx.tr('no'),style: ctx.textStyle.regularTitle2.copyWith(color: ctx.theme.primaryColor)),
            ),
            TextButton(
              onPressed: () {
                LocalStorage.instance.deleteToken();
                LocalStorage.instance.deletePinCode();
                ctx.pop();
                ctx.pushReplacement(Routes.signIn);
              },
              child: Text(ctx.tr('yes'),style: ctx.textStyle.regularTitle2.copyWith(color: ctx.color?.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          DrawerHeader(
            child: Column(
              children: [
                Image.asset(
                  AppConstants.profileImg,
                  width: 80,
                  height: 80,
                ),
                AppUtils.kGap4,
                Text(
                  LocalStorage.instance.getFullNameName().isNotEmpty ? LocalStorage.instance.getFullNameName() : 'Quroqov Shoxrux',
                  style: context.textStyle.largeTitle1,
                ),
                Text(
                  'ID 1234567',
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
            onTap: () {
              _logout();
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
                    SizedBox(
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
