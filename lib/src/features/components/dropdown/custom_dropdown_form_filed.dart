import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDropDownFormField extends StatefulWidget {
  CustomDropDownFormField({super.key,required this.value,required this.hintText, required this.items});

  String? value;
  String? hintText;
  final List<String> items;

  @override
  State<CustomDropDownFormField> createState() => _CustomDropDownFormFieldState();
}

class _CustomDropDownFormFieldState extends State<CustomDropDownFormField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: DropdownButtonFormField(
          value: widget.value,
          icon: const Icon(Icons.arrow_drop_down),
          isDense: false,
          itemHeight: 54,
          iconSize: 24,
          elevation: 16,
          dropdownColor: Colors.white,
          style: context.textStyle.regularBody,
          decoration: InputDecoration(
            fillColor: context.theme.cardColor,
            filled: true,
            hintText: widget.hintText,
            hintStyle: context.textStyle.regularBody,
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
              child: Text(
                value,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            );
          }).toList(),
          onChanged: (String? val) {
            setState(() {
              widget.value = val;
            });
          }),
    );
  }
}
