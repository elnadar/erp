part of '../../materials_view.dart';

const List<WeightUnits> _lst = WeightUnits.values;

class _AddMaterialForm extends StatefulWidget {
  const _AddMaterialForm({
    Key? key,
  }) : super(key: key);

  @override
  State<_AddMaterialForm> createState() => _AddMaterialFormState();
}

class _AddMaterialFormState extends State<_AddMaterialForm> {
  ThemeData get theme => Theme.of(context);

  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _nameController,
      _quantityController,
      _notesController;
  late final _SuppliersChooser _suppliersChooserWidget;
  late final _UnitsChooser _unitsChooserWidget;
  late final MaterialsAddCubit _cubit;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _nameController = TextEditingController();
    _quantityController = TextEditingController();
    _notesController = TextEditingController();
    _suppliersChooserWidget = _SuppliersChooser();
    _unitsChooserWidget = _UnitsChooser();
    _cubit = BlocProvider.of<MaterialsAddCubit>(context);
    super.initState();
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _nameController.dispose();
    _quantityController.dispose();
    _notesController.dispose();
    _cubit.close();
    super.dispose();
  }

  @override
  void deactivate() {
    _formKey.currentState?.deactivate();
    super.deactivate();
  }

  _submit() {
    if (_formKey.currentState!.validate()) {
      MaterialModel model = MaterialModel(
          name: _nameController.text,
          quantity: double.parse(_quantityController.text),
          measurement: _unitsChooserWidget.selectedVal,
          notes: _notesController.text,
          supplierId: _suppliersChooserWidget.selectedVal);
      _cubit.addData(model).then((v) {
        BlocProvider.of<MaterialsCubit>(context).getData();
        Navigator.of(context).pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            'إضافة خامة',
            textStyle: theme.textTheme.headlineSmall,
          ),
          const SizedBox(height: 22),
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: "اسم الخامة"),
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
            controller: _quantityController,
            textDirection: TextDirection.ltr,
            decoration: const InputDecoration(labelText: "الوزن"),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            textInputAction: TextInputAction.next,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,5}')),
            ],
            validator: ((value) {
              if (value!.isEmpty) {
                return "لا يمكنك ترك هذه الخانة فارغة";
              }
            }),
          ),
          const SizedBox(height: 16),
          _unitsChooserWidget,
          const SizedBox(height: 16),
          _suppliersChooserWidget,
          const SizedBox(height: 16),
          TextFormField(
            minLines: 3,
            maxLines: 5,
            controller: _notesController,
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
              child: const Text("إضافة الخامة"),
            ),
          ),
        ],
      ),
    );
  }
}

class _UnitsChooser extends StatefulWidget {
  _UnitsChooser({super.key});
  WeightUnits? _selectedVal;
  set selectedVal(val) {
    _selectedVal = val;
  }

  get selectedVal => _selectedVal;

  @override
  State<_UnitsChooser> createState() => _UnitsChooserState();
}

class _UnitsChooserState extends State<_UnitsChooser> {
  @override
  Widget build(BuildContext context) {
    widget.selectedVal = _lst.first;

    return DropdownButtonFormField<WeightUnits?>(
        decoration: const InputDecoration(labelText: 'وحدة القياس'),
        value: widget.selectedVal,
        items: _lst.map<DropdownMenuItem<WeightUnits>>((WeightUnits value) {
          return DropdownMenuItem<WeightUnits>(
            value: value,
            child: Text(getWeightUnitAr(value)),
          );
        }).toList(),
        onChanged: (val) => setState(() {
              widget.selectedVal = val!;
            }));
  }
}
