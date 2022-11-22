import 'package:erp/auth/presentation/screens/login_screen.dart';
import 'package:erp/home/presentation/components/bill_screen.dart';
import 'package:erp/home/presentation/controllers/bottom_nav_bar/bottom_nav_bar_cubit.dart';
import 'package:erp/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider<BottomNavBarCubit>(
            create: (context) => BottomNavBarCubit(),
            child: const HomeScreen(),
          );
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