import 'package:fairtech_mobile/src/core/utils/local_storage.dart';
import 'package:flutter/material.dart';

import '../../../../../components/bottom_sheet/custom_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.password});

  final String? password;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    final pinCode = LocalStorage.instance.getPinCode();
    print('Local Pincode => $pinCode ');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                    onTap: (){
                      customModalBottomSheet<void>(
                        context: context,
                        builder: (_, controller) => Container(
                          child: const Column(
                            children: [
                              Text('Dastur haqida')
                            ],
                          ),
                        ),
                      );
                    },
                    child: const Text('Home Page')
                ),
                Text(LocalStorage.instance.getFullNameName().toString()),
                Text(LocalStorage.instance.getUserPhone().toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
