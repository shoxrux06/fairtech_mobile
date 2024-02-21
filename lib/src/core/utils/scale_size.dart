import 'dart:math';
import 'package:flutter/material.dart';

class ScaleSize {
  ScaleSize();
  static double getAdAdaptiveTextSize(BuildContext context, dynamic value) {
    // 720 is medium screen height
    return (value / 720) * MediaQuery.of(context).size.height;
  }
}