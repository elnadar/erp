import 'package:erp/components/sheet_builder.dart';
import 'package:erp/screens/home/components/sliver_tab_bar/sliver_tab_bar_scrollable_child.dart';
import 'package:erp/screens/home/components/sliver_tab_bar/sliver_tab_bar_scrollable_child_with_fab.dart';
import 'package:erp/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'cubits/materials/materials_cubit.dart';
import 'data/material_model.dart';
import 'data/materials_list.dart';

part 'parts/loigc_builder/logic_builder.dart';
part 'parts/loigc_builder/material_tile.dart';

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

Widget _builderOfSheetBuilder(context) => SingleChildScrollView(
      controller: ModalScrollController.of(context),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(),
              const SizedBox(height: 16),
              TextFormField(),
              const SizedBox(height: 16),
              TextFormField(),
              const SizedBox(height: 16),
              TextFormField(),
              const SizedBox(height: 16),
              TextFormField(),
              const SizedBox(height: 16),
              TextFormField(),
              const SizedBox(height: 16),
              TextFormField(),
              const SizedBox(height: 16),
              TextFormField(),
              const SizedBox(height: 16),
              TextFormField(),
              const SizedBox(height: 16),
              TextFormField(),
              const SizedBox(height: 16),
              TextFormField(),
              const SizedBox(height: 16),
              TextFormField(),
              const SizedBox(height: 16),
              TextFormField(),
              const SizedBox(height: 16),
              TextFormField(),
              const SizedBox(height: 16),
              TextFormField(),
              const SizedBox(height: 16),
              TextFormField(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );

Future<dynamic> showMaterialsSheet(BuildContext context) {
  return showModalBottomSheet(
    // constraints: BoxConstraints.expand(height: height / 2),
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
    context: context,
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: DraggableScrollableSheet(
          expand: false,
          builder: (context, scrollController) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 7,
                    width: 60,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: mainColorScheme.surfaceVariant,
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
                const Divider(
                  thickness: 1,
                  height: 0,
                ),
                Expanded(
                  child: SafeArea(
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Form(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(),
                              const SizedBox(height: 16),
                              TextFormField(),
                              const SizedBox(height: 16),
                              TextFormField(),
                              const SizedBox(height: 16),
                              TextFormField(),
                              const SizedBox(height: 16),
                              TextFormField(),
                              const SizedBox(height: 16),
                              TextFormField(),
                              const SizedBox(height: 16),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    ),
  );
}
