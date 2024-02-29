import 'package:fairtech_mobile/src/config/router/app_routes.dart';
import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/presentation/components/input/custom_text_field_three.dart';
import 'package:fairtech_mobile/src/features/components/buttons/custom_button.dart';
import 'package:fairtech_mobile/src/features/components/buttons/custom_button_with_border.dart';
import 'package:fairtech_mobile/src/features/components/dropdown/custom_dropdown_field2.dart';
import 'package:fairtech_mobile/src/features/components/snackbar/app_snackbar.dart';
import 'package:fairtech_mobile/src/features/fair_price/domain/entity/obyekt_type_entity.dart';
import 'package:fairtech_mobile/src/features/fair_price/presentation/bloc/fair_price_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddLegalEntity extends StatefulWidget {
  AddLegalEntity({
    super.key,
    required this.center,
    required this.shortName,
    required this.companyBillingAddress,
    required this.phone,
    required this.lastName,
    required this.firstName,
    required this.middleName,
    required this.businessStructureId,
    required this.businessStructureName,
    required this.soato,
    required this.obyektTypeEntity,
  });

  LatLng? center;
  String shortName;
  String companyBillingAddress;
  String phone;
  String lastName;
  String firstName;
  String middleName;
  int businessStructureId;
  String businessStructureName;
  int soato;
  ObyektTypeEntity? obyektTypeEntity;

  @override
  State<AddLegalEntity> createState() => _AddLegalEntityState();
}

class _AddLegalEntityState extends State<AddLegalEntity> {
  String? dropDownObjectType;
  String? lang;
  String? lat;
  int? marketTypeId;
  final stirController = TextEditingController();
  bool obyektIsCreated = false;

  @override
  Widget build(BuildContext context) {
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
                        IgnorePointer(
                          ignoring: obyektIsCreated,
                          child: CustomDropDownFormField2(
                            value: dropDownObjectType,
                            hintText: 'Obyekt turini tanlang',
                            isMultiple: true,
                            isType: true,
                            items: List.from(widget.obyektTypeEntity?.list.map((e) => e.nameLt)??[]),
                            onChanged: (val){
                              dropDownObjectType = val??'';
                              widget.obyektTypeEntity?.list.forEach((element) {
                                if(element.nameLt == val){
                                  marketTypeId = element.id;
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    AppUtils.kGap12,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Obyekt lokatsiyasi',style: context.textStyle.regularBody.copyWith(color: context.theme.primaryColor),),
                        IgnorePointer(
                          ignoring: obyektIsCreated,
                          child: InkWell(
                            onTap: ()async {
                              dynamic result = await context.push(Routes.selectFromMap, extra: context);
                              if(result != null) {
                                setState(() {
                                  widget.center = result['coordinates'];
                                  lang = widget.center?.longitude.toString() ?? '12.34343434';
                                  lat = widget.center?.latitude.toString() ?? '34.45553566';
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
                                        child: Text('${lang ??'0'}° ${lat ?? '0'}°', style: context.textStyle.regularBody.copyWith(color: context.theme.primaryColor),maxLines: 1,overflow: TextOverflow.ellipsis,)),
                                  ),
                                  AppUtils.kGap4,
                                  SvgPicture.asset(AppConstants.mapSvg,width: 16,height: 16,)
                                ],
                              ),
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
                    Text('STIR',style: context.textStyle.regularBody.copyWith(color: context.theme.primaryColor),),
                    SizedBox(
                      height: 54,
                      child: CustomTextFieldThree(
                        hintText: 'STIR ni kiriting',
                        keyboardType: TextInputType.number,
                        controller: stirController,
                        enabled: !obyektIsCreated,
                        style: context.textStyle.regularBody,
                        inputAction: TextInputAction.done,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(9),
                          ],
                        onChanged: (val){
                          if(val?.length == 9){
                            context.read<FairPriceBloc>().add(GetCompanyDataWithTinEvent(
                                context: context,
                                onSuccess: (){
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                onError: (){},
                                tin: stirController.text.trim()
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
              Text('Savdo obyekti nomi', style: context.textStyle.regularBody.copyWith(color: context.theme.primaryColor),),
              AppUtils.kGap12,
              Text(widget.shortName, style: context.textStyle.largeTitle2.copyWith(color: context.theme.primaryColor),),
              AppUtils.kGap12,
              Text('Savdo obyekti manzili', style: context.textStyle.regularBody.copyWith(color: context.theme.primaryColor),),
              AppUtils.kGap12,
              Text(widget.companyBillingAddress, style: context.textStyle.largeTitle2.copyWith(color: context.theme.primaryColor),),
              AppUtils.kGap12,
              Text('Savdo obyekti rahbari', style: context.textStyle.regularBody.copyWith(color: context.theme.primaryColor),),
              AppUtils.kGap12,
              Text('${widget.lastName}'
                  '${widget.firstName} '
                  '${widget.middleName}', style: context.textStyle.largeTitle2.copyWith(color: context.theme.primaryColor),),
              AppUtils.kGap12,
              Text('Rahbar telefon raqami', style: context.textStyle.regularBody.copyWith(color: context.theme.primaryColor),),
              AppUtils.kGap12,
              Text(widget.phone, style: context.textStyle.largeTitle2.copyWith(color: context.theme.primaryColor),),
            ],
          ),
          AppUtils.kGap24,
          !obyektIsCreated?Container():InkWell(
              onTap: (){
                context.push(Routes.enterPrice, extra: {'isFromProductDetail': false,'dropDownObjectType':dropDownObjectType});
              },
              child: CustomButton(text: 'Narx kiritish')),
          AppUtils.kGap12,
          obyektIsCreated?Container():InkWell(
              onTap: (){
                if(isValid()){
                  context.read<FairPriceBloc>().add(CreateObyektEvent(
                      context: context,
                      onSuccess: (){
                        setState(() {
                          obyektIsCreated = true;
                        });
                        AppSnackBar.showSuccessSnackBar(context,'Success', 'Obyekt muaffaqiyatli qo\'shildi');
                      },
                      onError: (){},
                      address: widget.companyBillingAddress,
                      businessStructureId: widget.businessStructureId,
                      businessStructureName: widget.businessStructureName,
                      marketTypeId: marketTypeId??0,
                      soato: widget.soato,
                      statusId: 16,
                      tin: stirController.text.trim(),
                      pinfl: '',
                      marketName: widget.shortName,
                      lat: lat??'',
                      lang: lang??'',
                      isYuridik: true
                  )
                  );
                }
              },
              child: const CustomButton(text: 'Saqlash')
          ),
          AppUtils.kGap24,
        ],
      ),
    );
  }

  bool isValid() {
    if (dropDownObjectType == null) {
      AppSnackBar.showWarningSnackBar(context, 'Obyekt turini tanlang');
      return false;
    } else if (stirController.text.isEmpty) {
      AppSnackBar.showWarningSnackBar(context, 'Iltimos STIR ni kiriting');
      return false;
    } else if (stirController.text.length != 9) {
      AppSnackBar.showWarningSnackBar(context, 'Kiritilgan STIR noto\'g\'ri');
      return false;
    } else {
      return true;
    }
  }
}
