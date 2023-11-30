import 'package:fairtech_mobile/src/config/router/app_routes.dart';
import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:fairtech_mobile/src/features/drawer/presentation/custom_drawer.dart';
import 'package:fairtech_mobile/src/features/main/menu/home/presentation/widgets/active_item.dart';
import 'package:fairtech_mobile/src/features/main/menu/home/presentation/widgets/animated_appbar.dart';
import 'package:fairtech_mobile/src/features/main/menu/home/presentation/widgets/disabled_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/custom_sliver_deligate.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.password});
  final String? password;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            floating: false,
            delegate:CustomSliverDelegate(
              expandedHeight: 160
            )
          ),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sohalar',
                      style: context.textStyle.regularTitle2.copyWith(
                        color: context.theme.primaryColor,
                      ),
                    ),
                   SizedBox(
                     height: Responsive.height(25, context),
                     child: SingleChildScrollView(
                       scrollDirection: Axis.horizontal,
                       child: Row(
                         children: [
                           ActiveItem(
                             onTap: () {
                               context.push(Routes.chooseOption);
                             },
                             icon: AppConstants.pharmInfoSvg,
                             title: 'Product Info',
                             subTitle: 'Tovar tog\'risidagi ma\'lumot',
                           ),
                           ActiveItem(
                             onTap: () {
                               // context.push(Routes.pharmInfo);
                             },
                             icon: AppConstants.pharmInfoSvg,
                             title: 'Pharm Info',
                             subTitle: 'Dori vositalari tog\'risidagi ma\'lumot',
                           ),
                           DisabledItem(
                             icon: AppConstants.fairPriceSvg,
                             title: 'Product Info',
                             subTitle: 'Mahsulotlarning adolatli narxi',
                           )
                         ],
                       ),
                     ),
                   ),
                    AppUtils.kGap12,
                    Text(
                      'Interaktiv xizmatlar',
                      style: context.textStyle.regularTitle2.copyWith(
                        color: context.theme.primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: Responsive.height(25, context),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ActiveItem(
                              onTap: (){
                                context.push(Routes.pharmInfo);
                              },
                              icon: AppConstants.appealMonitoringSvg,
                              title: 'Online kuzatuv',
                              subTitle: 'Murojaat holatini kuzatish',
                            ),
                            const ActiveItem(
                              icon: AppConstants.appealCreateSvg,
                              title: 'Murojaat',
                              subTitle: 'Raqobat qo\'mitasiga murojaat yo\'llash',
                            ),
                            const DisabledItem(
                              icon: AppConstants.appealCreateSvg,
                              title: 'Kompleyns',
                              subTitle: 'Qo\'zg\'atilgan ishlarni kuzatish',
                            )
                          ],
                        ),
                      ),
                    ),
                    AppUtils.kGap12,
                    Text(
                      'Raqobat qo\'mitasi',
                      style: context.textStyle.regularTitle2.copyWith(
                        color: context.theme.primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: Responsive.height(25, context),
                      child: const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ActiveItem(
                              icon: AppConstants.appealCreateSvg,
                              title: 'Hisobotlar',
                              subTitle: 'Bajarilgan ishlar statistikasi',
                            ),
                            // Opacity(
                            //   opacity: 0,
                            //   child: ActiveItem(
                            //     icon: '',
                            //     title: 'Murojaat',
                            //     subTitle: 'Raqobat qo\'mitasiga murojaat yo\'llash',
                            //   ),
                            // ),
                            // Opacity(
                            //   opacity: 0,
                            //   child: DisabledItem(
                            //     icon: '',
                            //     title: 'Kompleyns',
                            //     subTitle: 'Qo\'zg\'atilgan ishlarni kuzatish',
                            //   ),
                            // )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(bottom: 24))
        ],
      ),
    );
  }
}
