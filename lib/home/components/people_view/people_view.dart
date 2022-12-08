import 'package:erp/home/components/menu_bar_icon/menu_bar_icon.dart';
import 'package:erp/home/components/prouducts_view/components/materials_view/materials_view.dart';
import 'package:erp/home/components/sliver_tab_bar/sliver_tab_bar.dart';
import 'package:flutter/material.dart';

import 'components/suppliers/suppliers_view.dart';

class PeopleView extends StatelessWidget {
  const PeopleView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverTabBar(
      tabLength: 3,
      sliverAppBar: SliverAppBar(
        leading: const MenuBarIcon(),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert_rounded),
            onPressed: () {},
          )
        ],
        floating: true,
        pinned: true,
        stretch: true,
        title: const Text("الأشخاص"),
        bottom: const TabBar(
          // labelColor: theme.colorScheme.secondary,
          tabs: [
            Tab(text: "الموردين"),
            Tab(text: "الموظفين"),
            Tab(text: "الزبائن"),
          ],
        ),
      ),
      body: const TabBarView(children: [
        SuppliersView(
          name: "الموردين",
        ),
        MaterialsView(
          name: "الموظفين",
        ),
        MaterialsView(
          name: "الزبائن",
        ),
      ]),
    );
  }
}
