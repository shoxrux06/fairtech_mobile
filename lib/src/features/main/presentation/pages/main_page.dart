import 'package:fairtech_mobile/src/features/drawer/presentation/custom_drawer.dart';
import 'package:fairtech_mobile/src/features/main/menu/home/presentation/pages/home_page.dart';
import 'package:fairtech_mobile/src/features/main/menu/profile/presentation/pages/presentation.dart';
import 'package:fairtech_mobile/src/features/main/menu/star/presentaion/pages/star_page.dart';
import 'package:fairtech_mobile/src/features/main/presentation/bloc/main/main_bloc.dart';
import 'package:fairtech_mobile/src/features/main/presentation/widgets/custom_bottom_bar.dart';
import 'package:fairtech_mobile/src/features/pdf/data/models/order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/router/app_routes.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key, this.orderItem,
  });


  final OrderItem? orderItem;
  @override
  Widget build(BuildContext context) =>
      BlocSelector<MainBloc, MainState, BottomMenu>(
        selector: (state) => state.bottomMenu,
        builder: (_, bottomMenu) => WillPopScope(
          onWillPop: () async {
            if (bottomMenu.index != 0) {
              context.read<MainBloc>().add(MainEventChanged(BottomMenu.values[0]));
              return false;
            }
            return true;
          },
          child: Scaffold(
            key: scaffoldKey,
            drawerEnableOpenDragGesture: false,
            drawer: const CustomDrawer(),
            // appBar: AppBar(
            //   leading: Builder(
            //     builder: (ctx) => // Ensure Scaffold is in context
            //     IconButton(
            //       icon: const Icon(
            //         Icons.menu,
            //         color: Colors.black,
            //       ),
            //       onPressed: () => Scaffold.of(ctx).openDrawer(),),
            //   ),
            //   centerTitle: true,
            //   actions: [
            //     bottomMenu.index == 2? Builder(
            //       builder: (builderContext) {
            //         return IconButton(onPressed: (){
            //           List<String> items  = [];
            //           LocalData.orderItems.forEach((element) {
            //             items.add(element.hududlar);
            //           });
            //           customModalBottomSheet(
            //             context: context,
            //             builder: (_, controller) =>
            //                 BlocProvider.value(
            //                   value: builderContext.read<StarBloc>(),
            //                   child: BottomFilterRegion(
            //                     items: items,
            //                     checkboxValue1: true,
            //                     checkboxValue2: true,
            //                     checkboxValue3: true,
            //                   ),
            //                 ),
            //           );
            //         }, icon: const Icon(Icons.filter_alt_rounded));
            //       }
            //     ): Container(),
            //     bottomMenu.index == 0? IconButton(onPressed: (){}, icon: const Icon(Icons.notifications)): Container()
            //   ],
            // ),
            body: IndexedStack(
              index: bottomMenu.index,
              children: [
                const HomePage(),
                const ProfilePage(),
                StarPage(orderItem: orderItem,)
              ],
            ),
            // floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
            // floatingActionButton: Padding(
            //   padding: const EdgeInsets.all(4.0),
            //   child: FloatingActionButton(
            //       onPressed: () {
            //         context.read<MainBloc>().add(MainEventChanged(BottomMenu.values[2]));
            //       },
            //       tooltip: 'Increment',
            //       elevation: 2.0,
            //       child: Image.asset(AppConstants.logoPng, color: Colors.white,)
            //   ),
            // ),
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
