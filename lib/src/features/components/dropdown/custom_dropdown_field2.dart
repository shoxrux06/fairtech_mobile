import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:flutter/material.dart';

class CustomDropDownFormField2 extends StatefulWidget {
  CustomDropDownFormField2({super.key,required this.value,required this.hintText, required this.items, required this.onChanged, this.style, this.isMultiple = false, this.isType = false});

  String? value;
  String? hintText;
  bool? isMultiple;
  bool? isType;
  TextStyle? style;
  final List<String> items;
  final Function(String?)? onChanged;

  @override
  State<CustomDropDownFormField2> createState() => _CustomDropDownFormField2State();
}

class _CustomDropDownFormField2State extends State<CustomDropDownFormField2> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: DropdownButtonFormField2(
          value: widget.value,
          isDense: false,
          isExpanded: true,
          menuItemStyleData: MenuItemStyleData(
            height: (widget.isMultiple?? false)? 100: 50,
            customHeights:((widget.isMultiple?? false) && (widget.isType?? false))? [50, 60, 50, 80,80]: null
          ),
          style: widget.style ?? context.textStyle.regularBody,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            fillColor: context.theme.cardColor,
            filled: true,
            hintText: widget.hintText,
            hintStyle: context.textStyle.regularBody,
            hintMaxLines: 2,
            // prefixIcon: const Icon(Icons.not_listed_location_outlined),
            border: OutlineInputBorder(
              borderRadius:
              const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                  color: context.theme.primaryColor, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius:
              const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                  color: context.theme.primaryColor, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius:
              const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                  color: context.theme.primaryColor, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius:
              const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                  color: context.theme.primaryColor, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius:
              const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                  color: context.theme.primaryColor, width: 1),
            ),
          ),
          items: widget.items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                value,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            );
          }).toList(),
          onChanged: widget.onChanged
      ),
    );
  }
}
