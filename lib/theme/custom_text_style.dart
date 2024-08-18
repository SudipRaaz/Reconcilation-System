import 'package:flutter/material.dart';
import 'package:ndpc_gokyo/theme/theme_helper.dart';

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }
}

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.
class CustomTextStyles {
  // Body text style
  static get bodyMediumBluegray300 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray300,
      );
// Title text style
  static get titleSmallInterGreen500 =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.green500,
      );
}
