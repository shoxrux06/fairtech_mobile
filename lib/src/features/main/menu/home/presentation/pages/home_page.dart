import 'package:fairtech_mobile/src/config/router/app_routes.dart';
import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/core/utils/local_storage.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:fairtech_mobile/src/features/drawer/presentation/custom_drawer.dart';
import 'package:fairtech_mobile/src/features/drawer/presentation/custom_drawer_guest.dart';
import 'package:fairtech_mobile/src/features/main/menu/home/presentation/widgets/active_item.dart';
import 'package:fairtech_mobile/src/features/main/menu/home/presentation/widgets/custom_sliver_delegate_guest.dart';
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
    if(!LocalStorage.instance.isGuest()){
      context.read<PharmInfoBloc>().add(UpdateUserTokenEvent(context: context, username: LocalStorage.instance.getUserName()));
      context.read<PharmInfoBloc>().add(GetAppealsCountEvent(context: context));
      context.read<PharmInfoBloc>().add(GetAppealsListEvent(context: context, status: 'Created'));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: BlocBuilder<PharmInfoBloc,PharmInfoState>(
        builder: (context, state){
          return Scaffold(
            drawer: LocalStorage.instance.isGuest()?const CustomDrawerGuest(): const CustomDrawer(),
            body: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                    pinned: true,
                    floating: false,
                    delegate: LocalStorage.instance.isGuest() ? CustomSliverDelegateGuest(expandedHeight: 100):CustomSliverDelegate(
                        expandedHeight: 160
                    )
                ),
                SliverFillRemaining(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 12,
                        right: 12,
                        bottom: 12,
                        top: 12
                    ),
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
                          AppUtils.kGap12,
                          SizedBox(
                            height: Responsive.height(20, context),
                            width: Responsive.width(100, context),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                  onTap: () {
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
                            height: Responsive.height(20, context),
                            width: Responsive.width(100, context),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ActiveItem(
                                  onTap: () {
                                    context.push(Routes.productOrService);
                                  },
                                  icon: AppConstants.pharmInfoSvg,
                                  title: 'Product Info',
                                  subTitle: 'Tovar tog\'risidagi ma\'lumot',
                                ),
                                state.isAccessToFairPrice?Opacity(
                                  opacity: LocalStorage.instance.isGuest()? 0 : 1,
                                  child: ActiveItem(
                                    onTap: () {
                                      if(!LocalStorage.instance.isGuest() && state.fairPriceAccessRoleName == 'price-market'){
                                        context.push(Routes.fairPrice);
                                      }else if(!LocalStorage.instance.isGuest() && state.fairPriceAccessRoleName == 'price-hypermarket'){
                                        context.push(Routes.fairPriceProductList, extra: {'marketId': 0, 'isMarketEmployee': true});
                                      }
                                    },
                                    icon: AppConstants.fairPriceSvg,
                                    title: 'Fair Price',
                                    subTitle: 'Tovarlarning narxi',
                                  ),
                                ): Container(
                                  height: Responsive.height(25, context),
                                  width: Responsive.width(40, context),
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
        },
      )
    );
  }
}
