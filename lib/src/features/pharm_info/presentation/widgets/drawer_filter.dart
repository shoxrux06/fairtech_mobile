import 'package:fairtech_mobile/src/config/router/app_routes.dart';
import 'package:fairtech_mobile/src/core/di/dependency_manager.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/presentation/components/input/custom_text_field.dart';
import 'package:fairtech_mobile/src/features/components/buttons/custom_button_without_gradient.dart';
import 'package:fairtech_mobile/src/features/components/dropdown/custom_dropdown_form_filed.dart';
import 'package:fairtech_mobile/src/features/pharm_info/presentation/bloc/pharm_info_bloc.dart';
import 'package:fairtech_mobile/src/features/pharm_info/presentation/widgets/regions_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class DrawerFilter extends StatefulWidget {
  const DrawerFilter({super.key});

  @override
  State<DrawerFilter> createState() => _DrawerFilterState();
}

class _DrawerFilterState extends State<DrawerFilter> {

  DateTime? _startDate;
  DateTime? _endDate;

  String appealStatus = 'Kelib tushgan';
  List<String> appealStatusItems = ['Kelib tushgan','Ijro jarayonida', 'Tasdiqlashda','Yakunlangan'];

  final _dateTimeController1 = TextEditingController();

  final _dateTimeController2 = TextEditingController();
  final stirController = TextEditingController();
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final regionController = TextEditingController();
  final districtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd.MM.yyyy');
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppUtils.kGap24,
            Text('Filter', style: context.textStyle.regularTitle2,),
            AppUtils.kGap8,
            Text('Oraliq davri', style: context.textStyle.regularTitle1,),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      showModalBottomSheet(context: context, builder: (_) => bottomSheet(true));
                    },
                    child: CustomTextField(
                      enabled: false,
                      controller: _dateTimeController1,
                      hintText: dateFormat.format(DateTime.now()),
                      hintStyle: context.textStyle.hintStyle,
                      suffixIcon: Icon(Icons.calendar_month,size: 24,),
                      contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 12),
                    ),
                  ),
                ),
                AppUtils.kGap8,
                Expanded(
                  child: InkWell(
                    onTap: (){
                      showModalBottomSheet(context: context, builder: (_) => bottomSheet(false));
                    },
                    child: CustomTextField(
                      controller: _dateTimeController2,
                      enabled: false,
                      hintText: dateFormat.format(DateTime.now()),
                      hintStyle: context.textStyle.hintStyle,
                      suffixIcon: Icon(Icons.calendar_month,size: 24,),
                      contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 12),
                    ),
                  ),
                )
              ],
            ),
            AppUtils.kGap8,
            Text('Murojaat holati', style: context.textStyle.regularTitle1,),
            CustomDropDownFormField(value: appealStatus, hintText: 'Murojaat holati', items: appealStatusItems),
            AppUtils.kGap8,
            Text('Tashkilot ma\'lumotlari', style: context.textStyle.regularTitle1,),
            CustomTextField(
              controller: stirController,
              hintText: 'STIR bo\'yicha qidirish',
              hintStyle: context.textStyle.hintStyle,
              contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 12),
            ),
            AppUtils.kGap8,
            Text('Iste\'molchi  ma\'lumotlari', style: context.textStyle.regularTitle1,),
            CustomTextField(
              controller: fullNameController,
              hintText: 'F.I.O',
              hintStyle: context.textStyle.hintStyle,
              contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 12),
            ),
            AppUtils.kGap8,
            Text('Telefon nomeri', style: context.textStyle.regularTitle1,),
            CustomTextField(
              controller: phoneController,
              hintText: 'Telefon nomeri',
              hintStyle: context.textStyle.hintStyle,
              contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 12),
            ),
            AppUtils.kGap8,
            Text('Viloyat', style: context.textStyle.regularTitle1,),
            InkWell(
              onTap: (){
                showModalBottomSheet(context: context, builder: (_) =>BlocProvider(create: (_) => PharmInfoBloc(pharmInfoRepository),child: const RegionsWidget(),));
              },
              child: CustomTextField(
                controller: regionController,
                enabled: false,
                hintText: 'Viloyat',
                hintStyle: context.textStyle.hintStyle,
                contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 12),
              ),
            ),
            AppUtils.kGap8,
              Text('Tuman', style: context.textStyle.regularTitle1,),
            CustomTextField(
              controller: districtController,
              enabled: false,
              hintText: 'Tuman',
              hintStyle: context.textStyle.hintStyle,
              contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 12),
            ),
            AppUtils.kGap24,
            CustomButtonWithoutGradient(onTap: () {
              context.pop();
            }, text: 'Qidirish',textColor: Colors.white,
            )
          ],
        ),
      )
    );
  }

  Widget region(){
    return const Column(
      children: [

      ],
    );
  }
  Widget bottomSheet(bool isFirst) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: Responsive.height(40, context),
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: DateTime(2000),
            onDateTimeChanged: (newDateTime) {
              if(isFirst){
                _startDate = newDateTime;
              }else{
                _endDate = newDateTime;
              }
            },
          ),
        ),
        AppUtils.kGap12,
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomButtonWithoutGradient(onTap: (){
            setState(() {
              if(isFirst){
                _dateTimeController1.text = '${_startDate?.day}.${_startDate?.month}.${_startDate?.year}';
              }else{
                _dateTimeController2.text = '${_endDate?.day}.${_endDate?.month}.${_endDate?.year}';
              }
              Navigator.of(context).pop();
            });
          }, text: 'Submit'),
        ),
      ],
    );
  }
}
