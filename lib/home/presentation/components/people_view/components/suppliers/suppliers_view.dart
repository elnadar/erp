import 'package:erp/components/custom_buttons.dart';
import 'package:erp/home/presentation/components/sliver_tab_bar/sliver_tab_bar_scrollable_child.dart';
import 'package:erp/home/presentation/components/sliver_tab_bar/sliver_tab_bar_scrollable_child_with_fab.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SuppliersView extends StatelessWidget {
  const SuppliersView({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return SliverTabBarScrollableChildWithFab(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _sheetBuilder(context),
        tooltip: "إضافة مورد",
        child: const Icon(Icons.add),
      ),
      child: SliverTabBarScrollableChild(
        name: name,
        child: SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return ListTile(
                title: const Text("أحمد بتاع الخيار"),
                subtitle: const Text("اخر تعديل الساعة 15"),
                trailing: const Text("25ج"),
                onTap: () {},
              );
            },
            childCount: 30,
          ),
        ),
      ),
    );
  }
}

Future<dynamic> _sheetBuilder(BuildContext context) {
  return showBarModalBottomSheet(
    context: context,
    builder: _builderOfSheetBuilder,
  );
}

Widget _builderOfSheetBuilder(BuildContext context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        controller: ModalScrollController.of(context),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: "اسم المورد"),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: "رقم الهاتف"),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: "العنوان"),
                ),
                const SizedBox(height: 22),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {},
                    child: const Text("إضافة المورد"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
