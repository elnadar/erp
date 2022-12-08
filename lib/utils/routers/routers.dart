import 'package:erp/screens/auth/presentation/screens/login_screen.dart';
import 'package:erp/screens/home/components/bill_screen.dart';
import 'package:erp/screens/home/controllers/bottom_nav_bar/bottom_nav_bar_cubit.dart';
import 'package:erp/screens/home/controllers/menu_bar_icon/menu_bar_icon_cubit.dart';
import 'package:erp/screens/home/home_screen.dart';
import 'package:erp/screens/info/supplier_info/cubit/supplier_info/supplier_info_cubit.dart';
import 'package:erp/screens/info/supplier_info/supplier_info.dart';
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
            path: 'info/supplier_info/:userId',
            builder: (BuildContext context, GoRouterState state) {
              return BlocProvider<SupplierInfoCubit>(
                create: (context) =>
                    SupplierInfoCubit(int.parse(state.params['userId']!)),
                child: const SupplierInfo(),
              );
            },
          ),
        ]),
  ],
  debugLogDiagnostics: true,
);
