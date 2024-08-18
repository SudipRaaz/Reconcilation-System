import 'package:flutter/material.dart';
import 'package:ndpc_gokyo/core/utils/size_utils.dart';

import 'theme_helper.dart';

class AppDecoration {
  // Outline decorations
  static BoxDecoration get outlineBlueGray => BoxDecoration(
        border: Border.all(
          color: appTheme.blueGray100,
          width: 1.h,
        ),
      );
}

class BorderRadiusStyle {
  // Rounded borders
  static BorderRadius get roundedBorder4 => BorderRadius.circular(
        4.h,
      );
}
