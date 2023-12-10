import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/features/components/dropdown/custom_dropdown_form_filed.dart';
import 'package:fairtech_mobile/src/features/pharm_info/presentation/bloc/pharm_info_bloc.dart';
import 'package:fairtech_mobile/src/features/pharm_info/presentation/widgets/all_appeals_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PharmInfoPage extends StatefulWidget {
  const PharmInfoPage({super.key});

  @override
  State<PharmInfoPage> createState() => _PharmInfoPageState();
}

enum SearchStatus { PROCCESS, FINISHED, ALL }

class _PharmInfoPageState extends State<PharmInfoPage>
    with SingleTickerProviderStateMixin {
  final controller = PageController(initialPage: 0);
  final ScrollController _scrollController = ScrollController();

  int _selectedIndex = 0;

  String? dropdownValue;

  final list = ['Ijro jarayonida', 'Yakunlangan', 'Barchasi'];

  @override
  void initState() {
    controller.addListener(() {
      int newPage = controller.page!.round();
      if (newPage != _selectedIndex) {
        setState(() {
          _selectedIndex = newPage;
          _scrollController.animateTo(
            _selectedIndex * 250,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        });
      }
    });
    dropdownValue = list.first;
    context.read<PharmInfoBloc>().add(GetPharmInfoEvent(
        context: context,
        onSuccess: () {},
        onError: () {},
        keyword: '',
        status: SearchStatus.PROCCESS.name,
        itemsPerPage: 20,
        page: 0));
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
        title: const Text('Online kuzatuv'),
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
                if (val == 'Ijro jarayonida') {
                  index = 0;
                } else if (val == 'Yakunlangan') {
                  index = 1;
                } else if (val == 'Barchasi') {
                  index = 2;
                }
                sendRequest(index);
              },
            ),
            AppUtils.kGap24,
            Spacer(),
            AllAppealsWidget(),
            Spacer(),
          ],
        ),
      ),
    );
  }

  void sendRequest(int index) {
    if (index == 0) {
      context.read<PharmInfoBloc>().add(GetPharmInfoEvent(
          context: context,
          onSuccess: () {
            if (kDebugMode) {
              print('Success');
            }
          },
          onError: () {
            print('Error');
          },
          keyword: '',
          status: SearchStatus.PROCCESS.name,
          itemsPerPage: 20,
          page: 0));
    } else if (index == 1) {
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
    } else if (index == 2) {
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
}
