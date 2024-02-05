import 'dart:convert';

import 'package:fairtech_mobile/src/config/router/app_routes.dart';
import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/core/utils/local_storage.dart';
import 'package:fairtech_mobile/src/features/pharm_info/presentation/bloc/pharm_info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/responsive.dart';
import 'dart:io' show Platform;


class CustomSliverDelegateGuest extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;

  CustomSliverDelegateGuest({
    required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = expandedHeight - shrinkOffset;
    final cardTopPosition = expandedHeight / 1.2 - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;

    return BlocBuilder<PharmInfoBloc, PharmInfoState>(builder: (context,state){
      return SizedBox(
        height: expandedHeight + expandedHeight / 2,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomRight:appBarSize < kToolbarHeight? const Radius.circular(0):const Radius.circular(20),
                bottomLeft: appBarSize < kToolbarHeight? const Radius.circular(0):const Radius.circular(20),
              ),
              child: SizedBox(
                height: appBarSize < kToolbarHeight ? kToolbarHeight + 50 : appBarSize + 50,
                child: AppBar(
                  backgroundColor: context.theme.primaryColor,
                  leading: Builder(
                      builder: (contextBuilder) {
                        return IconButton(
                          icon: SvgPicture.asset(AppConstants.moreSvg,width: 32, height: 32,),
                          onPressed: () {
                            Scaffold.of(contextBuilder).openDrawer();
                          },
                        );
                      }
                  ),
                  elevation: 0.0,
                  title: Opacity(
                      opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
                      child: Text("Fair tech",style: context.textStyle.largeTitle1.copyWith(color: Colors.white, fontSize: 18))
                  ),
                ),
              ),
            ),
            AppUtils.kGap24,
            Positioned(
              left: 20.0,
              right: 0.0,
              top: cardTopPosition > 0 ? cardTopPosition - 14 : 0,
              bottom: 30.0,
              child: Opacity(
                opacity:percent,
                child: Padding(
                  padding: const EdgeInsets.only(top: 22),
                  child: Text(
                      'Fair tech',
                      style: context.textStyle.largeTitle1.copyWith(color: Colors.white)
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  @override
  double get maxExtent => expandedHeight + expandedHeight / 2;

  @override
  double get minExtent => Platform.isAndroid? kToolbarHeight + 35: kToolbarHeight + 50;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}