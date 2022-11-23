import 'package:erp/auth/presentation/screens/login_screen.dart';
import 'package:erp/home/presentation/screens/home_screen.dart';
import 'package:erp/utils/routers/routers.dart';
import 'package:erp/utils/theme/colors.dart';
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
    final mainColorScheme = ColorScheme.fromSeed(seedColor: Colors.lightBlue);
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
        textTheme: mainTextTheme,
        indicatorColor: mainColorScheme.primary,
        useMaterial3: true,
        drawerTheme: DrawerTheme.of(context).copyWith(
          backgroundColor: mainColorScheme.surface,
          elevation: 0,
        ),
        tabBarTheme: theme.tabBarTheme.copyWith(
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                  width: 3.0,
                  color: mainColorScheme.primary,
                  style: BorderStyle.solid),
            ),
            labelColor: mainColorScheme.primary,
            unselectedLabelColor: mainColorScheme.onSurfaceVariant,
            labelStyle: mainTextTheme.titleSmall,
            unselectedLabelStyle: mainTextTheme.titleSmall),
        // primarySwatch: Colors.teal,
        // colorSchemeSeed: const Color(0xff6750a4),
        colorScheme: mainColorScheme,
        inputDecorationTheme: theme.inputDecorationTheme.copyWith(
          border: const OutlineInputBorder(),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
