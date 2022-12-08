import 'package:erp/auth/presentation/screens/login_screen.dart';
import 'package:erp/home/components/bill_screen.dart';
import 'package:erp/home/controllers/bottom_nav_bar/bottom_nav_bar_cubit.dart';
import 'package:erp/home/controllers/menu_bar_icon/menu_bar_icon_cubit.dart';
import 'package:erp/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<BottomNavBarCubit>(
                create: (context) => BottomNavBarCubit(),
              ),
              BlocProvider<MenuBarIconCubit>(
                create: (context) => MenuBarIconCubit(),
              ),
            ],
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
          GoRoute(
            path: 'suppliers',
            builder: (BuildContext context, GoRouterState state) {
              return const BillScreen();
            },
          ),
        ]),
  ],
  debugLogDiagnostics: true,
);
