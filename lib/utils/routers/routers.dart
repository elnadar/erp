import 'package:erp/auth/presentation/screens/login_screen.dart';
import 'package:erp/home/presentation/components/bill_screen.dart';
import 'package:erp/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'login',
            builder: (BuildContext context, GoRouterState state) {
              return const LoginScreen();
            },
          ),
          GoRoute(
            path: 'bill',
            builder: (BuildContext context, GoRouterState state) {
              return const BillScreen();
            },
          ),
        ]),
  ],
  debugLogDiagnostics: true,
);
