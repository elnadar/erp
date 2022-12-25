part of '../../product_info.dart';

class _AddPriceForm extends StatefulWidget {
  const _AddPriceForm({super.key});

  @override
  State<_AddPriceForm> createState() => _AddPriceFormState();
}

class _AddPriceFormState extends State<_AddPriceForm> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _priceController;
  late final PricesAddCubit _cubit;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _priceController = TextEditingController();
    _cubit = BlocProvider.of<PricesAddCubit>(context);
    super.initState();
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _priceController.dispose();
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
      PriceModel model = PriceModel(
          price: double.parse(_priceController.text),
          date: DateTime.now(),
          productId: BlocProvider.of<ProductInfoCubit>(context).id);

      _cubit.addData(model).then((v) {
        BlocProvider.of<PricesCubit>(context).getProductsPricesById();
        Navigator.of(context).pop();
      });
    }
  }

  ThemeData get theme => Theme.of(context);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            'إضافة سعر',
            textStyle: theme.textTheme.headlineSmall,
          ),
          const SizedBox(height: 22),
          TextFormField(
            controller: _priceController,
            textDirection: TextDirection.ltr,
            decoration: const InputDecoration(labelText: "السعر"),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            textInputAction: TextInputAction.done,
            onEditingComplete: _submit,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,5}')),
            ],
            validator: ((value) {
              if (value!.isEmpty) {
                return "لا يمكنك ترك هذه الخانة فارغة";
              }
            }),
          ),
          const SizedBox(height: 22),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: _submit,
              child: const Text("إضافة الخامة"),
            ),
          ),
        ],
      ),
    );
  }
}
