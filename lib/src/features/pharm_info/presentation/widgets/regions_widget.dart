import 'package:fairtech_mobile/src/core/di/dependency_manager.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:fairtech_mobile/src/features/components/buttons/custom_button_without_gradient.dart';
import 'package:fairtech_mobile/src/features/pharm_info/presentation/bloc/pharm_info_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegionsWidget extends StatefulWidget {
  const RegionsWidget({super.key});

  @override
  State<RegionsWidget> createState() => _RegionsWidgetState();
}

class _RegionsWidgetState extends State<RegionsWidget> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<PharmInfoBloc>().add(GetRegionListEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PharmInfoBloc, PharmInfoState>(
      builder: (context, state) {
        if(state.getRegionListResponse == null){
          return Center(
            child: CircularProgressIndicator(),
          );
        }else{
          return Column(
            children: [
              SizedBox(
                height: Responsive.height(40, context),
                child: ListView.builder(
                    itemCount: state.getRegionListResponse.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          context.pop({"region" :state.getRegionListResponse[index]});
                        },
                        child: ListTile(
                          title: Text('${state.getRegionListResponse[index]?.nameLt}'),
                        ),
                      );
                    }),
              ),
              CustomButtonWithoutGradient(onTap: (){
              }, text: 'Select')
            ],
          );
        }

      },
    );
  }
}
