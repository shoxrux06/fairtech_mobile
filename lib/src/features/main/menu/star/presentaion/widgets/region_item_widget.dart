import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/features/pdf/data/models/order_item.dart';
import 'package:flutter/material.dart';

class RegionItemWidget extends StatefulWidget {
  final List<OrderItem> orderItems;

  const RegionItemWidget({super.key, required this.orderItems});

  @override
  State<RegionItemWidget> createState() => _RegionItemWidgetState();
}

class _RegionItemWidgetState extends State<RegionItemWidget> {
  final controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      shrinkWrap: true,
      itemCount: widget.orderItems.length,
      itemBuilder: (context, index) {
        final orderItem = widget.orderItems[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          elevation: 0.75,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Text('Hudud',
                            style: context.textStyle.regularTitle2
                                .copyWith(color: context.color?.primaryText))),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(orderItem.hududlar,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: context.textStyle.regularBody),
                    )
                  ],
                ),
                AppUtils.kGap8,
                Theme(
                  data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    tilePadding: EdgeInsets.all(0),
                    title: Text('Jami otkazilgan savdolar soni',
                        style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText)
                    ),
                    trailing:Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            padding: EdgeInsets.all(4),
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                color: context.theme.primaryColor
                            ),
                            child: Center(child: Text('12', style: context.textStyle.regularTitle2.copyWith(color: Colors.white)))),
                        SizedBox(width: 12,),
                        Icon(Icons.keyboard_arrow_down_outlined)
                      ],
                    ),
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Colors.grey.shade300),
                        margin: EdgeInsets.all(4),
                        child: ExpansionTile(
                          title: Text('Shundan', style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText)),
                          children: [
                            Container(
                              decoration: BoxDecoration(color: Colors.grey.shade200),
                              margin: EdgeInsets.all(4),
                              child: ListTile(
                                title: Text('Savdo tender.mc.uz orqali o\'tkazilgan', style: context.textStyle.regularBody,),
                                trailing: Text('2',style: context.textStyle.regularTitle2.copyWith(color: Colors.black54)),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(color: Colors.grey.shade200),
                              margin: EdgeInsets.all(4),
                              child: ListTile(
                                title: Text('Savdo etender.uzex.uz orqali o\'tkazilgan',style: context.textStyle.regularBody,),
                                trailing: Text('2',style: context.textStyle.regularTitle2.copyWith(color: Colors.black54)),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(color: Colors.grey.shade200),
                              margin: EdgeInsets.all(4),
                              child: ListTile(
                                title: Text('Savdo xt.xarid.uz orqali o\'tkazilgan',style: context.textStyle.regularBody,),
                                trailing: Text('2',style: context.textStyle.regularTitle2.copyWith(color: Colors.black54)),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(color: Colors.grey.shade300),
                        margin: EdgeInsets.all(4),
                        child: ExpansionTile(
                          title: Text('1000/02-17-son topshiriq asosida o\'rganilgan savdolar', style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText)),
                          children: [
                            Container(
                              decoration: BoxDecoration(color: Colors.grey.shade200),
                              margin: EdgeInsets.all(4),
                              child: ExpansionTile(
                                title: Text('Shulardan', style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText)),
                                children: [
                                  Container(
                                    decoration: BoxDecoration(color: Colors.grey.shade100),
                                    margin: EdgeInsets.all(4),
                                    child: ExpansionTile(
                                      title: Text('Shundan', style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText)),
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(color: Colors.grey.shade200),
                                          margin: EdgeInsets.all(4),
                                          child: ListTile(
                                            title: Text('O\'rganish foizi', style: context.textStyle.regularBody,),
                                            trailing: Text('2 %',style: context.textStyle.regularTitle2.copyWith(color: Colors.black54)),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(color: Colors.grey.shade200),
                                          margin: EdgeInsets.all(4),
                                          child: ListTile(
                                            title: Text('Kamchilik aniqlangan savdolar',style: context.textStyle.regularBody,),
                                            trailing: Text('2',style: context.textStyle.regularTitle2.copyWith(color: Colors.black54)),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(color: Colors.grey.shade200),
                                          margin: EdgeInsets.all(4),
                                          child: ListTile(
                                            title: Text('O\'rganilgan xaridlarga nisbatan foizi',style: context.textStyle.regularBody,),
                                            trailing: Text('2 % ',style: context.textStyle.regularTitle2.copyWith(color: Colors.black54)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(color: Colors.grey.shade100),
                                    margin: EdgeInsets.all(4),
                                    child: ExpansionTile(
                                      title: Text('Shundan', style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText)),
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(color: Colors.grey.shade200),
                                          margin: const EdgeInsets.all(4),
                                          child: ListTile(
                                            title: Text('Savdo tender.mc.uz orqali o\'tkazilgan', style: context.textStyle.regularBody,),
                                            trailing: Text('2',style: context.textStyle.regularTitle2.copyWith(color: Colors.black54)),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(color: Colors.grey.shade200),
                                          margin: const EdgeInsets.all(4),
                                          child: ListTile(
                                            title: Text('Savdo etender.uzex.uz orqali o\'tkazilgan',style: context.textStyle.regularBody,),
                                            trailing: Text('2',style: context.textStyle.regularTitle2.copyWith(color: Colors.black54)),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(color: Colors.grey.shade200),
                                          margin: const EdgeInsets.all(4),
                                          child: ListTile(
                                            title: Text('Savdo xt.xarid.uz orqali o\'tkazilgan',style: context.textStyle.regularBody,),
                                            trailing: Text('2',style: context.textStyle.regularTitle2.copyWith(color: Colors.black54)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                AppUtils.kGap8,
                Theme(
                  data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    tilePadding: EdgeInsets.all(0),
                    title: Text('Jami organilgan savdolar soni',
                        style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText)
                    ),
                    trailing:Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            padding: EdgeInsets.all(4),
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                color: context.theme.primaryColor
                            ),
                            child: Center(child: Text('12', style: context.textStyle.regularTitle2.copyWith(color: Colors.white)))),
                        const SizedBox(width: 12,),
                        const Icon(Icons.keyboard_arrow_down_outlined)
                      ],
                    ),
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Colors.grey.shade300),
                        margin: EdgeInsets.all(4),
                        child: ListTile(
                          title: Text('Kamchilik aniqlangan savdolar',style: context.textStyle.regularBody,),
                          trailing: Text('2',style: context.textStyle.regularTitle2.copyWith(color: Colors.black54)),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(color: Colors.grey.shade300),
                        margin: EdgeInsets.all(4),
                        child: ListTile(
                          title: Text('O\'rganilgan xaridlarga nisbatan foizi',style: context.textStyle.regularBody,),
                          trailing: Text('2',style: context.textStyle.regularTitle2.copyWith(color: Colors.black54)),
                        ),
                      ),
                    ],
                  ),
                ),
                AppUtils.kGap8,
                Theme(
                  data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    tilePadding: EdgeInsets.all(0),
                    title: Text('JKPI-tizim bo\'yicha to\'plangan jami ballar',
                        style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText)
                    ),
                    trailing:Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            padding: EdgeInsets.all(4),
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                color: context.theme.primaryColor
                            ),
                            child: Center(child: Text('12', style: context.textStyle.regularTitle2.copyWith(color: Colors.white)))),
                        const SizedBox(width: 12,),
                        const Icon(Icons.keyboard_arrow_down_outlined)
                      ],
                    ),
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Colors.grey.shade300),
                        margin: EdgeInsets.all(4),
                        child: ListTile(
                          title: Text('1000/02-17-son topshiriq asosida xaridlarni o\'rganish hajmiga nisbatan berilgan ball (eng yuqori ball - 3 ball',style: context.textStyle.regularBody,),
                          trailing: Text('2',style: context.textStyle.regularTitle2.copyWith(color: Colors.black54)),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(color: Colors.grey.shade300),
                        margin: EdgeInsets.all(4),
                        child: ListTile(
                          title: Text('Xaridlarni o\'rganish hajmiga nisbatan berilgan ball (eng yuqori ball - 4 ball)',style: context.textStyle.regularBody,),
                          trailing: Text('2',style: context.textStyle.regularTitle2.copyWith(color: Colors.black54)),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(color: Colors.grey.shade300),
                        margin: EdgeInsets.all(4),
                        child: ListTile(
                          title: Text('Xaridlarni o\'rganish natijasida kamchiliklar aniqlanganlik uchun berilgan ball (eng yuqori ball - 5 ball)',style: context.textStyle.regularBody,),
                          trailing: Text('2',style: context.textStyle.regularTitle2.copyWith(color: Colors.black54)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
