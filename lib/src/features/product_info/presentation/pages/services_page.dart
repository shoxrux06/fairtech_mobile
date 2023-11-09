import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/features/components/bottom_sheet/custom_bottom_sheet.dart';
import 'package:fairtech_mobile/src/features/components/snackbar/app_snackbar.dart';
import 'package:fairtech_mobile/src/features/main/presentation/widgets/choose_option_widget.dart';
import 'package:flutter/material.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  final List<String> items = ['Product Info', 'Pharm Info', 'Fair Price', 'Fair Packaging', 'Fair Monitoring', 'Fair Tender'];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(12),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // number of items in each row
            mainAxisSpacing: 8.0, // spacing between rows
            crossAxisSpacing: 8.0, // spacing between columns
          ),
          padding: const EdgeInsets.all(8.0), // padding around the grid
          itemCount: items.length, // total number of items
          itemBuilder: (context, index) {
            switch(index){
              case 0 || 1 :
                return InkWell(
                  onTap: (){
                    if(items[index] == 'Product Info'){
                      customModalBottomSheet<void>(
                          context: context,
                          builder: (context, controller) => const ChooseOptionWidget()
                      );
                    }
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
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
                        style: context.textStyle.regularTitle2.copyWith(color: selectedIndex == index? Colors.white: context.theme.primaryColor),
                      ),
                    ),
                  ),
                );
              case 2 || 3 || 4 || 5:
                return InkWell(
                  onTap: (){
                    AppSnackBar.customMessage(context,'Soon', 'This feature will be soon');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color:Colors.grey,
                            width: 1
                        )
                    ),
                    child: Center(
                      child: Text(
                        items[index],
                        style: context.textStyle.regularTitle2.copyWith(color:Colors.grey),
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
