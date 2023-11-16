import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/features/pharm_info/presentation/bloc/pharm_info_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompletedAppealsWidget extends StatelessWidget {
  const CompletedAppealsWidget({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PharmInfoBloc, PharmInfoState>(
      builder: (context, state) {
        if(state.pharmInfoResponse == null){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }else if(state.isErrorOccurredWhileGettingPharmInfo){
          return Center(
            child: Text('Xatolik yuz berdi', style: context.textStyle.regularTitle2,),
          );
        } else{
          return Center(
            child: Text('Ma\'lumot topilmadi', style: context.textStyle.regularTitle2,),
          );
        }
      },
    );
  }
}
