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

  Color get darkColor {
    switch (this) {
      case TagColor.blue:
        return nightBlueDarker;
      case TagColor.green:
        return nightGreenDarker;
      case TagColor.orange:
        return nightOrangeDarker;
      case TagColor.red:
        return nightRedDarker;
    }
  }

  Color get shadowColor {
    switch (this) {
      case TagColor.blue:
        return nightBlueShadow;
      case TagColor.green:
        return nightGreenShadow;
      case TagColor.orange:
        return nightOrangeShadow;
      case TagColor.red:
        return nightRedShadow;
    }
  }
}
