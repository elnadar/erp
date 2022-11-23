import 'package:erp/home/presentation/components/finance_view/finance_view.dart';
import 'package:erp/home/presentation/components/home_view/home_view.dart';
import 'package:erp/home/presentation/components/prouducts_view/products_view.dart';
import 'package:erp/home/presentation/controllers/bottom_nav_bar/bottom_nav_bar_cubit.dart';
import 'package:erp/utils/localization/ar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int currentIndex =
        context.watch<BottomNavBarCubit>().state.activeIndex;
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('الرسائل'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('الملف الشخصي'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('الاعدادات'),
            onTap: () {},
          ),
        ],
      )),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (int i) =>
            BlocProvider.of<BottomNavBarCubit>(context).changeIndex(i),
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home),
              label: ArabicLangLoc.homeScreenAppBarTitle),
          NavigationDestination(icon: Icon(Icons.category), label: "المنتجات"),
          NavigationDestination(icon: Icon(Icons.money), label: "المالية"),
          NavigationDestination(
              icon: Icon(Icons.notifications),
              label: ArabicLangLoc.homeScreenAppBarNotify),
        ],
      ),
      body: const <Widget>[
        HomeView(),
        ProductsView(),
        FinanceView(),
        Center(
          child: Text("الإشعارات"),
        ),
      ][currentIndex],
    );
  }
}
