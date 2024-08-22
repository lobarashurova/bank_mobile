import 'package:bank_mobile/app/injection/injecttion.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/presentation/auth/start/begin_page.dart';
import 'package:bank_mobile/presentation/main/main/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bank Mobile',
      theme: ThemeData(
        navigationBarTheme: NavigationBarThemeData(backgroundColor: context.colors.scaffoldColor),
          appBarTheme: AppBarTheme(
              backgroundColor: context.colors.scaffoldColor, elevation: 0),
          useMaterial3: false,
          scaffoldBackgroundColor: context.colors.scaffoldColor),
      home: MainPage(),
    );
  }
}
