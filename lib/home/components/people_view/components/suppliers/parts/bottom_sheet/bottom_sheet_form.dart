part of '../../suppliers_view.dart';

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
  late final SuppliersAddCubit _cubit;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _addressController = TextEditingController();
    _noteController = TextEditingController();
    _cubit = BlocProvider.of<SuppliersAddCubit>(context);
    super.initState();
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _noteController.dispose();
    _cubit.close();
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

    _cubit.addData(model).then((v) {
      BlocProvider.of<SuplliersCubit>(context).getData();
      Navigator.of(context).pop();
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
