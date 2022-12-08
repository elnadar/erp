import 'package:erp/components/custom_buttons.dart';
import 'package:erp/components/custom_text.dart';
import 'package:erp/home/presentation/components/people_view/components/suppliers/cubit/suplliers/suplliers_cubit.dart';
import 'package:erp/home/presentation/components/sliver_tab_bar/sliver_tab_bar_scrollable_child.dart';
import 'package:erp/home/presentation/components/sliver_tab_bar/sliver_tab_bar_scrollable_child_with_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'data/supplier_model.dart';
import 'data/suppliers_db.dart';

class SuppliersView extends StatelessWidget {
  const SuppliersView({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SuplliersCubit>(
      create: (context) => SuplliersCubit(),
      child: SliverTabBarScrollableChildWithFab(
        floatingActionButton: FloatingActionButton(
          onPressed: () => sheetBuilder(context, _builderOfSheetBuilder),
          tooltip: "إضافة مورد",
          child: const Icon(Icons.add),
        ),
        child: SliverTabBarScrollableChild(
          name: name,
          child: const _LogicBuilder(),
        ),
      ),
    );
  }
}

class _LogicBuilder extends StatelessWidget {
  const _LogicBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuplliersCubit, SuplliersState>(
      builder: (context, state) {
        if (state is SuplliersLoading) {
          return const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is SuplliersNoDataFound) {
          return const SliverFillRemaining(
            child: Center(
              child: Text(
                  'لا يوجد موردون حاليا، قم ضافة موردون بالضغط على الزر +'),
            ),
          );
        }
        final List<SupplierModel> data = (state as SuplliersData).data;
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final SupplierModel model = data[index];
              return ListTile(
                title: Text(model.name),
                subtitle: Text(model.phoneNumber ?? ""),
                onTap: () {},
              );
            },
            childCount: data.length,
          ),
        );
      },
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
  late final TextEditingController _nameController,
      _phoneController,
      _addressController,
      _noteController;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _addressController = TextEditingController();
    _noteController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    _formKey.currentState?.deactivate();
    super.deactivate();
  }

  void _submit() {
    SupplierModel model = SupplierModel(
        name: _nameController.text,
        phoneNumber: _phoneController.text,
        address: _addressController.text,
        notes: _noteController.text);
    DbSupplierTable().insert(model).then((value) {
      debugPrint('$value');
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            'إضافة مُوَرِد',
            textStyle: theme.textTheme.headlineSmall,
          ),
          const SizedBox(height: 22),
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: "اسم المورد"),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _phoneController,
            decoration: const InputDecoration(labelText: "رقم الهاتف"),
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _addressController,
            decoration: const InputDecoration(labelText: "العنوان"),
            keyboardType: TextInputType.streetAddress,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 16),
          TextFormField(
            minLines: 3,
            maxLines: 5,
            controller: _noteController,
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
              onPressed: _submit,
              child: const Text("إضافة المورد"),
            ),
          ),
        ],
      ),
    );
  }
}
