import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key, required this.title, this.actions, this.textColor = const Color(0xFF0D0D26)})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  final List<Widget>? actions;
  final String title;
  final Color textColor;
  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: widget.textColor,
        ),
      ),
      title: Text(widget.title, style: context.textStyle.largeTitle2.copyWith(color: widget.textColor),),
      centerTitle: true,
      actions: widget.actions,
    );
  }
}
