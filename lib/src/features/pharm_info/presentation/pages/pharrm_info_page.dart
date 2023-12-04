import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/features/components/dropdown/custom_dropdown_form_filed.dart';
import 'package:fairtech_mobile/src/features/pharm_info/presentation/bloc/pharm_info_bloc.dart';
import 'package:fairtech_mobile/src/features/pharm_info/presentation/widgets/all_appeals_widget.dart';
import 'package:fairtech_mobile/src/features/pharm_info/presentation/widgets/completed_appeals_widget.dart';
import 'package:fairtech_mobile/src/features/pharm_info/presentation/widgets/drawer_filter.dart';
import 'package:fairtech_mobile/src/features/pharm_info/presentation/widgets/in_the_execution_process_appleas_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PharmInfoPage extends StatefulWidget {
  const PharmInfoPage({super.key});

  @override
  State<PharmInfoPage> createState() => _PharmInfoPageState();
}

enum SearchStatus { PROCCESS, FINISHED, ALL }

class _PharmInfoPageState extends State<PharmInfoPage> with SingleTickerProviderStateMixin {
  final controller = PageController(initialPage: 0);
  final ScrollController _scrollController = ScrollController();

  int _selectedIndex = 0;

  String? dropdownValue;

  final list = [
    'Ijro jarayonida',
    'Yakunlangan',
    'Barchasi'
  ];

  @override
  void initState() {
    controller.addListener(() {
      int newPage = controller.page!.round();
      if (newPage != _selectedIndex) {
        setState(() {
          _selectedIndex = newPage;
          _scrollController.animateTo(
            _selectedIndex * 250, // Adjust based on your item size
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        });
      }
    });
    dropdownValue = list.first;
    context.read<PharmInfoBloc>().add(GetPharmInfoEvent(
        context: context,
        onSuccess: () {
          print('Success');
        },
        onError: () {
          print('Error');
        },
        keyword: '',
        status: SearchStatus.PROCCESS.name,
        itemsPerPage: 20,
        page: 0
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text('Monitoring'),
          // actions: [
          // Builder(
          //   builder: (ctx) => IconButton(
          //     icon: const Icon(
          //       Icons.filter_alt_rounded,
          //       color: Colors.black,
          //     ),
          //     onPressed: () => Scaffold.of(ctx).openEndDrawer(),
          //   ),
          // ),
          // ],
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              CustomDropDownFormField(
                value: dropdownValue,
                hintText: 'Murojaat holatini tanlang',
                items: list,
                onChanged: (val) {
                  int index = 0;
                  if(val == 'Ijro jarayonida'){
                    index = 0;
                  }else if(val == 'Yakunlangan'){
                    index = 1;
                  }else if(val == 'Barchasi'){
                    index = 2;
                  }
                  sendRequest(index);
                },
              ),
              AppUtils.kGap24,
              Expanded(child: AllAppealsWidget())
            ],
          ),
        ));
    // endDrawer: const DrawerFilter(),
    // body: Stack(
    //   children: [
    //     PageView.builder(
    //         controller: controller,
    //         onPageChanged: (index) {
    //           sendRequest(index);
    //           setState(() {
    //             _selectedIndex = index;
    //           });
    //         },
    //         itemCount: list.length,
    //         itemBuilder: (context, index) {
    //           switch (index) {
    //             case 0:
    //               return InTheExecutionProcessAppealsWidget(index: index);
    //             case 1:
    //               return CompletedAppealsWidget(index: index);
    //             case 2:
    //               return AllAppealsWidget(index: index);
    //             default:
    //               return Container();
    //           }
    //         }),
    //     Positioned(
    //       top: 10,
    //       left: 10,
    //       right: 10,
    //       child: SizedBox(
    //         height: 54,
    //         child: ListView(
    //           controller:_scrollController,
    //           scrollDirection: Axis.horizontal,
    //           children: [..._buildIndicator()],
    //         ),
    //       ),
    //     ),
    //   ],
    // ));
  }

  //Indicator Builder
  List<Widget> _buildIndicator() {
    final indicators = <Widget>[];
    for (var i = 0; i < list.length; i++) {
      if (_selectedIndex == i) {
        indicators.add(_indicatorsTrue(list[i]));
      } else {
        indicators.add(_indicatorsFalse(list[i], i));
      }
    }
    return indicators;
  }

  void sendRequest(int index) {
    if (index == 0) {
      context.read<PharmInfoBloc>().add(GetPharmInfoEvent(
          context: context,
          onSuccess: () {
            print('Success');
          },
          onError: () {
            print('Error');
          },
          keyword: '',
          status: SearchStatus.PROCCESS.name,
          itemsPerPage: 20,
          page: 0));
    }
    else if (index == 1) {
      context.read<PharmInfoBloc>().add(GetPharmInfoEvent(
          context: context,
          onSuccess: () {
            print('Success');
          },
          onError: () {
            print('Error');
          },
          keyword: '',
          status: SearchStatus.FINISHED.name,
          itemsPerPage: 20,
          page: 0));
    }
    else if (index == 2) {
      context.read<PharmInfoBloc>().add(GetPharmInfoEvent(
          context: context,
          onSuccess: () {
            print('Success');
          },
          onError: () {
            print('Error');
          },
          keyword: '',
          status: SearchStatus.ALL.name,
          itemsPerPage: 20,
          page: 0));
    }
  }

  Widget _indicatorsTrue(String text) {
    final Color color;
    if (_selectedIndex == 0) {
      color = context.theme.primaryColor;
    } else if (_selectedIndex == 1) {
      color = context.theme.primaryColor;
    } else {
      color = context.theme.primaryColor;
    }

    //Active Indicator
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      margin: const EdgeInsets.only(right: 8),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),
      child: Center(
        child: Text(
          text,
          style: context.textStyle.regularTitle2.copyWith(color: Colors.white),
        ),
      ),
    );
  }

//Inactive Indicator
  Widget _indicatorsFalse(String text, int index) {
    return InkWell(
      onTap: () {
        sendRequest(index);
        controller.animateToPage(index,
            duration: Duration(milliseconds: 300), curve: Curves.linear);
      },
      child: AnimatedContainer(
        duration: const Duration(microseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade100,
        ),
        child: Center(
          child: Text(
            text,
            style:
                context.textStyle.regularTitle2.copyWith(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
