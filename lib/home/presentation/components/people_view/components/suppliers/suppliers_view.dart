import 'package:erp/components/custom_buttons.dart';
import 'package:erp/home/presentation/components/sliver_tab_bar/sliver_tab_bar_scrollable_child.dart';
import 'package:erp/home/presentation/components/sliver_tab_bar/sliver_tab_bar_scrollable_child_with_fab.dart';
import 'package:erp/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SuppliersView extends StatelessWidget {
  const SuppliersView({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return SliverTabBarScrollableChildWithFab(
      floatingActionButton: FloatingActionButton(
        onPressed: () => sheetBuilder(context, _builderOfSheetBuilder),
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

Future<dynamic> sheetBuilder(
  BuildContext context,
  WidgetBuilder builder,
) {
  return showBarModalBottomSheet(
      context: context,
      builder: builder,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(16), topEnd: Radius.circular(16)),
      ),
      barrierColor: Colors.black54);
}

Widget _builderOfSheetBuilder(BuildContext context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        controller: ModalScrollController.of(context),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: _AddSupplierForm(),
        ),
      ),
    );

class _AddSupplierForm extends StatefulWidget {
  const _AddSupplierForm({
    Key? key,
  }) : super(key: key);

  @override
  State<_AddSupplierForm> createState() => _AddSupplierFormState();
}

class _AddSupplierFormState extends State<_AddSupplierForm> {
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    _formKey.currentState?.deactivate();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: "اسم المورد"),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(labelText: "رقم الهاتف"),
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(labelText: "العنوان"),
            keyboardType: TextInputType.streetAddress,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 16),
          TextFormField(
            minLines: 3,
            maxLines: 5,
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            decoration: const InputDecoration(
              labelText: "ملاحظات",
              alignLabelWithHint: true,
            ),
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
    );
  }
}
