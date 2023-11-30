import 'package:fairtech_mobile/src/config/router/app_routes.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/features/components/bottom_sheet/custom_bottom_sheet.dart';
import 'package:fairtech_mobile/src/features/components/snackbar/app_snackbar.dart';
import 'package:fairtech_mobile/src/features/main/presentation/widgets/choose_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  final List<String> items = ['Product Info', 'Pharm Info', 'Fair Price', 'Fair Packaging', 'Fair Monitoring', 'Fair Tender'];

  bool isScanCompleted = false;

  void closeScreen() {
    isScanCompleted = false;
  }
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(12),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // number of items in each row
            mainAxisSpacing: 8.0, // spacing between rows
            crossAxisSpacing: 8.0, // spacing between columns
          ),
          padding: const EdgeInsets.all(8.0), // padding around the grid
          itemCount: items.length, // total number of items
          itemBuilder: (context, index) {
            switch(index){
              case 0 || 1 :
                return GestureDetector(
                  onTap: (){
                    if(items[index] == 'Product Info'){
                      customModalBottomSheet<void>(
                          context: context,
                          builder: (context, controller) => const ChooseOptionWidget()
                      );
                    }
                    if(items[index] == 'Pharm Info'){
                      context.push(Routes.pharmInfo);
                    }
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Card(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: selectedIndex == index?  context.theme.primaryColor: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: context.theme.primaryColor, // color of grid items,
                              width: 1
                          )
                      ),
                      child: Center(
                        child: Text(
                          items[index],
                          textAlign: TextAlign.center,
                          style: context.textStyle.regularTitle2.copyWith(color: selectedIndex == index? Colors.white: context.theme.primaryColor),
                        ),
                      ),
                    ),
                  ),
                );
              case 2 || 3 || 4 || 5:
                return GestureDetector(
                  onTap: (){
                    AppSnackBar.customMessage(context,'Soon', 'This feature will be soon');
                  },
                  child: Card(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          items[index],
                          style: context.textStyle.regularTitle2.copyWith(color:Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
