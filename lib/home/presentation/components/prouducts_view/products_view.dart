import 'package:erp/utils/localization/ar.dart';
import 'package:flutter/material.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return DefaultTabController(
      length: 2,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              icon: const Icon(Icons.menu),
              tooltip: ArabicLangLoc.homeScreenAppBarMenue,
              onPressed: () {},
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.more_vert_rounded),
                onPressed: () {},
              )
            ],
            pinned: true,
            title: const Text("المنتجات"),
            bottom: const TabBar(
              // labelColor: theme.colorScheme.secondary,
              tabs: [
                Tab(
                  child: Text("الواردات"),
                ),
                Tab(
                  text: "الصادرات",
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            child: const TabBarView(
              children: [
                DecoratedBox(
                    decoration: BoxDecoration(),
                    child: Icon(Icons.directions_car)),
                Icon(Icons.directions_transit),
              ],
            ),
          )
        ],
      ),
    );
  }
}
