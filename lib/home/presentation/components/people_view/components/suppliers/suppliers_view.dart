import 'package:erp/components/custom_buttons.dart';
import 'package:erp/components/custom_text.dart';
import 'package:erp/components/sheet_builder.dart';
import 'package:erp/home/presentation/components/people_view/components/suppliers/cubit/suplliers/suplliers_cubit.dart';
import 'package:erp/home/presentation/components/people_view/components/suppliers/cubit/suppliers_add/suppliers_add_cubit.dart';
import 'package:erp/home/presentation/components/sliver_tab_bar/sliver_tab_bar_scrollable_child.dart';
import 'package:erp/home/presentation/components/sliver_tab_bar/sliver_tab_bar_scrollable_child_with_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'data/supplier_model.dart';

part 'parts/_logc_builder/logic_builder.dart';
part 'parts/_logc_builder/supplier_tile.dart';
part 'parts/bottom_sheet/bottom_sheet_builder.dart';
part 'parts/bottom_sheet/bottom_sheet_form.dart';

class SuppliersView extends StatelessWidget {
  const SuppliersView({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SuplliersCubit>(
      create: (context) => SuplliersCubit(),
      child: _ScreenView(name: name),
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
  late final SuplliersCubit _cubit;
  @override
  void initState() {
    _cubit = BlocProvider.of<SuplliersCubit>(context);
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
        onPressed: () => sheetBuilder(
          context,
          (contxt) => BlocProvider.value(
              value: _cubit, child: _builderOfSheetBuilder(contxt)),
        ),
        tooltip: "إضافة مورد",
        child: const Icon(Icons.add),
      ),
      child: SliverTabBarScrollableChild(
        name: widget.name,
        child: const _LogicBuilder(),
      ),
    );
  }
}
