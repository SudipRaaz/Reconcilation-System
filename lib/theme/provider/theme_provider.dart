import 'package:flutter/material.dart';

import '../../core/utils/pref_utils.dart';

class ThemeProvider extends ChangeNotifier {
  themeChange(String themeType) async {
    PrefUtils().setThemeData(themeType);
    notifyListeners();
  }
}

// class ThemeProvider extends Cubit<String> {
//   ThemeProvider() : super('primary');

//   themeChange(String themeType) {
//     PrefUtils().setThemeData(themeType);
//   }
// }
