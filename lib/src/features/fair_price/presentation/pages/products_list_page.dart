// import 'dart:async';
// import 'package:fairtech_mobile/src/core/extension/extension.dart';
// import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
// import 'package:fairtech_mobile/src/features/auth/sign_in/presentation/components/input/custom_text_field.dart';
// import 'package:fairtech_mobile/src/features/components/app_bar/custom_app_bar.dart';
// import 'package:fairtech_mobile/src/features/components/bottom_sheet/custom_bottom_sheet.dart';
// import 'package:fairtech_mobile/src/features/components/buttons/custom_button_without_gradient.dart';
// import 'package:fairtech_mobile/src/features/components/input/money_formatter.dart';
// import 'package:fairtech_mobile/src/features/components/loading_widgets/modal_progress_hud.dart';
// import 'package:fairtech_mobile/src/features/components/snackbar/app_snackbar.dart';
// import 'package:fairtech_mobile/src/features/fair_price/domain/entity/product_price_history_list_entity.dart';
// import 'package:fairtech_mobile/src/features/fair_price/presentation/bloc/fair_price_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
// import 'package:go_router/go_router.dart';
// import 'package:intl/intl.dart';
//
// class ProductsListPage extends StatefulWidget {
//   const ProductsListPage({super.key, required this.marketId, required this.isMarketEmployee});
//
//   final int marketId;
//   final bool isMarketEmployee;
//
//   @override
//   State<ProductsListPage> createState() => _ProductsListPageState();
// }
//
// class _ProductsListPageState extends State<ProductsListPage> {
//   bool isKeyboardVisible = false;
//   final maxPriceController = TextEditingController();
//   final middlePriceController = TextEditingController();
//   final minPriceController = TextEditingController();
//   final controller2 = TextEditingController(text: DateFormat('dd-MM-yyyy').format(DateTime.now()));
//
//   late StreamSubscription<bool> keyboardSubscription;
//
//   @override
//   void initState() {
//     context.read<FairPriceBloc>().add(GetProductPriceHistoryEvent(context: context, keyword: '', code: 'FOODS', onSuccess: (){}, onError: (){}));
//
//     if(widget.isMarketEmployee){
//       context.read<FairPriceBloc>().add(GetMarketEmployeeProductListEvent(context: context));
//     }else{
//       context.read<FairPriceBloc>().add(GetMarketProductListEvent(context: context, code: 'FOODS'));
//     }
//     var keyboardVisibilityController = KeyboardVisibilityController();
//     keyboardSubscription = keyboardVisibilityController.onChange.listen((bool visible) {
//       isKeyboardVisible = visible;
//     });
//     super.initState();
//   }
//
//   modalWidget({ScrollController? controller, int? productId, int? marketId}){
//     return  Padding(
//       padding: EdgeInsets.only(
//           left: 12,
//           right: 12,
//           top: 12,
//           bottom: isKeyboardVisible? 0:MediaQuery.of(context).viewInsets.bottom
//       ),
//       child: SingleChildScrollView(
//         controller: controller,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             CustomTextField(
//               controller: controller2,
//               titleText: 'Sana',
//               enabled: false,
//               hintText: 'Minimal narx',
//             ),
//             AppUtils.kGap12,
//             CustomTextField(
//               inputFormatters: [
//                 MoneyTextInputFormatter()
//               ],
//               controller: minPriceController,
//               titleText: 'Minimal narx',
//               hintText: 'Minimal narxni kiriting',
//               keyboardType: TextInputType.number,
//               suffixText: 'so\'m',
//             ),
//             AppUtils.kGap12,
//             CustomTextField(
//               inputFormatters: [
//                 MoneyTextInputFormatter()
//               ],
//               controller: maxPriceController,
//               titleText: 'Maksimal narx',
//               hintText: 'Maksimal narxni kiriting',
//               keyboardType: TextInputType.number,
//               suffixText: 'so\'m',
//             ),
//             AppUtils.kGap12,
//             CustomTextField(
//               inputFormatters: [
//                 MoneyTextInputFormatter()
//               ],
//               controller: middlePriceController,
//               titleText: 'Xaridorgir narx',
//               hintText: 'Xaridorgir narxni kiriting',
//               keyboardType: TextInputType.number,
//               suffixText: 'so\'m',
//             ),
//             AppUtils.kGap24,
//             CustomButtonWithoutGradient(
//               onTap: () {
//                 int minPrice = int.parse(minPriceController.text.replaceAll(' ', ''));
//                 int maxPrice = int.parse(maxPriceController.text.replaceAll(' ', ''));
//                 int middlePrice = int.parse(middlePriceController.text.replaceAll(' ', ''));
//                 if(minPriceController.text.isEmpty || maxPriceController.text.isEmpty){
//                   AppSnackBar.showWarningSnackBar(context, 'Iltimos barcha maydonlarni to\'ldiring');
//                 }else if(minPrice >= maxPrice){
//                   AppSnackBar.showWarningSnackBar(context, '"Minimal narx" "Maksimal narx"ga nisbatan katta yoki teng bo\'lmasligi lozim');
//                 }else if(middlePrice < minPrice || middlePrice > maxPrice){
//                   AppSnackBar.showWarningSnackBar(context, '"Xaridorgir narx" "Maksimal narx" va "Minimal narx" oralig\'ida bo\'lishi lozim');
//                 }else{
//                   context.pop();
//                   context.read<FairPriceBloc>().add(
//                     CreateProductPriceEvent(
//                         onSuccess: (){
//                           minPriceController.text = '';
//                           maxPriceController.text = '';
//                           middlePriceController.text = '';
//                           AppSnackBar.showSuccessSnackBar(context, '','Muaffaqiyatli saqlandi!');
//                         },
//                         onError: () {
//                           AppSnackBar.showErrorSnackBar(context, '','Xatolik yuz berdi!');
//                         },
//                         context: context,
//                         maxPrice: double.tryParse(maxPriceController.text.replaceAll(' ', ''))??0.0,
//                         middlePrice: double.tryParse(middlePriceController.text.replaceAll(' ', ''))??0.0,
//                         minPrice: double.tryParse(minPriceController.text.replaceAll(' ', ''))??0.0,
//                         productId: productId ??0,
//                         marketId: (widget.marketId == 0)? marketId??0: widget.marketId,
//                         isMarketEmployee: widget.isMarketEmployee
//                     ),
//                   );
//                 }
//               },
//               text: 'Saqlash',
//               textColor: Colors.white,
//             ),
//             AppUtils.kGap24,
//           ],
//         ),
//       ),
//     );
//   }
//
//   productPriceHistoryModal({ScrollController? controller, required List<ProductPriceHistoryElement> priceItemList, required String productName}){
//     return  Padding(
//       padding: const EdgeInsets.only(
//           left: 12,
//           right: 12,
//           top: 12,
//           bottom: 12
//       ),
//       child: SingleChildScrollView(
//         controller: controller,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: priceItemList.isEmpty?[
//             Text(productName),
//             SizedBox(height: 24,),
//             Center(
//               child: Text('Ushbu mahsulot uchun narx kiritilmagan',style: context.textStyle.regularBody,),
//             ),
//             SizedBox(height: 24,),
//           ]: [
//             Text('Un(import)'),
//             ...priceItemList.map((price) => ListTile(
//               title: Text('Minimal narx:${price.minPrice} so\'m',style: context.textStyle.regularBody,),
//               subtitle: Text('Minimal narx:${price.maxPrice} so\'m',style: context.textStyle.regularBody,),
//               trailing: Text('${price.date}',style: context.textStyle.regularBody,),
//             ))
//           ],
//         ),
//       ),
//     );
//   }
//
//   chooseModal({required VoidCallback onTapSet, required VoidCallback onTapHistory}){
//     return Padding(
//         padding: EdgeInsets.all(12),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//         children: [
//           CustomButtonWithoutGradient(onTap: onTapSet, text: 'Narx kiritish', textColor: Colors.white,),
//           AppUtils.kGap12,
//           CustomButtonWithoutGradient(onTap: onTapHistory, text: 'Narx tarixini ko\'rish',textColor: Colors.white,),
//           AppUtils.kGap24,
//       ],
//     ),
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<FairPriceBloc, FairPriceState>(builder: (context, state) {
//       print('marketId **** ${state.marketProductListResponse?.marketId} *****');
//       return Scaffold(
//         appBar: const CustomAppBar(title: 'Tovarlar'),
//         body: ModalProgressHUD(
//           inAsyncCall: state.marketProductListResponse == null || state.isCreatingProductPrice,
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.only(
//                 left: 12,
//                 right: 12,
//                 bottom: 16
//               ),
//               child: Column(
//                 children: [
//                   ...?state.marketProductListResponse?.children.map((item) {
//                     print('marketId children empty **** ${item.marketId} *****');
//                     print('Product Id **** ${item.id} *****');
//                     if (item.children.isEmpty) {
//                       return InkWell(
//                         onTap: () {
//                           customModalBottomSheet(
//                               isScrollControlled:isKeyboardVisible? true: false,
//                               context: context,
//                               builder: (_, controller){
//                                 return chooseModal(onTapSet: (){
//                                   context.pop();
//                                   customModalBottomSheet(
//                                       isScrollControlled:isKeyboardVisible? true: false,
//                                       context: context,
//                                       builder: (_, controller){
//                                     return modalWidget(controller: controller, productId: item.id, marketId: state.marketProductListResponse?.marketId);
//                                   });
//                                 }, onTapHistory: (){
//                                   context.pop();
//                                   customModalBottomSheet(
//                                       isScrollControlled:isKeyboardVisible? true: false,
//                                       context: context,
//                                       builder: (_, controller){
//                                         return productPriceHistoryModal(
//                                             controller: controller,
//                                             priceItemList: state.productPriceHistoryListEntity?.list.where((productPriceItem) => productPriceItem.productId == item.id).toList()??[],
//                                             productName: item.nameLt
//                                         );
//                                       });
//                                 });
//                               });
//
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12),
//                               border: Border.all(
//                                 color: Colors.grey.shade200,
//                               )),
//                           margin: const EdgeInsets.only(top: 12),
//                           child: ListTile(
//                             title: Text(
//                               item.nameLt,
//                               style: context.textStyle.largeTitle2.copyWith(fontSize: 16),
//                             ),
//                           ),
//                         ),
//                       );
//                     }
//                     else{
//                       return Theme(
//                         data: ThemeData(dividerColor: Colors.transparent),
//                         child: Container(
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12),
//                               border: Border.all(
//                                 color: Colors.grey.shade200,
//                               )),
//                           margin: const EdgeInsets.only(top: 12),
//                           child: ExpansionTile(
//                             title: Text(
//                               item.nameLt,
//                               style: context.textStyle.largeTitle2.copyWith(fontSize: 16),
//                             ),
//                             children: [
//                               ListView.builder(
//                                   shrinkWrap: true,
//                                   physics: const NeverScrollableScrollPhysics(),
//                                   itemCount: item.children.length,
//                                   itemBuilder: (ctx,index) {
//                                     return InkWell(
//                                       onTap: () {
//                                         customModalBottomSheet(
//                                             isScrollControlled:isKeyboardVisible? true: false,
//                                             context: context,
//                                             builder: (_, controller){
//                                               return chooseModal(onTapSet: (){
//                                                 context.pop();
//                                                 customModalBottomSheet(
//                                                     isScrollControlled:isKeyboardVisible? true: false,
//                                                     context: context,
//                                                     builder: (_, controller){
//                                                   return modalWidget(controller: controller,productId: item.id, marketId: state.marketProductListResponse?.marketId);
//                                                 });
//                                               }, onTapHistory: (){
//
//                                               });
//                                             });
//                                       },
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.circular(12),
//                                             border: Border.all(
//                                               color: Colors.grey.shade200,
//                                             )),
//                                         margin: EdgeInsets.only(
//                                             left: 12,
//                                             right: 12,
//                                             top: 12,
//                                             bottom: (index == item.children.length)?12: 0
//                                         ),
//                                         child: ListTile(
//                                           title: Text(item.children[index].nameLt, style: context.textStyle.bodyTitle2.copyWith(fontSize: 16),),
//                                         ),
//                                       ),
//                                     );
//                                   }),
//                             ],
//                           ),
//                         ),
//                       );
//                     }
//                   })
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//     });
//   }
//
//   @override
//   void dispose() {
//     keyboardSubscription.cancel();
//     super.dispose();
//   }
// }
