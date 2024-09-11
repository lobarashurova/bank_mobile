import 'package:bank_mobile/data/module/injection.dart';
import 'package:bank_mobile/data/storage/storage.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/presentation/auth/login/login_page.dart';
import 'package:bank_mobile/presentation/auth/login/provider/login_provider.dart';
import 'package:bank_mobile/presentation/main/ai/ai_provider.dart';
import 'package:bank_mobile/presentation/main/home/providers/home_provider.dart';
import 'package:bank_mobile/presentation/main/home/providers/news_notifier.dart';
import 'package:bank_mobile/presentation/main/management/employee_providers/all_employees_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'presentation/main/lock/lock_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await configureDependencies();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => LoginProvider()),
    ChangeNotifierProvider(create: (context) => AllEmployeesProvider()),
    ChangeNotifierProvider(create: (context) => HomeProvider()),
    ChangeNotifierProvider(create: (context) => NewsProvider()),
    ChangeNotifierProvider(create: (context) => AiProvider()),
    // ChangeNotifierProvider(create: (context) => HomeProvider()),
  ], child: const MyApp()));
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

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      setState(() {
        _isLocked = true;
      });
    } else if (state == AppLifecycleState.resumed) {
      if (_isLocked) {
        _showLockScreen();
      }
    }
  }

  void _showLockScreen() async {
    await  navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (context) => LockScreen()),
    );
    setState(() {
      _isLocked = false;
    });
  }

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
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
      home: storage.tokens.call() == null ? const LoginPage() : LockScreen(),
    );
  }
}
