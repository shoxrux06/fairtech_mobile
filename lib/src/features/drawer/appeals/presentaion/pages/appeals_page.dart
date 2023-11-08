import 'package:fairtech_mobile/src/config/router/app_routes.dart';
import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/features/components/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AppealsPage extends StatefulWidget {
  const AppealsPage({super.key});

  @override
  State<AppealsPage> createState() => _AppealsPageState();
}

class _AppealsPageState extends State<AppealsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.tr('appeals')),
      body: Container(
        padding: AppUtils.kPaddingAll24,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.tr('myAppeals'),
              style: context.textStyle.regularTitle2,
            ),
            ListTile(
              dense: true,
              leading: SvgPicture.asset(AppConstants.profileSvg),
              title: Text(
                context.tr('createAppeals'),
                style: context.textStyle.regularTitle1,
              ),
              onTap: () {
                context.push(Routes.createAppeals);
              },
            ),
            ListTile(
              dense: true,
              leading: SvgPicture.asset(AppConstants.notificationSvg),
              title: Text(
                context.tr('submittedAppeals'),
                style: context.textStyle.regularTitle1,
              ),
              onTap: () {},
            ),
            ListTile(
              dense: true,
              leading: SvgPicture.asset(AppConstants.textboxSvg),
              title: Text(
                context.tr('drafts'),
                style: context.textStyle.regularTitle1,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
