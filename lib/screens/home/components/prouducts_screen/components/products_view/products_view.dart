import 'package:erp/screens/home/components/sliver_tab_bar/sliver_tab_bar_scrollable_child.dart';
import 'package:erp/screens/home/components/sliver_tab_bar/sliver_tab_bar_scrollable_child_with_fab.dart';
import 'package:flutter/material.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return _ScreenView(
      name: name,
    );
  }
}

class _ScreenView extends StatefulWidget {
  const _ScreenView({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  State<_ScreenView> createState() => _ScreenViewState();
}

class _ScreenViewState extends State<_ScreenView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverTabBarScrollableChildWithFab(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        // onPressed: () => showMaterialsSheet(context),
        tooltip: "إضافة منتج",
        child: const Icon(Icons.add),
      ),
      child: SliverTabBarScrollableChild(
        name: widget.name,
        child: const SliverFillRemaining(),
      ),
    );
  }
}
