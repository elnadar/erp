import 'package:erp/home/presentation/components/menu_bar_icon/menu_bar_icon.dart';
import 'package:erp/home/presentation/components/prouducts_view/components/materials_view/materials_view.dart';
import 'package:erp/utils/localization/ar.dart';
import 'package:flutter/material.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    // final ThemeData theme = Theme.of(context);
    return DefaultTabController(
      length: 2,
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
          const SliverFillRemaining(
            child: SizedBox.expand(
              child: TabBarView(children: [MaterialsView(), MaterialsView()]),
            ),
          ),
        ],
      ),
    );
  }
}
