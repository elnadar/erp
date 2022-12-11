import 'package:erp/components/custom_buttons.dart';
import 'package:erp/components/custom_text.dart';
import 'package:erp/components/sheet_builder.dart';
import 'package:erp/screens/home/components/people_view/components/suppliers/cubit/choose_supplier/cubit/choose_supplier_cubit.dart';
import 'package:erp/screens/home/components/people_view/components/suppliers/cubit/suplliers/suplliers_cubit.dart';
import 'package:erp/screens/home/components/people_view/components/suppliers/data/supplier_model.dart';
import 'package:erp/screens/home/components/people_view/components/suppliers/data/suppliers_list.dart';
import 'package:erp/screens/home/components/prouducts_view/components/materials_view/cubits/materials_add/materials_add_cubit.dart';
import 'package:erp/screens/home/components/sliver_tab_bar/sliver_tab_bar_scrollable_child.dart';
import 'package:erp/screens/home/components/sliver_tab_bar/sliver_tab_bar_scrollable_child_with_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'cubits/materials/materials_cubit.dart';
import 'data/material_model.dart';
import 'data/materials_list.dart';

part 'parts/loigc_builder/logic_builder.dart';
part 'parts/loigc_builder/material_tile.dart';
part 'parts/bottom_sheet/bottom_sheet_builder.dart';
part 'parts/bottom_sheet/bottom_sheet_form.dart';
part 'parts/bottom_sheet/supplier_chooser/supplier_chooser.dart';

class MaterialsView extends StatelessWidget {
  const MaterialsView({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MaterialsCubit>(
      create: (context) => MaterialsCubit(),
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
  late final MaterialsCubit _cubit;
  @override
  void initState() {
    _cubit = BlocProvider.of<MaterialsCubit>(context);
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
                value: _cubit, child: _builderOfSheetBuilder(contxt))),
        // onPressed: () => showMaterialsSheet(context),
        tooltip: "إضافة خامة",
        child: const Icon(Icons.add),
      ),
      child: SliverTabBarScrollableChild(
        name: widget.name,
        child: const _LogicBuilder(),
      ),
    );
  }
}
