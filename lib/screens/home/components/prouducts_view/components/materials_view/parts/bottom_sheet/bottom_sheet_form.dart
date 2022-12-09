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
  WeightUnits dropdownValue = _lst.first;
  ThemeData get theme => Theme.of(context);

  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _nameController;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _nameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    _formKey.currentState?.deactivate();
    super.deactivate();
  }

  _submit() {}

  @override
  Widget build(BuildContext context) {
    return Form(
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
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: "الوزن"),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 16),
          StatefulBuilder(builder: (BuildContext context, _) {
            return DropdownButtonFormField<WeightUnits>(
                decoration: const InputDecoration(labelText: 'وحدة القياس'),
                value: dropdownValue,
                items: _lst
                    .map<DropdownMenuItem<WeightUnits>>((WeightUnits value) {
                  return DropdownMenuItem<WeightUnits>(
                    value: value,
                    child: Text(getWeightUnitAr(value)),
                  );
                }).toList(),
                onChanged: (val) => setState(() {
                      dropdownValue = val!;
                    }));
          }),
          const SizedBox(height: 16),
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: "المورد"),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 16),
          TextFormField(
            minLines: 3,
            maxLines: 5,
            controller: _nameController,
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