import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/features/components/buttons/custom_button_without_gradient.dart';
import 'package:fairtech_mobile/src/features/components/dropdown/custom_dropdown_form_filed.dart';
import 'package:fairtech_mobile/src/features/main/menu/profile/data/local_data.dart';
import 'package:fairtech_mobile/src/features/main/menu/star/presentaion/bloc/star_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BottomFilterRegion extends StatefulWidget {
  BottomFilterRegion({
    super.key,
    required this.items,
    required this.checkboxValue1,
    required this.checkboxValue2,
    required this.checkboxValue3,
  });

  final List<String> items;
  bool checkboxValue1;
  bool checkboxValue2;
  bool checkboxValue3;

  @override
  State<BottomFilterRegion> createState() => _BottomFilterRegionState();
}

class _BottomFilterRegionState extends State<BottomFilterRegion> {
  String value = LocalData.orderItems.first.hududlar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CustomDropDownFormField(
              value: value,
              hintText: 'Hududni tanlang',
              onChanged: (val) {
                setState(() {
                  value = val ?? '';
                });
              },
              items: widget.items),
          AppUtils.kGap24,
          Column(
            children: [
              CheckboxListTile(
                value: widget.checkboxValue1,
                onChanged: (bool? value) {
                  setState(() {
                    widget.checkboxValue1 = value!;
                  });
                },
                title: const Text('Jami o\'tkazilgan savdolar soni'),
              ),
              const Divider(height: 0),
              CheckboxListTile(
                value: widget.checkboxValue2,
                onChanged: (bool? value) {
                  setState(() {
                    widget.checkboxValue2 = value!;
                  });
                },
                title: const Text('Jami o\'rganilgan savdolar soni'),
              ),
              const Divider(height: 0),
              CheckboxListTile(
                value: widget.checkboxValue3,
                onChanged: (bool? val) {
                  setState(() {
                    widget.checkboxValue3 = val!;
                  });
                },
                title:
                    const Text('KPI-tizim bo\'yicha to\'plangan jami ballar'),
              ),
              const Divider(height: 0),
            ],
          ),
          AppUtils.kGap24,
          const Spacer(),
          CustomButtonWithoutGradient(
            onTap: () {
              context.read<StarBloc>().add(SubmitFilterEvent(
                    widget.checkboxValue1,
                    widget.checkboxValue2,
                    widget.checkboxValue3,
                    value: value,
                  ));
              context.pop();
            },
            text: 'Submit',
            textColor: context.color?.white,
          )
        ],
      ),
    );
  }
}
