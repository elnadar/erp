import 'package:erp/home/presentation/components/menu_bar_icon/menu_bar_icon.dart';
import 'package:erp/home/presentation/components/prouducts_view/components/materials_view/materials_view.dart';
import 'package:erp/home/presentation/components/sliver_tab_bar/sliver_tab_bar.dart';
import 'package:flutter/material.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverTabBar(
      tabLength: 2,
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
        title: const Text("المنتجات"),
        bottom: const TabBar(
          // labelColor: theme.colorScheme.secondary,
          tabs: [
            Tab(
              text: "الخامات",
            ),
            Tab(
              text: "المنتجات",
            ),
          ],
        ),
      ),
      body: const TabBarView(children: [
        MaterialsView(
          name: "الخامات",
        ),
        MaterialsView(
          name: "المنتجات",
        )
      ]),
    );
  }
}
