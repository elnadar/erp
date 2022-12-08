import 'package:erp/home/components/drawer_mat3/drawer_mat3.dart';
import 'package:erp/utils/localization/ar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/drawer_mat3/drawer_mat3_devider.dart';
import 'components/drawer_mat3/drawer_mat3_headline.dart';
import 'components/drawer_mat3/drawer_mat3_tile.dart';
import 'components/finance_view/finance_view.dart';
import 'components/home_view/home_view.dart';
import 'components/people_view/people_view.dart';
import 'components/prouducts_view/products_view.dart';
import 'controllers/bottom_nav_bar/bottom_nav_bar_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int currentIndex =
        context.watch<BottomNavBarCubit>().state.activeIndex;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: DrawerMat3(
          child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerMat3Headline(
            child: Text("تجربة"),
          ),
          const DrawerMat3Headline(
            child: Text('عنوان القسم'),
          ),
          DrawerMat3Tile(
            leading: Icon(Icons.inbox),
            title: Text('الرسائل'),
            onTap: () {},
            selected: true,
            trailing: Text("100+"),
          ),
          DrawerMat3Tile(
            leading: Icon(Icons.send_outlined),
            title: Text('الملف الشخصي'),
            onTap: () {},
          ),
          DrawerMat3Tile(
            leading: Icon(Icons.favorite_outline_rounded),
            title: Text('الاعدادات'),
            onTap: () {},
          ),
          const DrawerMat3Devider(),
          const DrawerMat3Headline(
            child: Text("تجربة"),
          ),
          DrawerMat3Tile(
            leading: Icon(Icons.send_outlined),
            title: Text('الملف الشخصي'),
            onTap: () {},
          ),
          DrawerMat3Tile(
            leading: Icon(Icons.favorite_outline_rounded),
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
          NavigationDestination(icon: Icon(Icons.people), label: "الأشخاص"),
          NavigationDestination(icon: Icon(Icons.category), label: "المنتجات"),
          NavigationDestination(icon: Icon(Icons.money), label: "المالية"),
          NavigationDestination(
              icon: Icon(Icons.notifications),
              label: ArabicLangLoc.homeScreenAppBarNotify),
        ],
      ),
      body: const <Widget>[
        HomeView(),
        PeopleView(),
        ProductsView(),
        FinanceView(),
        Center(
          child: Text("الإشعارات"),
        ),
      ][currentIndex],
    );
  }
}
