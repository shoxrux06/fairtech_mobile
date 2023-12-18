import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/core/utils/local_storage.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:fairtech_mobile/src/features/components/buttons/custom_button_without_gradient.dart';
import 'package:fairtech_mobile/src/features/main/menu/home/presentation/pages/home_page.dart';
import 'package:fairtech_mobile/src/features/main/menu/star/presentaion/pages/star_page.dart';
import 'package:fairtech_mobile/src/features/pdf/data/models/order_item.dart';
import 'package:fairtech_mobile/src/features/pharm_info/presentation/bloc/pharm_info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
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
  bool hasInternet = false;
  int currentIndex = 0;

  late List<Widget> pages = [
    const HomePage(),
    StarPage(
      orderItem: widget.orderItem,
    )
  ];

  connectionCheck() async{
    hasInternet = await InternetConnectionChecker().hasConnection;
    if (hasInternet) {
      context.read<PharmInfoBloc>().add(GetAppealsListEvent(context: context, status: 'Created'));
      context.read<PharmInfoBloc>().add(GetProfileDataPharmEvent(context: context));
    } else {
      Future.delayed(
        Duration.zero,
            () {
          showDialog(
            barrierDismissible: hasInternet,
            barrierColor: Colors.grey.withOpacity(0.9),
            context: context,
            builder: (_) => WillPopScope(
              onWillPop: () async => hasInternet,
              child: AlertDialog(
                title: Image.asset(
                  AppConstants.noInternet,
                  color: Colors.grey,
                  width: Responsive.width(40, context),
                  height: Responsive.height(25, context),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Internet bilan aloqa yo\'q',  style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText),
                    ),
                    AppUtils.kGap12,
                    CustomButtonWithoutGradient(onTap: ()async{
                      hasInternet = await InternetConnectionChecker().hasConnection;
                      if(hasInternet){
                        context.read<PharmInfoBloc>().add(GetAppealsListEvent(context: context, status: 'Created'));
                        context.read<PharmInfoBloc>().add(GetProfileDataPharmEvent(context: context));
                        context.pop();
                      }
                    }, text: 'Qayta urinish',textColor: Colors.white,)
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }
  @override
  void initState() {
    print('bu yerga tushdi main page 55555');

    connectionCheck();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
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
                icon: SvgPicture.asset(AppConstants.homeSvg,
                    width: 24,
                    height: 24,
                    color: currentIndex == 0
                        ? context.theme.primaryColor
                        : Colors.black.withOpacity(0.5)),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppConstants.journalSvg,
                    width: 24,
                    height: 24,
                    color: currentIndex == 1
                        ? context.theme.primaryColor
                        : Colors.black.withOpacity(0.5)),
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
