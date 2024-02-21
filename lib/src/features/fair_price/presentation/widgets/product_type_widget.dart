import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fairtech_mobile/src/config/router/app_routes.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/features/fair_price/domain/entity/market_product_list_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/fair_price_bloc.dart';

class ProductTypeWidget extends StatefulWidget {
  const ProductTypeWidget({super.key, required this.selectedIndex});

  final int selectedIndex;

  @override
  State<ProductTypeWidget> createState() => _ProductTypeWidgetState();
}

class _ProductTypeWidgetState extends State<ProductTypeWidget> {
  final controller = TextEditingController();
  bool _isSelected = false;
  String? dropdownVal;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FairPriceBloc, FairPriceState>(
        listener: (context, state) {},
        builder: (context, state) {
          print('BBBBB **${state.marketProductEntity?.children}**');
          return SingleChildScrollView(
            child: Column(
              children: [
                ...?state.marketProductEntity?.children.map((e) {
                  if (e.children.isEmpty) {
                    return InkWell(
                      onTap: () {
                        state.marketProductEntity?.children.forEach((element) {
                          if (element.nameLt == e.nameLt) {
                            context.push(Routes.productDetail,
                                extra: {'product': element});
                          }
                        });
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.grey.shade200,
                              )),
                          margin: const EdgeInsets.only(top: 12),
                          child: ListTile(
                            title: Text(e.nameLt ?? ''),
                          )),
                    );
                  } else {
                    return Theme(
                      data: ThemeData(dividerColor: Colors.transparent),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.grey.shade200,
                            )),
                        margin: const EdgeInsets.only(top: 12),
                        child: ExpansionTile(
                          onExpansionChanged: (isSelected) {
                            setState(() {
                              _isSelected = isSelected;
                            });
                          },
                          trailing: (e.children.isEmpty)
                              ? const SizedBox()
                              : Icon(_isSelected
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down),
                          title: Text(
                            '${e.nameLt}',
                            style: context.textStyle.bodyTitle2.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          children: [
                            ...e.children.map(
                              (e) => InkWell(
                                onTap: () {
                                  context.push(Routes.productDetail, extra: {'product': e});
                                },
                                child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 12),
                                    child: ListTile(
                                      title: Text(
                                        '${e.nameLt}',
                                        style: context.textStyle.bodyTitle2
                                            .copyWith(fontSize: 14),
                                      ),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                })
              ],
            ),
          );
        });
  }
}
