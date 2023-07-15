import 'dart:math';
import 'package:flutter/material.dart';

extension TextExtension on double {
  double textScaleFactor(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * this;
    return max(1, min(val, this));
  }
}
