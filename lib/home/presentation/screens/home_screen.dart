import 'package:erp/home/presentation/components/home_view/home_view.dart';
import 'package:erp/utils/localization/ar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: const Icon(Icons.menu),
      //     tooltip: ArabicLangLoc.homeScreenAppBarMenue,
      //     onPressed: () {},
      //   ),
      //   title: const Text(ArabicLangLoc.homeScreenAppBarTitle),
      // ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int i) {},
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
      body: HomeView(theme: theme),
    );
  }
}
