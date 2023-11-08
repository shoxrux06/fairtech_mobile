import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    super.key,
    required this.currentIndex,
    this.onTap,
    this.onScanTap,
  });

  final int currentIndex;
  final ValueChanged<int>? onTap;
  final VoidCallback? onScanTap;

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.4),
          blurRadius: 10,
          spreadRadius: 1,
          offset: Offset(0, -1),
        ),
      ],
    ),
    child: BottomAppBar(
      elevation: 0,
      height: kBottomNavigationBarHeight,
      shape: const CircularNotchedRectangle(),
      clipBehavior: Clip.antiAlias,
      notchMargin: 0.01,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomMenuItem(
            onTap: () {
              onTap?.call(0);
            },
            isSelected: currentIndex == 0,
            label: '',
            // label: context.tr('home'),
            icon: AppConstants.homeSvg,
          ),
          BottomMenuItem(
            onTap: () {
              onTap?.call(1);
            },
            isSelected: currentIndex == 1,
            label: '',
            // label: context.tr('appeals'),
            icon: AppConstants.journalSvg,
          ),
          BottomMenuItem(
            onTap: () {
              onTap?.call(2);
            },
            isSelected: currentIndex == 2,
            currentIndex: 2,
            label: '',
            // label: context.tr('services'),
            icon: AppConstants.scannerSvg,
          ),
          BottomMenuItem(
            onTap: () {
              onTap?.call(3);
            },
            isSelected: currentIndex == 3,
            label: '',
            // label: context.tr('services'),
            icon: AppConstants.educationSvg,
          ),
          BottomMenuItem(
            onTap: () {
              onTap?.call(4);
            },
            isSelected: currentIndex == 4,
            label: '',
            // label: context.tr('more'),
            icon: AppConstants.moreSvg,
          ),
        ],
      ),
    ),
  );
}

class BottomMenuItem extends StatelessWidget {
  const BottomMenuItem({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
    this.currentIndex,
    required this.isSelected,
  });

  final String icon;
  final String label;
  final VoidCallback? onTap;
  final int? currentIndex;
  final bool isSelected;

  @override
  Widget build(BuildContext context) => Expanded(
    child: Semantics(
      child: InkResponse(
        onTap: onTap,
        customBorder: const CircleBorder(),
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: currentIndex == 2 ? Container(): SvgPicture.asset(
          icon,
          color: isSelected
              ? Colors.black
              : Colors.black.withOpacity(0.5)
        ),
      ),
    ),
  );
}
