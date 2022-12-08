import 'package:erp/screens/home/components/sliver_tab_bar/sliver_tab_bar_scrollable_child.dart';
import 'package:erp/screens/home/components/sliver_tab_bar/sliver_tab_bar_scrollable_child_with_fab.dart';
import 'package:erp/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MaterialsView extends StatelessWidget {
  const MaterialsView({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return SliverTabBarScrollableChildWithFab(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _sheetBuilder(context),
        // onPressed: () => showMaterialsSheet(context),
        tooltip: "إضافة خامة",
        child: const Icon(Icons.add),
      ),
      child: SliverTabBarScrollableChild(
        name: name,
        child: SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return ListTile(
                title: Text("فريون"),
                subtitle: Text("اخر تعديل الساعة 15"),
                trailing: Text("25ج"),
                onTap: () {},
              );
            },
            childCount: 30,
          ),
        ),
      ),
    );
  }

  Future<dynamic> _sheetBuilder(BuildContext context) {
    return showBarModalBottomSheet(
      context: context,
      builder: _builderOfSheetBuilder,
    );
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
}

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
