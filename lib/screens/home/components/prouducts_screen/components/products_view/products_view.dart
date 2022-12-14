import 'package:erp/screens/home/components/prouducts_screen/components/products_view/cubit/products/products_cubit.dart';
import 'package:erp/screens/home/components/sliver_tab_bar/sliver_tab_bar_scrollable_child.dart';
import 'package:erp/screens/home/components/sliver_tab_bar/sliver_tab_bar_scrollable_child_with_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'data/product_model.dart';
import 'data/products_list.dart';

part 'parts/logic_builder/logic_builder.dart';
part 'parts/logic_builder/product_tile.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsCubit>(
      create: (context) => ProductsCubit(),
      child: _ScreenView(
        name: name,
      ),
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
  late final ProductsCubit _cubit;
  @override
  void initState() {
    _cubit = BlocProvider.of<ProductsCubit>(context);
    super.initState();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverTabBarScrollableChildWithFab(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: "إضافة منتج",
        child: const Icon(Icons.add),
      ),
      child: SliverTabBarScrollableChild(
        name: widget.name,
        child: const _LogicBuilder(),
      ),
    );
  }
}
