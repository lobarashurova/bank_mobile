import 'package:bank_mobile/app/common/colors/default_theme_colors.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUp() {
  getIt.registerSingleton<DefaultThemeColors>(DefaultThemeColors());
}
