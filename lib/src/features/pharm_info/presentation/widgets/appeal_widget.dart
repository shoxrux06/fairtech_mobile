import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../drawer/appeals/presentaion/bloc/appeals_bloc.dart';
import '../../data/models/product_appeal_list_response.dart';

class AppealWidget extends StatefulWidget {
  const AppealWidget({super.key, required this.list});

  final List<ListElement>? list;

  @override
  State<AppealWidget> createState() => _AppealWidgetState();
}

class _AppealWidgetState extends State<AppealWidget> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<AppealsBloc>().add(GetAppealTypeEvent(context: context));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    if(widget.list?.isEmpty??false){
      return Center(child: Text('Hech qanday ma\'lumot topilmadi',style:context.textStyle.regularTitle2.copyWith(color: Colors.black),),);
    }else{
      String txt = '';
      return SingleChildScrollView(
        child: Column(
          children: [
            ...?widget.list?.map((item) =>  Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54, width: 1),
                  borderRadius: BorderRadius.circular(12)),
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
                      Expanded(child: Text(item.createJson.substring(0,item.createJson.indexOf(' '))??'---', style: context.textStyle.regularTitle1,))
                    ],
                  ),
                ],
              ),
            ))
          ],
        ),
      );

  }
}
}
