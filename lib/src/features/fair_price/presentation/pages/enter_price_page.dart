import 'dart:io';

import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/presentation/components/input/custom_text_filed_two.dart';
import 'package:fairtech_mobile/src/features/components/app_bar/custom_app_bar.dart';
import 'package:fairtech_mobile/src/features/components/buttons/custom_button.dart';
import 'package:fairtech_mobile/src/features/components/buttons/custom_button_with_border.dart';
import 'package:fairtech_mobile/src/features/components/dropdown/custom_dropdown_field2.dart';
import 'package:fairtech_mobile/src/features/components/input/money_formatter.dart';
import 'package:fairtech_mobile/src/features/components/loading_widgets/modal_progress_hud.dart';
import 'package:fairtech_mobile/src/features/components/snackbar/app_snackbar.dart';
import 'package:fairtech_mobile/src/features/fair_price/domain/entity/market_product_list_entity.dart';
import 'package:fairtech_mobile/src/features/fair_price/presentation/bloc/fair_price_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../data/models/market_list_response.dart';

class EnterPricePage extends StatefulWidget {
  const EnterPricePage({super.key, required this.soato});

  final int soato;
  @override
  State<EnterPricePage> createState() => _EnterPricePageState();
}
enum SavdoObyektType{
  DEXQON,
  YIRIK,
  KICHIK,
  BENZIN,
  GAZ
}

enum Code{
  FOODS,
  OTHERS
}

class _EnterPricePageState extends State<EnterPricePage> {
  List<MarketListResponse> marketList = [];
  // List<MarketProductListEntity> marketProductList = [];
  final controllerAllPrice = TextEditingController();
  final maxPriceController = TextEditingController();
  final middlePriceController = TextEditingController();
  final minPriceController = TextEditingController();

  List<MarketProductListEntity> children = [];

  String? dropDownObjectType;
  String? dropDownMarketValue;
  String? dropDownProductValue;
  String? dropDownProductValueInner;


  int marketId = 0;
  int productId = 0;

  bool isBenzinOrGaz = false;

  MarketProductListEntity? selectedItem;

