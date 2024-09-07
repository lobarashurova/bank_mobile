import 'package:bank_mobile/data/module/injection.dart';
import 'package:bank_mobile/data/storage/storage.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/presentation/auth/login/login_page.dart';
import 'package:bank_mobile/presentation/auth/login/provider/login_provider.dart';
import 'package:bank_mobile/presentation/main/main/main_page.dart';
import 'package:bank_mobile/presentation/main/management/employee_providers/all_employees_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await configureDependencies();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => LoginProvider()),
    ChangeNotifierProvider(create: (context) => AllEmployeesProvider()),
    // ChangeNotifierProvider(create: (context) => HomeProvider()),
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  bool _isLocked = false;
  final storage = getIt<Storage>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _unlockApp() {
    setState(() {
      _isLocked = false;
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      setState(() {
        _isLocked = true;
      });
    } else if (state == AppLifecycleState.resumed) {
      setState(() {
        _isLocked = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bank Mobile',
      theme: ThemeData(
          navigationBarTheme: NavigationBarThemeData(
              backgroundColor: context.colors.scaffoldColor),
          appBarTheme: AppBarTheme(
              backgroundColor: context.colors.scaffoldColor, elevation: 0),
          textTheme: TextTheme(
              displaySmall: TextStyle(color: context.colors.onPrimary)),
          useMaterial3: false,
          scaffoldBackgroundColor: context.colors.scaffoldColor),
      home:
          storage.tokens.call() == null ? const LoginPage() : const MainPage(),
    );
  }
}
