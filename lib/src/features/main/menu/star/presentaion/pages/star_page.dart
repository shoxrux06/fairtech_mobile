import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:fairtech_mobile/src/features/components/bottom_sheet/custom_bottom_sheet.dart';
import 'package:fairtech_mobile/src/features/components/buttons/custom_button_without_gradient.dart';
import 'package:fairtech_mobile/src/features/main/menu/profile/data/local_data.dart';
import 'package:fairtech_mobile/src/features/main/menu/star/presentaion/bloc/star_bloc.dart';
import 'package:fairtech_mobile/src/features/main/menu/star/presentaion/widgets/bottom_filter_region.dart';
import 'package:fairtech_mobile/src/features/pdf/data/models/order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StarPage extends StatefulWidget {
  const StarPage({super.key, required this.orderItem});

  final OrderItem? orderItem;

  @override
  State<StarPage> createState() => _StarPageState();
}

class _StarPageState extends State<StarPage> {
  String titleText = 'QO\'MITA VA UNING HUDUDIY ORGANLARINING DAVLAT'
      ' BUYURTMASI BO\'YICHA O\'TKAZILGAN TANLOV (TENDER) SAVDOLARINI O\'RGANISH SOHASINING '
      'SAMARADORLIGI VA ULARNI BAHOLASH NATIJALARIGA DOIR MA\'LUMOTLAR';

  String regionValue = '';
  List<String> items = [];
  bool checkboxValue1 = true;
  bool checkboxValue2 = true;
  bool checkboxValue3 = true;

  bool resultIsNull = false;

  dynamic fetchedResult;

  @override
  void initState() {
    print('INIT State ***********');
    regionValue = LocalData.orderItems.first.hududlar;
    for (var element in LocalData.orderItems) {
      items.add(element.hududlar);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StarBloc, StarState>(
      builder: (context, state) {
        if (state.orderItem?.isNotEmpty ?? false) {
          OrderItem? orderItem;
          state.orderItem?.forEach((element) {
            if(element.hududlar == state.value){
              orderItem = element;
            }
          });
          return SizedBox(
            width: Responsive.width(100, context),
            child: Card(
              color: Colors.white,
              elevation: 0.75,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(state.value,style: context.textStyle.largeTitle2),
                    state.filter1?Row(
                      children: [
                        Expanded(child: Text('Jami o\'tkazilgan savdolar soni', style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText))),
                        AppUtils.kGap24,
                        Text(orderItem?.jamiTrade.toString()??'',style: context.textStyle.regularTitle2.copyWith(color: Colors.black54)),
                      ],
                    ): Container(),
                    AppUtils.kGap24,
                    state.filter2?Row(
                      children: [
                        Expanded(child: Text('Jami o\'rganilgan savdolar soni', style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText))),
                        AppUtils.kGap24,
                        Text(orderItem?.jamiOrganilganTradeNumbers.toString()??'',style: context.textStyle.regularTitle2.copyWith(color: Colors.black54)),
                      ],
                    ): Container(),
                    AppUtils.kGap24,
                    state.filter3?Row(
                      children: [
                        Expanded(child: Text('KPI-tizim bo\'yicha to\'plangan jami ballar', style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText))),
                        AppUtils.kGap24,
                        Text(orderItem?.kpiTizimBoyichaToplanganJamiBallar.toString()??'',style: context.textStyle.regularTitle2.copyWith(color: Colors.black54)),
                      ],
                    ): Container(),
                  ],
                ),
              ),
            ),
          );
        } else {
          return SafeArea(
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      titleText,
                      style: context.textStyle.regularTitle2.copyWith(
                        color: context.color?.primaryText,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    AppUtils.kGap24,
                    SizedBox(
                      width: Responsive.width(50, context),
                      child: Builder(
                        builder: (builderContext) {
                          return CustomButtonWithoutGradient(
                            onTap: () {
                              customModalBottomSheet(
                                context: context,
                                builder: (_, controller) =>
                                    BlocProvider.value(
                                      value: builderContext.read<StarBloc>(),
                                      child: BottomFilterRegion(
                                        items: items,
                                        checkboxValue1: checkboxValue1,
                                        checkboxValue2: checkboxValue2,
                                        checkboxValue3: checkboxValue3,
                                      ),
                                    ),
                              );
                            },
                            text: 'Filter',
                            textColor: context.color?.white,
                          );
                        }
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
