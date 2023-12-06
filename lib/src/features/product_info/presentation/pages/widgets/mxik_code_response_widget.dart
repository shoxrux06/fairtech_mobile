import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/features/product_info/data/models/mxik_and_shtrix_code_response.dart';
import 'package:flutter/material.dart';


class MxikCodeResponseWidget extends StatefulWidget {
  final MxikAndShtrixCodeResponse? mxikAndShtrixCodeResponse;

  const MxikCodeResponseWidget({
    super.key,
    required this.mxikAndShtrixCodeResponse
  });

  @override
  State<MxikCodeResponseWidget> createState() => _MxikCodeResponseWidgetState();
}

class _MxikCodeResponseWidgetState extends State<MxikCodeResponseWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.black54,
              width: 1
          ),
          borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Text('Mahsulot nomi',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText))),
              const SizedBox(width: 12,),
              Expanded(
                flex: 2,
                child: Text('${widget.mxikAndShtrixCodeResponse?.data.mxikInfo.subPositionName}', maxLines: 2,overflow: TextOverflow.ellipsis,style: context.textStyle.regularBody),
              )
            ],
          ),
          AppUtils.kGap8,
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Text('Mxik',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText))),
              const SizedBox(width: 12,),
              Expanded(
                flex: 2,
                child: Text('${widget.mxikAndShtrixCodeResponse?.data.mxikCode}', maxLines: 2,overflow: TextOverflow.ellipsis,style: context.textStyle.regularBody),
              )
            ],
          ),
          AppUtils.kGap8,
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Text('Shtrix kod',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText))
              ),
              const SizedBox(width: 12,),
              Expanded(
                  flex: 2,
                  child: Text('${widget.mxikAndShtrixCodeResponse?.data.mxikInfo.internationalCode}',style: context.textStyle.regularBody))
            ],
          ),
        ],
      ),
    );
  }
}
