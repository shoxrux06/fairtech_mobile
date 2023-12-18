import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:fairtech_mobile/src/features/components/app_bar/custom_app_bar.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/presentaion/bloc/appeals_bloc.dart';
import 'package:fairtech_mobile/src/features/pharm_info/presentation/bloc/pharm_info_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllAppealsWidget extends StatefulWidget {
  const AllAppealsWidget({super.key});

  @override
  State<AllAppealsWidget> createState() => _AllAppealsWidgetState();
}

class _AllAppealsWidgetState extends State<AllAppealsWidget> {
  @override
  void initState() {
    // TODO: implement initState
    context
        .read<PharmInfoBloc>()
        .add(GetAppealsListEvent(context: context, status: 'Created'));
    context.read<AppealsBloc>().add(GetAppealTypeEvent(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PharmInfoBloc, PharmInfoState>(
      builder: (context, state) {
        print('total ==> ${state.productAppealListResponse?.total}');
        if (state.productAppealListResponse == null) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Scaffold(
            appBar: CustomAppBar(title: 'Barcha Murojaatlar'),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  ...?state.productAppealListResponse?.list.map((item) {
                    String txt = '---';
                    return Container(
                      width: Responsive.width(100, context),
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54, width: 1),
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(child: Text('Subyekt nomi',style: context.textStyle.largeTitle2,)),
                              AppUtils.kGap12,
                              Expanded(child: Text('${item.orgName ?? '---'}', style: context.textStyle.regularTitle1,))
                            ],
                          ),
                          AppUtils.kGap12,
                          Row(
                            children: [
                              Expanded(child: Text('Murojaat turi')),
                              AppUtils.kGap12,
                              Expanded(
                                child: BlocBuilder<AppealsBloc, AppealsState>(builder: (context, state) {
                                  state.appealTypeResponse?.list.forEach((element) {
                                    if(element.id == item.appealTypesId){
                                      txt = element.nameUz;
                                    }
                                  });
                                  return  Text('$txt', style: context.textStyle.regularTitle1,);
                                }),
                              ),
                            ],
                          ),
                          AppUtils.kGap12,
                          Row(
                            children: [
                              Expanded(child: Text('Murojaat raqami',style: context.textStyle.largeTitle2,)),
                              AppUtils.kGap12,
                              Expanded(child: Text('${item.mnumber ?? '---'}', style: context.textStyle.regularTitle1,))
                            ],
                          ),
                          AppUtils.kGap12,
                          Row(
                            children: [
                              Expanded(child: Text('Murojaat yuborilgan sana',style: context.textStyle.largeTitle2,)),
                              AppUtils.kGap12,
                              Expanded(child: Text('---', style: context.textStyle.regularTitle1,))
                            ],
                          ),
                        ],
                      ),
                    );
                  })
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
