import 'package:erevho/core/themes/colors.dart';
import 'package:erevho/domain/entities/dream/tag_entity.dart';
import 'package:flutter/material.dart';

extension TagColorExtension on TagColor {
  Color get color {
    switch (this) {
      case TagColor.blue:
        return nightBlue;
      case TagColor.green:
        return nightGreen;
      case TagColor.orange:
        return nightOrange;
      case TagColor.red:
        return nightRed;
    }
  }
}
