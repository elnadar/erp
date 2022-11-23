import 'package:erp/home/presentation/components/menu_bar_icon/menu_bar_icon.dart';
import 'package:erp/utils/localization/ar.dart';
import 'package:flutter/material.dart';

class FinanceView extends StatelessWidget {
  const FinanceView({super.key});

  @override
  Widget build(BuildContext context) {
    // final ThemeData theme = Theme.of(context);
    return DefaultTabController(
      length: 3,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: const MenuBarIcon(),
            actions: [
              IconButton(
                icon: const Icon(Icons.more_vert_rounded),
                onPressed: () {},
              )
            ],
            floating: true,
            pinned: true,
            snap: true,
            stretch: true,
            title: const Text("المالية"),
            bottom: const TabBar(
              // labelColor: theme.colorScheme.secondary,
              tabs: [
                Tab(
                  text: "احصائيات عامة",
                ),
                Tab(
                  text: "الواردات",
                ),
                Tab(
                  text: "الصادرات",
                ),
              ],
            ),
          ),
          // ignore: prefer_const_constructors
          SliverToBoxAdapter(
            child: SizedBox(
              height: 1500,
              child: const TabBarView(
                children: [
                  Icon(Icons.directions_car),
                  Icon(Icons.directions_transit),
                  Icon(Icons.directions_transit),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
