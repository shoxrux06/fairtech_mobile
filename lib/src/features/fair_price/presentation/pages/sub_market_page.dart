import 'package:fairtech_mobile/src/config/router/app_routes.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/features/components/app_bar/custom_app_bar.dart';
import 'package:fairtech_mobile/src/features/fair_price/presentation/bloc/fair_price_bloc.dart';
import 'package:fairtech_mobile/src/features/fair_price/presentation/pages/search_locations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SubMarketPage extends StatefulWidget {
  const SubMarketPage({super.key, required this.type});

  final String type;

  @override
  State<SubMarketPage> createState() => _SubMarketPageState();
}

class _SubMarketPageState extends State<SubMarketPage> {
  int? marketId;
  @override
  void initState() {
    context.read<FairPriceBloc>().add(GetMarketListEvent(context: context, keyword: '', type: widget.type));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FairPriceBloc, FairPriceState>(
      listener: (context,state){
        if (state.marketListError) {
          context.pop();
        }else{
          print('Not error');
        }
      },
      builder: (context, state) {
        if (state.marketListLoading) {
          return const Scaffold(
            body:Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return  Scaffold(
            appBar: CustomAppBar(
              title: 'Market',
              actions: [
                (state.marketListResponse?.list.isEmpty?? false)? Container():IconButton(
                    onPressed: () {
                      showSearch(
                        context: context,
                        delegate: SearchLocations(
                          allList: state.marketListResponse?.list??[],
                          suggestionList:state.marketListResponse?.list??[],
                        ),
                      );
                    },
                    icon: const Icon(Icons.search, size: 28,)),
                AppUtils.kGap12,
              ],
            ),
            body:(state.marketListResponse?.list.isEmpty ?? false)? Center(child: Text('Hech qanday ma\'lumot topilmadi',style:context.textStyle.regularTitle2.copyWith(color: Colors.black),),):SingleChildScrollView(
              child: Column(
                children: [
                  AppUtils.kGap12,
                  ...?state.marketListResponse?.list.map((market) => Padding(
                    padding:
                    const EdgeInsets.only(left: 12, right: 12, bottom: 12),
                    child: InkWell(
                      onTap: (){
                        context.push(Routes.fairPriceProductList, extra: {"marketId": market.id,'isMarketEmployee': false});
                      },
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                        ),
                        tileColor: Colors.grey.shade300,
                        title: Text(market.marketName,style: context.textStyle.largeTitle2.copyWith(fontSize: 14),),
                      ),
                    ),
                  ))
                ],
              ),
            )
        );
      },
    );
  }
}
