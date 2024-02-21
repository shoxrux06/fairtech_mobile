import 'package:fairtech_mobile/src/config/router/app_routes.dart';
import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/core/utils/local_storage.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:fairtech_mobile/src/features/components/app_bar/custom_app_bar.dart';
import 'package:fairtech_mobile/src/features/components/buttons/custom_button_with_icon.dart';
import 'package:fairtech_mobile/src/features/components/dropdown/custom_dropdown_field2.dart';
import 'package:fairtech_mobile/src/features/components/dropdown/custom_dropdown_form_filed_two.dart';
import 'package:fairtech_mobile/src/features/components/loading_widgets/modal_progress_hud.dart';
import 'package:fairtech_mobile/src/features/fair_price/domain/entity/market_product_list_entity.dart';
import 'package:fairtech_mobile/src/features/fair_price/presentation/bloc/fair_price_bloc.dart';
import 'package:fairtech_mobile/src/features/fair_price/presentation/widgets/stack_image.dart';
import 'package:fairtech_mobile/src/features/pharm_info/data/models/get_region_list_response.dart';
import 'package:fairtech_mobile/src/features/pharm_info/presentation/bloc/pharm_info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../data/models/market_list_response.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, required this.product});

  final MarketProductListEntity product;


  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}
/// 31310841470068
class _ProductDetailPageState extends State<ProductDetailPage> {
  List<GetRegionListResponse?> myList = [];
  List<MarketListResponse> marketListDehqon = [];
  List<MarketListResponse> marketListYirik = [];
  List<MarketListResponse> marketListKichik = [];

  List<MarketListResponse> marketListBenzin = [];
  List<MarketListResponse> marketListGaz = [];

  String? dropdownRegionValue;

  String? dropdownDehqonVaue;
  String? dropdownYirikValue;
  String? dropdownKichikValue;

  String? dropdownBenzinValue;
  String? dropdownGazValue;

  int soato = 17;

  int marketId1 = 0;
  int marketId2 = 0;
  int marketId3 = 0;

