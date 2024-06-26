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


class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;

  CustomSliverDelegate({
    required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = expandedHeight - shrinkOffset;
    final cardTopPosition = expandedHeight / 1.2 - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    String image = LocalStorage.instance.getUserImageUrl();
    final memImage = const Base64Decoder().convert(image);

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
              child: GestureDetector(
                onTap: (){
                  print('***Tapped***');
                },
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
                    actions: [
                      Container(
                        padding: const EdgeInsets.only(top: 4, bottom: 4, right: 0, left: 12),
                        margin: const EdgeInsets.only(top: 4, bottom: 4, right: 0, left: 12),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(44),
                              bottomRight: Radius.circular(44),
                              bottomLeft: Radius.circular(24),
                            ),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 12,
                                spreadRadius: 1,
                              )
                            ]),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center ,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  LocalStorage.instance.getFullNameName().isNotEmpty
                                      ? LocalStorage.instance.getFullNameName()
                                      : '---',
                                  style:
                                  context.textStyle.largeTitle1.copyWith(fontSize: 10, color: context.theme.primaryColor),
                                ),
                                Text(
                                  'ID ${LocalStorage.instance.getUserId()}',
                                  style: context.textStyle.regularTitle1.copyWith(
                                      color: context.theme.primaryColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                                )
                              ],
                            ),
                            AppUtils.kGap8,
                            ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: (LocalStorage.instance.getUserImageUrl().isEmpty)? Image.asset(
                                AppConstants.userPng,
                                width: 40,
                                height: 40,
                                fit: BoxFit.fill,
                              ): image.isNotEmpty?Image.memory(
                                memImage,
                                width: 40,
                                height: 40,
                                fit: BoxFit.fill,
                              ): Image.asset(
                                AppConstants.userPng,
                                width: 40,
                                height: 40,
                                fit: BoxFit.fill,
                              ),
                            ),
                            AppUtils.kGap4,
                          ],
                        ),
                      ),
                      const SizedBox(width: 12,)
                    ],
                    title: Opacity(
                        opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
                        child: Text("Fair tech",style: context.textStyle.largeTitle1.copyWith(color: Colors.white, fontSize: 18))
                    ),
                  ),
                ),
              ),
            ),
            AppUtils.kGap24,
            appBarSize < kToolbarHeight? Container(): Positioned(
              left: 20.0,
              right: 0.0,
              top: cardTopPosition > 0 ? cardTopPosition - 34 : 0,
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
            Positioned(
              left: 0.0,
              right: 0.0,
              top: cardTopPosition > 0 ? cardTopPosition + (Platform.isAndroid? 22: 20) : 0,
              bottom: 0.0,
              child: Opacity(
                opacity: percent,
                child: GestureDetector(
                  onTap: (){
                    print('*** Tapped Container ****');
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20 * percent),
                    child: Container(
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
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (){
                                context.push(Routes.allAppeals);
                              },
                              child: Column(
                                children: [
                                  Text(
                                    'Murojaatlar',
                                    style: context.textStyle.largeTitle2.copyWith(color: context.theme.primaryColor),
                                  ),
                                  AppUtils.kGap4,
                                  Text(
                                    '${state.productAppealCountResponse?.created ?? '0'}',
                                    style: context.textStyle.largeTitle1.copyWith(color: context.theme.primaryColor),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                context.push(Routes.inProcessAppeals);
                              },
                              child: Column(
                                children: [
                                  Text(
                                    'Jarayonda',
                                    style: context.textStyle.largeTitle2.copyWith(color: context.theme.primaryColor),
                                  ),
                                  AppUtils.kGap4,
                                  Text(
                                    '0',
                                    style: context.textStyle.largeTitle1.copyWith(color: Colors.deepOrange),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                context.push(Routes.completedAppeals);
                              },
                              child: Column(
                                children: [
                                  Text(
                                    'Ijobiy',
                                    style: context.textStyle.largeTitle2
                                        .copyWith(color: context.theme.primaryColor),
                                  ),
                                  AppUtils.kGap4,
                                  Text(
                                    '0',
                                    style: context.textStyle.largeTitle1
                                        .copyWith(color: Colors.green),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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