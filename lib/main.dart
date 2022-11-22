import 'package:erp/auth/presentation/screens/login_screen.dart';
import 'package:erp/home/presentation/screens/home_screen.dart';
import 'package:erp/utils/routers/routers.dart';
import 'package:erp/utils/theme/reusable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MaterialApp.router(
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("ar", "AE"),
      ],
      locale: const Locale("ar", "AE"),
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        //primarySwatch: Colors.teal,
        // colorSchemeSeed: const Color(0xff6750a4),
        colorSchemeSeed: Colors.blueAccent,
        textTheme: mainTextTheme,
        inputDecorationTheme: theme.inputDecorationTheme.copyWith(
          border: const OutlineInputBorder(),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
