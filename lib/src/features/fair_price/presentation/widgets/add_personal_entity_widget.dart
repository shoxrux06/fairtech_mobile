import 'package:fairtech_mobile/src/config/router/app_routes.dart';
import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/presentation/components/input/custom_text_field.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/presentation/components/input/custom_text_field_three.dart';
import 'package:fairtech_mobile/src/features/components/buttons/custom_button.dart';
import 'package:fairtech_mobile/src/features/components/dropdown/custom_dropdown_field2.dart';
import 'package:fairtech_mobile/src/features/components/snackbar/app_snackbar.dart';
import 'package:fairtech_mobile/src/features/fair_price/presentation/bloc/fair_price_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddPersonalEntityWidget extends StatefulWidget {
  AddPersonalEntityWidget({
    super.key,
    required this.marketTypeId,
    required this.center,
    required this.lang,
    required this.lat,
    required this.shortName,
    required this.businessStructureName,
    required this.soato,
  });

  int? marketTypeId;

  LatLng? center;
  String lang;
  String lat;
  String shortName;
  String businessStructureName;
  int soato;

  @override
  State<AddPersonalEntityWidget> createState() => _AddPersonalEntityWidgetState();
}

class _AddPersonalEntityWidgetState extends State<AddPersonalEntityWidget> {
  String? dropDownObjectType;

  final pinflController = TextEditingController();
  final yttNameController = TextEditingController();
  final yttAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('shortName ==> ${widget.shortName}');
    yttAddressController.text = widget.shortName;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppUtils.kGap12,
          Text('Obyekt ma\'lumotlari', style: context.textStyle.largeTitle1.copyWith(color: context.theme.primaryColor),),
          AppUtils.kGap12,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Obyekt turi',style: context.textStyle.regularBody.copyWith(color: context.theme.primaryColor),),
                        CustomDropDownFormField2(
                          value: dropDownObjectType,
                          hintText: 'Obyekt turi',
                          items: const [
                            'Bozorlar',
                            'Savdo shahobchalari',
                            'Savdo majmualari',
                            'Yoqilg\'i shahobchalari (Benzin)',
                            'Yoqilg\'i shahobchalari (Suyultirilgan gaz)',
                          ],
                          onChanged: (val){
                            dropDownObjectType = val??'';
                            if(val == 'Bozorlar'){
                              widget.marketTypeId = 1;
                            }else if(val == 'Savdo shahobchalari'){
                              widget.marketTypeId = 2;
                            }else if(val == 'Savdo majmualari'){
                              widget.marketTypeId = 3;
                            }else if(val == 'Yoqilg\'i shahobchalari (Benzin)'){
                              widget.marketTypeId = 4;
                            }else if(val == 'Yoqilg\'i shahobchalari (Suyultirilgan gaz)'){
                              widget.marketTypeId = 5;
                            }
                          },
                        ),
                      ],
                    ),
                    AppUtils.kGap12,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Joylashgan manzili',style: context.textStyle.regularBody.copyWith(color: context.theme.primaryColor),),
                        InkWell(
                          onTap: ()async {
                            dynamic result = await context.push(Routes.selectFromMap, extra: context);
                            if(result != null) {
                              setState(() {
                                widget.center = result['coordinates'];
                                widget.lang = widget.center?.longitude.toString() ?? '12.34343434';
                                widget.lat = widget.center?.latitude.toString() ?? '34.45553566';
                              });
                            }
                          },
                          child: Container(
                            height: 54,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: context.theme.primaryColor,
                                )
                            ),
                            child: Row(
                              children: [
                                Flexible(
                                  child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text('${widget.lang}° ${widget.lat}°', style: context.textStyle.regularBody.copyWith(color: context.theme.primaryColor),maxLines: 1,overflow: TextOverflow.ellipsis,)),
                                ),
                                AppUtils.kGap12,
                                SvgPicture.asset(AppConstants.mapSvg,width: 24,height: 24,)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    AppUtils.kGap12,
                  ],
                ),
              ),
              AppUtils.kGap12,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('JSH SHIR',style: context.textStyle.regularBody.copyWith(color: context.theme.primaryColor),),
                    SizedBox(
                      height: 54,
                      child: CustomTextFieldThree(
                        hintText: 'JSH SHIR ni kiriting',
                        keyboardType: TextInputType.number,
                        controller: pinflController,
                        style: context.textStyle.regularBody,
                        inputAction: TextInputAction.done,
                        onChanged: (val){
                          if(val?.length == 14){
                            context.read<FairPriceBloc>().add(GetPersonDataWithPinflEvent(
                                context: context,
                                onSuccess: (){
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                onError: (){},
                                pinfl: pinflController.text.trim()
                            ));
                          }
                        },
                      ),
                    ) ,
                  ],
                ),
              ),
            ],
          ),
          AppUtils.kGap12,
          Text('Qo\'shimcha ma\'lumotlar', style: context.textStyle.largeTitle1.copyWith(color: context.theme.primaryColor),),
          AppUtils.kGap12,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nomi', style: context.textStyle.regularBody.copyWith(color: context.theme.primaryColor),),
              AppUtils.kGap12,
              CustomTextField(
                hintText: 'YaTT nomini kiriting',
                controller: yttNameController,
              ),
              AppUtils.kGap12,
              Text('Manzili', style: context.textStyle.regularBody.copyWith(color: context.theme.primaryColor),),
              CustomTextField(
                hintText: 'YaTT manzilini kiriting',
                controller: yttAddressController,
              ),
            ],
          ),
          AppUtils.kGap24,
          InkWell(
              onTap: (){
                if(isValid()){
                  context.read<FairPriceBloc>().add(CreateObyektEvent(
                      context: context,
                      onSuccess: (){
                        AppSnackBar.showSuccessSnackBar(context,'', 'Obyekt muaffaqiyatli qo\'shildi');
                        pinflController.text = '';
                        context.pop();
                      },
                      onError: (){},
                      address: yttAddressController.text.trim(),
                      businessStructureId: 0,
                      businessStructureName: widget.businessStructureName,
                      marketTypeId: widget.marketTypeId??0,
                      soato: widget.soato,
                      statusId: 16,
                      tin:'',
                      pinfl: pinflController.text.trim(),
                      marketName: yttNameController.text.trim(),
                      lat: widget.lat,
                      lang: widget.lang,
                      isYuridik: false
                  )
                  );
                }
              },
              child: CustomButton(text: 'Saqlash')),
          AppUtils.kGap24,
        ],
      ),
    );
  }

  bool isValid() {
    if (dropDownObjectType == null) {
      AppSnackBar.showWarningSnackBar(context, 'Obyekt turini tanlang');
      return false;
    } else if (pinflController.text.isEmpty) {
      AppSnackBar.showWarningSnackBar(context, 'Iltimos JSH SHIR ni kiriting');
      return false;
    } else if (pinflController.text.length != 14) {
      AppSnackBar.showWarningSnackBar(context, 'Kiritilgan JSH SHIR noto\'g\'ri');
      return false;
    }else if (yttNameController.text.isEmpty) {
      AppSnackBar.showWarningSnackBar(context, 'YaTT nomini kiriting');
      return false;
    }else if (yttAddressController.text.isEmpty) {
      AppSnackBar.showWarningSnackBar(context, 'YaTT manzilini kiriting');
      return false;
    }else {
      return true;
    }
  }
}
