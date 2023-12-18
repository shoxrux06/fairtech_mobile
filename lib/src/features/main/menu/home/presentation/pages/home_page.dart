import 'package:fairtech_mobile/src/config/router/app_routes.dart';
import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/core/utils/local_storage.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:fairtech_mobile/src/features/drawer/presentation/custom_drawer.dart';
import 'package:fairtech_mobile/src/features/main/menu/home/presentation/widgets/active_item.dart';
import 'package:fairtech_mobile/src/features/pharm_info/presentation/bloc/pharm_info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  void initState() {
    // TODO: implement initState
    context.read<PharmInfoBloc>().add(GetAppealsListEvent(context: context, status: 'Created'));
    context.read<PharmInfoBloc>().add(UpdateUserTokenEvent(context: context, username: LocalStorage.instance.getUserName()));
    print('bu yerga tushdi 55555');
    super.initState();
  }

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
                      'Interaktiv xizmatlar',
                      style: context.textStyle.regularTitle2.copyWith(
                        color: context.theme.primaryColor,
                      ),
                    ),
                   SizedBox(
                     height: Responsive.height(25, context),
                     width: Responsive.width(100, context),
                     child: Row(
                       mainAxisSize: MainAxisSize.min,
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         ActiveItem(
                           onTap: (){
                             context.push(Routes.mainAppeal);
                           },
                           icon: AppConstants.appealCreateSvg,
                           title: 'Murojaat',
                           subTitle: 'Raqobat qo\'mitasiga murojaat yo\'llash',
                         ),
                         ActiveItem(
                           onTap: (){
                             context.push(Routes.pharmInfo);
                           },
                           icon: AppConstants.appealMonitoringSvg,
                           title: 'Online kuzatuv',
                           subTitle: 'Murojaat holatini kuzatish',
                         ),
                       ],
                     ),
                   ),
                    AppUtils.kGap12,
                    SizedBox(
                      height: Responsive.height(25, context),
                      child: Row(
                        children: [
                          ActiveItem(
                            onTap: () {
                              context.push(Routes.productOrService);
                            },
                            icon: AppConstants.pharmInfoSvg,
                            title: 'Product Info',
                            subTitle: 'Tovar tog\'risidagi ma\'lumot',
                          ),
                          Opacity(
                            opacity: 0,
                            child: ActiveItem(
                              onTap: (){
                                context.push(Routes.pharmInfo);
                              },
                              icon: AppConstants.appealMonitoringSvg,
                              title: 'Online kuzatuv',
                              subTitle: 'Murojaat holatini kuzatish',
                            ),
                          ),
                        ],
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
