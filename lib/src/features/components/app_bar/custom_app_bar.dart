import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key, required this.title, this.actions})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  final List<Widget>? actions;
  final String title;
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
        icon: const Icon(
          Icons.arrow_back_ios,
        ),
      ),
      title: Text(widget.title, style: context.textStyle.largeTitle2,),
      centerTitle: true,
      actions: widget.actions,
    );
  }
}