  File? selectedfile1;
  String fileName = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'Narx kiritish', textColor: context.theme.primaryColor,),
        body: BlocBuilder<FairPriceBloc, FairPriceState>(
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: (state.productListLoading || state.marketListLoading || state.isCreatingProductPrice),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mahsulot ob’ekti ma’lumotlari',
                        style: context.textStyle.regularBody.copyWith(color: context.theme.primaryColor, fontWeight: FontWeight.bold),
                      ),
                      AppUtils.kGap12,

                      SizedBox(
                        height: 54,
                        child: CustomDropDownFormField2(
                          value: dropDownObjectType,
                          hintText: 'Obyekt turi',
                          items: [
                            'Bozorlar',
                            'Savdo shahobchalari',
                            'Savdo majmualari',
                            'Yoqilg\'i shahobchalari (Benzin)',
                            'Yoqilg\'i shahobchalari (Suyultirilgan gaz)',
                          ].toSet().toList(),
                          onChanged: (val) {
                            if(val != dropDownObjectType) {
                              dropDownMarketValue = null;
                              dropDownProductValue = null;
                              dropDownProductValueInner = null;
                              children = [];
                            }

                            dropDownObjectType = val;

                            String type = '';
                            String typeProduct = '';
                            String code = '';

                            switch(val){
                              case 'Bozorlar':
                                type = SavdoObyektType.DEXQON.name;
                                typeProduct = '';
                                isBenzinOrGaz = false;
                                code = Code.FOODS.name;
                                break;
                              case 'Savdo shahobchalari':
                                type = SavdoObyektType.YIRIK.name;
                                typeProduct = '';
                                isBenzinOrGaz = false;
                                code = Code.FOODS.name;
                                break;
                              case 'Savdo majmualari':
                                type = SavdoObyektType.KICHIK.name;
                                typeProduct = '';
                                isBenzinOrGaz = false;
                                code = Code.FOODS.name;
                                break;
                              case 'Yoqilg\'i shahobchalari (Benzin)':
                                type = SavdoObyektType.BENZIN.name;
                                typeProduct = SavdoObyektType.BENZIN.name;
                                isBenzinOrGaz = true;
                                code = Code.OTHERS.name;
                                break;
                              case 'Yoqilg\'i shahobchalari (Suyultirilgan gaz)':
                                type = SavdoObyektType.GAZ.name;
                                typeProduct = SavdoObyektType.GAZ.name;
                                isBenzinOrGaz = true;
                                code = Code.OTHERS.name;
                                break;
                              default :'';
                            }
                            context.read<FairPriceBloc>().add(
                                GetOuterMarketListEvent(
                                    onSuccess: (){
                                      print('Omad1');
                                    },
                                    onError: (){},
                                    context: context,
                                    keyword: '',
                                    type: type
                                )
                            );
                            context.read<FairPriceBloc>().add(
                                GetMarketProductListByTypeEvent(
                                    onSuccess: (){
                                      print('Omad2');
                                    },
                                    onError: (){},
                                    context: context,
                                    code: code,
                                    type: typeProduct
                                )
                            );
                            setState(() {});
                          },
                        ),
                      ),
                      AppUtils.kGap12,
                      SizedBox(
                        height: 54,
                        child: CustomDropDownFormField2(
                          value: dropDownMarketValue,
                          hintText: 'Obyekt nomi',
                          items: state.marketListResponse.map((e) => e.marketName).toSet().toList(),
                          onChanged: (val) {
                            for (var element in state.marketListResponse) {
                              print('Marketname => ${element.marketName}');
                              if(element.marketName == val){
                                marketId = element.id;
                                print('marketId ==> * $marketId *');
                              }
                            }
                            setState(() {
                              dropDownMarketValue = val;
                            });
                          },
                        ),
                      ),
                      AppUtils.kGap12,
                      SizedBox(
                        height: 54,
                        child: CustomDropDownFormField2(
                          value: dropDownProductValue,
                          hintText: 'Mahsulot nomi',
                          items: state.marketProductEntity?.children.map((e) => e.nameLt??'').toSet().toList()??[],
                          onChanged: (val) {
                            if(dropDownProductValue != null) dropDownProductValueInner = null;
                            setState(() {
                              dropDownProductValue = val;
                            });
                            state.marketProductEntity?.children.forEach((element) {
                              if(val == element.nameLt){
                                productId = element.id??0;
                                setState(() {
                                  children = element.children;
                                });

                              }
                            });
                          },
                        ),
                      ),
                      AppUtils.kGap12,
                      children.isEmpty? Container():SizedBox(
                        height: 54,
                        child: CustomDropDownFormField2(
                          value: dropDownProductValueInner,
                          hintText: '${dropDownProductValue} turlari',
                          items: children.map((item) => item.nameLt??'').toSet().toList(),
                          onChanged: (val) {
                            setState(() {
                              dropDownProductValueInner = val;
                            });
                            for (var element in children) {
                              if(val == element.nameLt){
                                productId = element.id??0;
                              }
                            }
                          },
                        ),
                      ),
                      AppUtils.kGap24,
                      Text(
                        'Mahsulot narxlari',
                        style: context.textStyle.regularBody.copyWith(
                            color: context.theme.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      AppUtils.kGap12,
                      isBenzinOrGaz? Column(
                        children: [
                          CustomTextFieldTwo(
                            inputFormatters: [MoneyTextInputFormatter()],
                            controller: controllerAllPrice,
                            style: context.textStyle.regularBody.copyWith(color: context.theme.primaryColor),
                            titleText: 'Yoqilg\'i narxi',
                            hintText: 'Yoqilg\'i narxini kiriting',
                            keyboardType: TextInputType.number,
                            suffixText: 'so\'m',
                          ),
                          AppUtils.kGap12,
                          Container(
                              margin: const EdgeInsets.symmetric(vertical: 4),
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey[100]),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.file_copy, color: Colors.redAccent),
                                  const SizedBox(width: 12),
                                  Flexible(
                                    child: Text(
                                      fileName,
                                      style: context.textStyle.regularBody,
                                    ),
                                  ),
                                ],
                              )
                          ),
                          AppUtils.kGap12,
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                                width: Responsive.width(50, context),
                                child: InkWell(
                                    onTap: (){
                                      selectFile1();
                                    },
                                    child: CustomButton(text: 'Fayl'))),
                          )
                        ],
                      ): Column(
                            children: [
                              CustomTextFieldTwo(
                                inputFormatters: [MoneyTextInputFormatter()],
                                controller: maxPriceController,
                                style: context.textStyle.regularBody.copyWith(color: context.theme.primaryColor),
                                titleText: 'Eng yuqori narx',
                                hintText: 'Eng yuqori narxni kiriting',
                                keyboardType: TextInputType.number,
                                suffixText: 'so\'m',
                              ),
                              AppUtils.kGap12,
                              CustomTextFieldTwo(
                                inputFormatters: [MoneyTextInputFormatter()],
                                controller: minPriceController,
                                titleText: 'Eng past narx',
                                hintText: 'Eng past narxni kiriting',
                                keyboardType: TextInputType.number,
                                suffixText: 'so\'m',
                              ),
                              AppUtils.kGap12,
                              CustomTextFieldTwo(
                                inputFormatters: [MoneyTextInputFormatter()],
                                controller: middlePriceController,
                                titleText: 'Xaridorgir narx',
                                hintText: 'Xaridorgir narxni kiriting',
                                keyboardType: TextInputType.number,
                                suffixText: 'so\'m',
                              ),
                            ],
                          ),
                     AppUtils.kGap12,
                      InkWell(
                          onTap: (){
                            if(isBenzinOrGaz){
                              if(isValidBenzin()){
                                context.read<FairPriceBloc>().add(
                                  CreateProductPriceEvent(
                                      onSuccess: (){
                                        controllerAllPrice.text = '';
                                        AppSnackBar.showSuccessSnackBar(context, '','Muaffaqiyatli saqlandi!');
                                        context.pop();
                                      },
                                      onError: () {
                                        AppSnackBar.showErrorSnackBar(context, '','Xatolik yuz berdi!');
                                      },
                                      context: context,
                                      maxPrice: double.tryParse(controllerAllPrice.text.replaceAll(' ', ''))??0.0,
                                      middlePrice: double.tryParse(controllerAllPrice.text.replaceAll(' ', ''))??0.0,
                                      minPrice: double.tryParse(controllerAllPrice.text.replaceAll(' ', ''))??0.0,
                                      productId: productId,
                                      marketId: marketId,
                                      file: selectedfile1?? File(''),
                                      isMarketEmployee: false
                                  ),
                                );
                              }
                            }else{
                              if(isValid()){
                                context.read<FairPriceBloc>().add(
                                  CreateProductPriceEvent(
                                      onSuccess: (){
                                        minPriceController.text = '';
                                        maxPriceController.text = '';
                                        middlePriceController.text = '';
                                        AppSnackBar.showSuccessSnackBar(context, '','Muaffaqiyatli saqlandi!');
                                        context.pop();
                                      },
                                      onError: () {
                                        AppSnackBar.showErrorSnackBar(context, '','Xatolik yuz berdi!');
                                      },
                                      context: context,
                                      maxPrice: double.tryParse(maxPriceController.text.replaceAll(' ', ''))??0.0,
                                      middlePrice: double.tryParse(middlePriceController.text.replaceAll(' ', ''))??0.0,
                                      minPrice: double.tryParse(minPriceController.text.replaceAll(' ', ''))??0.0,
                                      productId: productId,
                                      marketId: marketId,
                                      file: selectedfile1??File(''),
                                      isMarketEmployee: false
                                  ),
                                );
                              }
                            }
                          },
                          child: CustomButton(text: 'Saqlash')),
                      AppUtils.kGap12,
                      // CustomButtonWithBorder(onTap: () {}, text: 'Narxlar tarixi'),
                      // AppUtils.kGap12,
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }

  selectFile1() async {
    String? filePath = await FilePicker.platform
        .pickFiles(type: FileType.any)
        .then((value) => value?.files.single.path);

    if (filePath != null) {
      setState(() {
        selectedfile1 = File(filePath); // picked file
        fileName = filePath.split('/').last;
      });
    }
  }
  
  bool isValid(){
    int minPrice = int.tryParse(minPriceController.text.replaceAll(' ', '')) ?? 0;
    int maxPrice = int.tryParse(maxPriceController.text.replaceAll(' ', '')) ?? 0;
    int middlePrice = int.tryParse(middlePriceController.text.replaceAll(' ', ''))??0;
    if(dropDownObjectType == null){
      AppSnackBar.showWarningSnackBar(context, 'Obyekt turini tanlang');
      return false;
    }else if(dropDownMarketValue == null){
      AppSnackBar.showWarningSnackBar(context, 'Obyekt nomini tanlang');
      return false;
    }else if(minPriceController.text.isEmpty || maxPriceController.text.isEmpty){
      AppSnackBar.showWarningSnackBar(context, 'Iltimos barcha maydonlarni to\'ldiring');
      return false;
    }else if(minPrice >= maxPrice){
      AppSnackBar.showWarningSnackBar(context, '"Minimal narx" "Maksimal narx"ga nisbatan katta yoki teng bo\'lmasligi lozim');
      return false;
    }else if(middlePrice < minPrice || middlePrice > maxPrice){
      AppSnackBar.showWarningSnackBar(context, '"Xaridorgir narx" "Maksimal narx" va "Minimal narx" oralig\'ida bo\'lishi lozim');
      return false;
    }else if(children.isNotEmpty && dropDownProductValueInner == null){
      AppSnackBar.showWarningSnackBar(context, '"Mahsulotni tanlang');
      return false;
    }else if(children.isNotEmpty && dropDownProductValueInner == null){
      AppSnackBar.showWarningSnackBar(context, '"Mahsulotni tanlang');
      return false;
    }
    else{
      return true;
    }
  }

  bool isValidBenzin(){
    if(dropDownObjectType == null){
      AppSnackBar.showWarningSnackBar(context, 'Obyekt turini tanlang');
      return false;
    }else if(dropDownMarketValue == null){
      AppSnackBar.showWarningSnackBar(context, 'Obyekt nomini tanlang');
      return false;
    }else if(controllerAllPrice.text.isEmpty){
      AppSnackBar.showWarningSnackBar(context, 'Iltimos barcha maydonlarni to\'ldiring');
      return false;
    }
    else if(children.isNotEmpty && dropDownProductValueInner == null){
      AppSnackBar.showWarningSnackBar(context, 'Mahsulotni tanlang');
      return false;
    }
    else{
      return true;
    }
  }
}
