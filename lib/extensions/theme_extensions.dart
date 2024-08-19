import 'package:bank_mobile/app/common/colors/default_theme_colors.dart';
import 'package:bank_mobile/app/injection/injecttion.dart';
import 'package:flutter/cupertino.dart';

extension ThemeContextExtensions on BuildContext {
  DefaultThemeColors get colors => getIt<DefaultThemeColors>();
}