  @override
  void initState() {
    context.read<PharmInfoBloc>().add(UpdateUserTokenEvent(context: context, username: LocalStorage.instance.getUserName()));
    context.read<PharmInfoBloc>().add(GetRegionListEvent(onSuccess: (){
      myList = context.read<PharmInfoBloc>().state.getRegionListResponse;
      dropdownRegionValue = myList.first?.nameUz;
      },
        onError: (){},
        context: context)
    );
    context.read<FairPriceBloc>().add(GetMarketListEvent(context: context, onSuccess: (){
         List<MarketListResponse> marketList = context.read<FairPriceBloc>().state.marketListResponse;

         marketListDehqon = marketList.where((element) => element.marketTypeId == 1).toSet().toList();
         marketListYirik = marketList.where((element) => element.marketTypeId == 2).toSet().toList();
         marketListKichik = marketList.where((element) => element.marketTypeId == 3).toSet().toList();
         marketListBenzin = marketList.where((element) => element.marketTypeId == 4).toSet().toList();
         marketListGaz = marketList.where((element) => element.marketTypeId == 5).toSet().toList();

         marketId1 = marketListDehqon.first.id;
         marketId2 = marketListYirik.first.id;
         marketId3 = marketListKichik.first.id;

          context.read<FairPriceBloc>().add(GetOneProductAllSumsEvent(
          context: context,
          onSuccess: (){
            dropdownDehqonVaue = marketListDehqon.first.marketName;
            dropdownYirikValue = marketListYirik.first.marketName;
            dropdownKichikValue = marketListKichik.first.marketName;
            dropdownBenzinValue = marketListBenzin.first.marketName;
            dropdownGazValue = marketListGaz.first.marketName;
            },
          onError: (){},
          productId: widget.product.id ?? 0,
          marketId1: marketId1,
          marketId2: marketId2,
          marketId3: marketId3,
          soato: soato));
    }, onError: (){}, keyword: '', type: '', soato: soato));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print('CODE DET2 ${widget.product.code}');
    return Scaffold(
      appBar: CustomAppBar(title: 'Mahsulot narxlari', textColor: context.theme.primaryColor,),
      body: BlocBuilder<FairPriceBloc,FairPriceState>(
        builder: (context,state){
            return ModalProgressHUD(
              inAsyncCall: state.productAllPriceLoading,
              child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: Responsive.width(30, context),
                          child: Column(
                            children: [
                              widget.product.photoPng.uploadPath.isNotEmpty? Image.network('https://fairtech.uz/${widget.product.photoPng.uploadPath}', width: 100,height: 100,): StackImage(),
                              AppUtils.kGap4,
                              Text(widget.product.nameLt ??'',maxLines: 3,overflow: TextOverflow.ellipsis,style: context.textStyle.largeTitle2.copyWith(color: context.theme.primaryColor, fontSize: 14),textAlign: TextAlign.center,),
                            ],
                          ),
                        ),
                        AppUtils.kGap12,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                    child: FittedBox(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Eng qimmat narx (so‘m)',style: context.textStyle.regularBody.copyWith(color: context.theme.primaryColor),),
                                          Text(state.oneProductAllSumsResponse?.all.maxRegion?.nameLt ?? '- - -', style: context.textStyle.largeTitle2.copyWith(color: context.theme.primaryColor),),
                                        ],
                                      ),
                                    ),
                                  ),
                                  AppUtils.kGap12,
                                  Flexible(child: FittedBox(child: Text('${state.oneProductAllSumsResponse?.all.maxSum ??  'Narx qayd etilmagan'} ${state.oneProductAllSumsResponse?.all.maxSum == null? '':'so\'m'}',style: context.textStyle.regularBody.copyWith(color: context.theme.primaryColor, fontWeight: FontWeight.w700),))),
                                ],
                              ),
                              AppUtils.kGap8,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: FittedBox(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Eng arzon narx (so‘m)', style: context.textStyle.regularBody.copyWith(color: context.theme.primaryColor),),
                                          Text(state.oneProductAllSumsResponse?.all.minRegion?.nameLt ?? '- - -', style: context.textStyle.largeTitle2.copyWith(color: context.theme.primaryColor),),
                                        ],
                                      ),
                                    ),
                                  ),
                                  AppUtils.kGap12,
                                  Flexible(child: FittedBox(child: Text('${state.oneProductAllSumsResponse?.all.minSum ?? 'Narx qayd etilmagan'} ${(state.oneProductAllSumsResponse?.all.minSum == null) ? '':'so\'m'}',style: context.textStyle.regularBody.copyWith(color: Color(0xFFD3AB1D), fontWeight: FontWeight.w700),))),
                                ],
                              ),
                              AppUtils.kGap8,
                              Row(
                                children: [
                                  Flexible(
                                    child: FittedBox(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Xaridorgir narx (so‘m)',style: context.textStyle.regularBody.copyWith(color: context.theme.primaryColor),),
                                        ],
                                      ),
                                    ),
                                  ),
                                  AppUtils.kGap12,
                                  Flexible(child: FittedBox(child: Text('${state.oneProductAllSumsResponse?.all.middleSum?.toStringAsFixed(1) ??'Narx qayd etilmagan'} ${state.oneProductAllSumsResponse?.all.middleSum == null ? '':'so\'m'}',style: context.textStyle.regularBody.copyWith(color: Color(0xFF289202), fontWeight: FontWeight.w700),))),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    AppUtils.kGap12,
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Hududni talang',style: context.textStyle.regularBody.copyWith(color: context.theme.primaryColor),)
                    ),
                    SizedBox(
                      height: 50,
                      child: CustomDropDownFormFieldTwo(
                          value: dropdownRegionValue,
                          hintText: 'Viloyatni tanlang',
                          style: context.textStyle.regularBody.copyWith(color: context.theme.primaryColor, fontWeight: FontWeight.w700),
                          items: List.from(myList.map((e) => e?.nameUz).toSet().toList()),
                          onChanged: (val){
                            myList.toSet().forEach((element) {
                              if(element?.nameUz == val) {
                                soato = element?.soato ?? 0;
                                context.read<FairPriceBloc>().add(GetMarketListEvent(context: context, onSuccess: (){
                                  List<MarketListResponse> marketList = context.read<FairPriceBloc>().state.marketListResponse;

                                  setState(() {
                                    marketListDehqon = marketList.where((element) => element.marketTypeId == 1).toSet().toList();
                                    marketListYirik = marketList.where((element) => element.marketTypeId == 2).toSet().toList();
                                    marketListKichik = marketList.where((element) => element.marketTypeId == 3).toSet().toList();
                                    marketListBenzin = marketList.where((element) => element.marketTypeId == 4).toSet().toList();
                                    marketListGaz = marketList.where((element) => element.marketTypeId == 5).toSet().toList();
                                  });


                                 if(marketListDehqon.isNotEmpty){
                                   dropdownDehqonVaue = marketListDehqon.first.marketName;
                                 }
                                  if(marketListYirik.isNotEmpty){
                                    dropdownYirikValue = marketListYirik.first.marketName;
                                  }
                                  if(marketListKichik.isNotEmpty){
                                    dropdownKichikValue = marketListKichik.first.marketName;
                                  }
                                  if(marketListBenzin.isNotEmpty){
                                    dropdownBenzinValue = marketListBenzin.first.marketName;
                                  }
                                  if(marketListGaz.isNotEmpty){
                                    dropdownGazValue = marketListGaz.first.marketName;
                                  }

                                  context.read<FairPriceBloc>().add(GetOneProductAllSumsEvent(
                                      context: context,
                                      onSuccess: (){},
                                      onError: (){},
                                      productId: widget.product.id ?? 0,
                                      marketId1: marketId1,
                                      marketId2: marketId2,
                                      marketId3: marketId3,
                                      soato: soato
                                  ));
                                }, onError: (){}, keyword: '', type: '', soato: soato));
                              }
                            });
                          }
                      ),
                    ),
                    AppUtils.kGap24,
                    (widget.product.code == 'FOODS')?
                        Column(
                          children: [
                            item('Dehqon bozorlari'),
                            AppUtils.kGap12,
                            obyektType(xaridorgirNarx: state.oneProductAllSumsResponse?.market1.middleSum, minPrice: state.oneProductAllSumsResponse?.market1.minSum, maxPrice: state.oneProductAllSumsResponse?.market1.maxSum, list: marketListDehqon.toSet().toList(), isDehqon: true, isYirik: false, isKichik: false,isBenzin: false,isGaz: false),
                            AppUtils.kGap12,
                            item('Savdo shahobchalari'),
                            AppUtils.kGap12,
                            obyektType(xaridorgirNarx: state.oneProductAllSumsResponse?.market2.middleSum, minPrice: state.oneProductAllSumsResponse?.market2.minSum, maxPrice: state.oneProductAllSumsResponse?.market2.maxSum, list: marketListYirik.toSet().toList(), isDehqon: false, isYirik: true, isKichik: false,isBenzin: false,isGaz: false),
                            AppUtils.kGap12,
                            item('Savdo majmualari'),
                            AppUtils.kGap12,
                            obyektType(xaridorgirNarx: state.oneProductAllSumsResponse?.market3.middleSum, minPrice: state.oneProductAllSumsResponse?.market3.minSum, maxPrice: state.oneProductAllSumsResponse?.market3.maxSum, list: marketListKichik.toSet().toList(), isDehqon: false, isYirik: false, isKichik: true, isBenzin: false,isGaz: false),
                          ],
                        ):
                        Column(
                          children: [
                            item('Manzil'),
                            AppUtils.kGap12,
                            obyektType(xaridorgirNarx: state.oneProductAllSumsResponse?.market1.middleSum, minPrice: state.oneProductAllSumsResponse?.market1.minSum, maxPrice: state.oneProductAllSumsResponse?.market1.maxSum, list: marketListBenzin.toSet().toList(), isDehqon: false, isYirik: false, isKichik: false, isBenzin: true,isGaz: false),
                            AppUtils.kGap12,
                            item('Manzil'),
                            AppUtils.kGap12,
                            obyektType(xaridorgirNarx: state.oneProductAllSumsResponse?.market1.middleSum, minPrice: state.oneProductAllSumsResponse?.market1.minSum, maxPrice: state.oneProductAllSumsResponse?.market1.maxSum, list: marketListGaz.toSet().toList(), isDehqon: false, isYirik: false, isKichik: false, isBenzin: false,isGaz: true),
                          ],
                        ),

                    AppUtils.kGap24,
                    BlocBuilder<PharmInfoBloc,PharmInfoState>(builder: (context, state){
                      if(state.isAccessToFairPrice){
                        return Row(
                          children: [
                            Expanded(child: InkWell(child: CustomButtonWithIcon(onTap: (){
                              context.push(Routes.enterPrice, extra: {'soato': soato});
                            }, icon: AppConstants.addPriceSvg, text: 'Narx kiritish'))),
                            AppUtils.kGap24,
                            Expanded(child: InkWell(child: CustomButtonWithIcon(onTap: (){
                              context.push(Routes.addObyekt);
                            }, icon: AppConstants.objectPriceSvg, text: 'Obyekt qo\'shish'))),
                          ],
                        );
                      }else{
                        return Container();
                      }

                    }),

                    AppUtils.kGap24
                  ],
                ),
              ),
                        ),
            );
        },
      )
    );
  }

  item(String text){
    return Row(
      children: [
        Stack(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: const Color(0xFF0B731C).withOpacity(0.3),
                borderRadius: BorderRadius.circular(32),
              ),
            ),
            Positioned(
              left: 6,
              right: 6,
              top: 6,
              bottom: 6,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: const Color(0xFF0B731C),
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            )
          ],
        ),
        AppUtils.kGap12,
        Text(text,style: context.textStyle.largeTitle2.copyWith(color: context.theme.primaryColor),)
      ],
    );
  }

  obyektType({required num? xaridorgirNarx,required num? minPrice,required num? maxPrice,required List<MarketListResponse> list,required bool isDehqon,required bool isYirik,required bool isKichik,required bool isBenzin, required bool isGaz}){
    String mType = '';
    String? dropdownValue;
    if(isDehqon){
      mType = 'Bozor';
      dropdownValue = dropdownDehqonVaue;
    }else if(isYirik){
      mType = 'Market';
      dropdownValue = dropdownYirikValue;
    }else if(isKichik){
      mType = 'Market';
      dropdownValue = dropdownKichikValue;
    }else if(isBenzin){
      mType = 'Manzil';
      dropdownValue = dropdownBenzinValue;
    }else if(isGaz){
      mType = 'Manzil';
      dropdownValue = dropdownGazValue;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Manzil',style: context.textStyle.regularBody.copyWith(color: context.theme.primaryColor),)),
                  SizedBox(
                    height: 50,
                    child: CustomDropDownFormField2(
                        value: dropdownValue,
                        hintText: '${mType}ni tanlang',
                        style: context.textStyle.regularBody.copyWith(color: context.theme.primaryColor, fontWeight: FontWeight.w700),
                        items: List.from(list.map((e) => e.marketName).toSet().toList()),
                        onChanged: (val){
                          for (var element in list) {
                            if(element.marketName == val){
                              if(isDehqon){
                                marketId1 = element.id;
                              }else if(isYirik){
                                marketId2 = element.id;
                              }else if(isKichik){
                                marketId3 = element.id;
                              }
                            }
                          }
                          context.read<FairPriceBloc>().add(GetOneProductAllSumsEvent(
                              context: context,
                              onSuccess: (){},
                              onError: (){},
                              productId: widget.product.id ?? 0,
                              marketId1: marketId1,
                              marketId2: marketId2,
                              marketId3: marketId3,
                              soato: soato
                          ));
                        }
                    ),
                  ),
                ],
              ),
            ),
            AppUtils.kGap12,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Xaridorgir narx',style: context.textStyle.regularBody.copyWith(color: context.theme.primaryColor),),
                  Text('${xaridorgirNarx?.toStringAsFixed(1) ??'Narx qayd etilmagan'} ${xaridorgirNarx == null? '':'so\'m'}',style: context.textStyle.regularBody.copyWith(color: const Color(0xFF289202), fontWeight: FontWeight.w700),),
                ],
              ),
            )
          ],
        ),
        AppUtils.kGap24,
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Eng past narx',style: context.textStyle.regularBody.copyWith(color: context.theme.primaryColor),),
                  Text('${minPrice?.toStringAsFixed(1) ?? 'Narx qayd etilmagan'} ${minPrice == null? '':'so\'m'}',style: context.textStyle.regularBody.copyWith(color: const Color(0xFFD3AB1D), fontWeight: FontWeight.w700),),
                ],
              ),
            ),
            AppUtils.kGap12,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Eng yuqori narx',style: context.textStyle.regularBody.copyWith(color: context.theme.primaryColor),),
                  Text('${maxPrice?.toStringAsFixed(1) ?? 'Narx qayd etilmagan'} ${maxPrice == null? '':'so\'m'}',style:context.textStyle.regularBody.copyWith(color: context.theme.primaryColor, fontWeight: FontWeight.w700),),
                ],
              ),
            )
          ],
        ),

      ],
    );
  }

}

