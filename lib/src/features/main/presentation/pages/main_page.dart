import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/features/components/bottom_sheet/custom_bottom_sheet.dart';
import 'package:fairtech_mobile/src/features/drawer/presentation/custom_drawer.dart';
import 'package:fairtech_mobile/src/features/drawer/widgets/language_bottom_widget.dart';
import 'package:fairtech_mobile/src/features/main/menu/home/presentation/pages/home_page.dart';
import 'package:fairtech_mobile/src/features/main/menu/profile/presentation/pages/presentation.dart';
import 'package:fairtech_mobile/src/features/main/presentation/bloc/main/main_bloc.dart';
import 'package:fairtech_mobile/src/features/main/presentation/widgets/choose_option_widget.dart';
import 'package:fairtech_mobile/src/features/main/presentation/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/router/app_routes.dart';
import '../../menu/services/presentation/pages/services_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) =>
      BlocSelector<MainBloc, MainState, BottomMenu>(
        selector: (state) => state.bottomMenu,
        builder: (_, bottomMenu) => WillPopScope(
          onWillPop: () async {
            if (bottomMenu.index != 0) {
              context
                  .read<MainBloc>()
                  .add(MainEventChanged(BottomMenu.values[0]));
              return false;
            }
            return true;
          },
          child: Scaffold(
            key: scaffoldKey,
            drawerEnableOpenDragGesture: false,
            // Prevent user sliding open
            drawer: const CustomDrawer(),
            appBar: AppBar(
              leading: Builder(
                builder: (ctx) => // Ensure Scaffold is in context
                IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  onPressed: () => Scaffold.of(ctx).openDrawer(),),
              ),
              centerTitle: true,
            ),
            body: IndexedStack(
              index: bottomMenu.index,
              children: [
                HomePage(),
                Scaffold(
                  body: Container(child: Center(child: Text('Second page')),),
                ),
                ServicesPage(),
                ProfilePage(),
                Scaffold(
                  body: Container(child: Center(child: Text('More page')),),
                ),
              ],
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
            floatingActionButton: Padding(
              padding: const EdgeInsets.all(4.0),
              child: FloatingActionButton(
                  onPressed: () {
                    context.read<MainBloc>().add(MainEventChanged(BottomMenu.values[2]));
                  },
                  tooltip: 'Increment',
                  elevation: 2.0,
                  child: SvgPicture.asset(AppConstants.scannerSvg)
              ),
            ),
            bottomNavigationBar: CustomBottomBar(
              currentIndex: bottomMenu.index,
              onTap: (index) {
                context.read<MainBloc>().add(MainEventChanged(BottomMenu.values[index]));
              },
              onScanTap: () {},
            ),
          ),
        ),
      );
}
