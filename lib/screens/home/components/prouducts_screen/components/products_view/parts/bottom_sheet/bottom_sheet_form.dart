part of '../../products_view.dart';

class _AddProductForm extends StatefulWidget {
  const _AddProductForm({
    Key? key,
  }) : super(key: key);

  @override
  State<_AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<_AddProductForm> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _nameController, _noteController;
  late final ProductsAddCubit _cubit;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _nameController = TextEditingController();
    _noteController = TextEditingController();
    _cubit = BlocProvider.of<ProductsAddCubit>(context);
    super.initState();
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _nameController.dispose();
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
    if (_formKey.currentState!.validate()) {
      ProductModel model =
          ProductModel(name: _nameController.text, notes: _noteController.text);

      _cubit.addData(model).then((v) {
        BlocProvider.of<ProductsCubit>(context).getData();
        Navigator.of(context).pop();
      });
    }
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
            'إضافة المنتج',
            textStyle: theme.textTheme.headlineSmall,
          ),
          const SizedBox(height: 22),
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: "اسم المنتج"),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            validator: ((value) {
              if (value!.isEmpty) {
                return "لا يمكنك ترك هذه الخانة فارغة";
              }
            }),
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
              child: const Text("إضافة المنتج"),
            ),
          ),
        ],
      ),
    );
  }
}
