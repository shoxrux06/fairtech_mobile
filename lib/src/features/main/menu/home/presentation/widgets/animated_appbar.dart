import 'package:fairtech_mobile/src/config/router/app_routes.dart';
import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/utils/local_storage.dart';

class AnimatedAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  final GlobalKey<ScaffoldState> scKey;

  AnimatedAppBar({required this.expandedHeight, required this.scKey});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          alignment: Alignment.topLeft,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFF2A675B),
                Color(0xFF168070),
                Color(0xFF029783),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 32),
            child: SvgPicture.asset(AppConstants.moreSvg)
          ),
        ),
        Positioned(
          top: 40,
          right: 12,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocalStorage.instance.getFullNameName().isNotEmpty
                          ? LocalStorage.instance.getFullNameName()
                          : 'Quroqov Shoxrux',
                      style:
                          context.textStyle.largeTitle1.copyWith(fontSize: 12),
                    ),
                    Text(
                      'ID 1234567',
                      style: context.textStyle.regularTitle1.copyWith(
                          color: Color(0xFF95969D),
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    )
                  ],
                ),
                AppUtils.kGap8,
                Image.asset(
                  AppConstants.profileImg,
                  width: 44,
                  height: 44,
                ),
                AppUtils.kGap4,
              ],
            ),
          ),
        ),
        Center(
          child: Opacity(
            opacity: shrinkOffset / expandedHeight,
            child: const Padding(
              padding: EdgeInsets.only(top: 22),
              child: Text(
                'Fair tech',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 23,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight / 2 - shrinkOffset,
          left: 20,
          right: 20,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Fair Tech',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 100,
                  width: Responsive.width(90, context),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 12,
                          spreadRadius: 1,
                        )
                      ]),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Murojaatlar',
                              style: context.textStyle.largeTitle2
                                  .copyWith(color: context.theme.primaryColor),
                            ),
                            AppUtils.kGap4,
                            Text(
                              '15',
                              style: context.textStyle.largeTitle1
                                  .copyWith(color: context.theme.primaryColor),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Ijobiy',
                              style: context.textStyle.largeTitle2
                                  .copyWith(color: context.theme.primaryColor),
                            ),
                            AppUtils.kGap4,
                            Text(
                              '21',
                              style: context.textStyle.largeTitle1
                                  .copyWith(color: Colors.green),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Jarayonda',
                              style: context.textStyle.largeTitle2
                                  .copyWith(color: context.theme.primaryColor),
                            ),
                            AppUtils.kGap4,
                            Text(
                              '3',
                              style: context.textStyle.largeTitle1
                                  .copyWith(color: Colors.deepOrange),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 16;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
