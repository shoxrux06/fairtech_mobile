import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/core/utils/local_storage.dart';
import 'package:fairtech_mobile/src/features/components/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../../app_options.dart';
import '../../../../../config/router/app_routes.dart';
import '../../../../components/bottom_sheet/custom_bottom_sheet.dart';
import '../../../widgets/language_bottom_widget.dart';
import '../../../widgets/profile_item_widget.dart';

class SettingsPage extends StatelessWidget {
  static const String mainRoutes = '/settings-page';

  const SettingsPage({super.key});

  toggleDrawer() async {
    if (scaffoldKey.currentState?.isDrawerOpen ?? false) {
      scaffoldKey.currentState?.openDrawer();
    } else {
      scaffoldKey.currentState?.closeDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    final options = AppOptions.of(context);

    return Scaffold(
      appBar: CustomAppBar(title: context.tr('settings')),
      body: Container(
        padding: AppUtils.kPaddingAll24,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.tr('allSettings'),
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: context.color?.secondaryText,
              ),
            ),
            ListTile(
              dense: true,
              leading: SvgPicture.asset(AppConstants.profileSvg),
              title: Text(
                context.tr('editData'),
                style: TextStyle(color: context.color?.primaryText, fontSize: 15, fontWeight: FontWeight.w500),
              ),
              onTap: () {

              },
            ),
            ListTile(
              dense: true,
              leading: SvgPicture.asset(AppConstants.notificationSvg),
              title: Text(
                context.tr('notification'),
                style: TextStyle(color: context.color?.primaryText, fontSize: 15, fontWeight: FontWeight.w500),
              ),
              onTap: () {},
            ),
            ListTile(
              dense: true,
              leading: SvgPicture.asset(AppConstants.textboxSvg),
              title: Text(
                context.tr('changePassword'),
                style: TextStyle(color: context.color?.primaryText, fontSize: 15, fontWeight: FontWeight.w500),
              ),
              onTap: () {},
            ),
            ListTile(
              dense: true,
              leading: SvgPicture.asset(AppConstants.langSvg),
              title: Text(
                context.tr('changeLanguage'),
                style: TextStyle(color: context.color?.primaryText, fontSize: 15, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                customModalBottomSheet<void>(
                  context: context,
                  builder: (_, controller) => LanguageBottomWidget(
                    onChanged: (lang) async {
                      AppOptions.update(
                        context,
                        options.copyWith(locale: Locale(lang)),
                      );
                      await LocalStorage.instance.setLanguage(lang);
                    },
                  ),
                );
              },
            ),
            ListTile(
              dense: true,
              leading: SvgPicture.asset(AppConstants.themeSvg),
              title: Text(
                context.tr('changeTheme'),
                style: TextStyle(color: context.color?.primaryText, fontSize: 15, fontWeight: FontWeight.w500),
              ),
              onTap: () {},
            ),
            ListTile(
              dense: true,
              leading: SvgPicture.asset(AppConstants.deleteSvg),
              title: Text(
                context.tr('deleteProfile'),
                style: TextStyle(color: context.color?.red, fontSize: 15, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                _deleteProfile();
              },
            ),

          ],
        ),
      ),
    );
  }
  void _deleteProfile() {
    showDialog(
      context: scaffoldKey.currentContext!,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Text(ctx.tr('pleaseConfirm'), style: ctx.textStyle.regularTitle2.copyWith(color: ctx.color?.red)),
          content: Text(ctx.tr('deleteProfileMessage'), style: ctx.textStyle.regularBody.copyWith(color: ctx.color?.primaryText)),
          actions: [
            // The "Yes" button
            TextButton(
              onPressed: () {
                ctx.pop();
              },
              child: Text(ctx.tr('no'),style: ctx.textStyle.regularTitle2.copyWith(color: ctx.theme.primaryColor)),
            ),
            TextButton(
              onPressed: () {
                // LocalStorage.instance.deleteToken();
                // LocalStorage.instance.deletePinCode();
                ctx.pop();
                // ctx.pushReplacement(Routes.signIn);
              },
              child: Text(ctx.tr('yes'),style: ctx.textStyle.regularTitle2.copyWith(color: ctx.color?.red)),
            ),
          ],
        );
      },
    );
  }

}
