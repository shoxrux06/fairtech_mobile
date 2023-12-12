import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/features/drawer/presentation/custom_drawer.dart';
import 'package:fairtech_mobile/src/features/main/menu/home/presentation/pages/home_page.dart';
import 'package:fairtech_mobile/src/features/main/menu/profile/presentation/pages/presentation.dart';
import 'package:fairtech_mobile/src/features/main/menu/star/presentaion/pages/star_page.dart';
import 'package:fairtech_mobile/src/features/main/presentation/bloc/main/main_bloc.dart';
import 'package:fairtech_mobile/src/features/main/presentation/widgets/custom_bottom_bar.dart';
import 'package:fairtech_mobile/src/features/pdf/data/models/order_item.dart';
import 'package:fairtech_mobile/src/features/pharm_info/presentation/bloc/pharm_info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../config/router/app_routes.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
    this.orderItem,
  });

  final OrderItem? orderItem;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  late List<Widget> pages = [
    const HomePage(),
    StarPage(
      orderItem: widget.orderItem,
    )
  ];
  
  @override
  void initState() {
    // TODO: implement initState
    context.read<PharmInfoBloc>().add(GetAppealsCountEvent());
    context.read<PharmInfoBloc>().add(GetProfileDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      WillPopScope(
        onWillPop: () async {
          if (currentIndex != 0) {
            setState(() {
              currentIndex = 0;
            });
            return false;
          }
          return true;
        },
        child: Scaffold(
          key: scaffoldKey,
          drawerEnableOpenDragGesture: false,
          body: pages[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                    AppConstants.homeSvg,
                    width: 24,
                    height: 24,
                    color: currentIndex == 0
                        ? context.theme.primaryColor
                        : Colors.black.withOpacity(0.5)
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                    AppConstants.journalSvg,
                    width: 24,
                    height: 24,
                    color: currentIndex == 1
                        ? context.theme.primaryColor
                        : Colors.black.withOpacity(0.5)
                ),
                label: '',
              ),
            ],
            selectedItemColor: context.theme.primaryColor,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
          ),
        ),
      );
}
