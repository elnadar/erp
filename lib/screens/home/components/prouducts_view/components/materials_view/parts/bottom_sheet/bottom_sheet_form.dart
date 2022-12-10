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
          const _UnitsChooser(),
          const SizedBox(height: 16),
          const _SuppliersChooser(),
          // TextFormField(
          //   controller: _nameController,
          //   decoration: const InputDecoration(labelText: "المورد"),
          //   keyboardType: TextInputType.name,
          //   textInputAction: TextInputAction.next,
          // ),
          // SizedBox(
          //   width: double.infinity,
          //   child: FilledTonalButton(
          //     onPressed: _chooseSupplier,
          //     child: const Text("اختر مورد"),
          //   ),
          // ),

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

class _UnitsChooser extends StatefulWidget {
  const _UnitsChooser({super.key});

  @override
  State<_UnitsChooser> createState() => _UnitsChooserState();
}

class _UnitsChooserState extends State<_UnitsChooser> {
  @override
  Widget build(BuildContext context) {
    WeightUnits dropdownValue = _lst.first;

    return DropdownButtonFormField<WeightUnits>(
        decoration: const InputDecoration(labelText: 'وحدة القياس'),
        value: dropdownValue,
        items: _lst.map<DropdownMenuItem<WeightUnits>>((WeightUnits value) {
          return DropdownMenuItem<WeightUnits>(
            value: value,
            child: Text(getWeightUnitAr(value)),
          );
        }).toList(),
        onChanged: (val) => setState(() {
              dropdownValue = val!;
            }));
  }
}

class _SuppliersChooser extends StatefulWidget {
  const _SuppliersChooser({super.key});

  @override
  State<_SuppliersChooser> createState() => __SuppliersChooserState();
}

class __SuppliersChooserState extends State<_SuppliersChooser> {
  ThemeData get theme => Theme.of(context);

  _chooseSupplier() {
    showCupertinoModalBottomSheet(
      context: context,
      barrierColor: Colors.black87,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: CustomText(
              'اختر المورد',
              textStyle: theme.textTheme.titleLarge,
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
          ),
          BlocProvider<SuplliersCubit>(
            create: (context) => SuplliersCubit(),
            child: const Material(
              child: _ChooseSupplierView(),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String dropdownValue = "";

    return InkWell(
      onTap: _chooseSupplier,
      child: DropdownButtonFormField<String>(
          decoration: const InputDecoration(labelText: 'المورد'),
          value: "قم بالضغط لإختيار مورد",
          items: null,
          enableFeedback: true,
          onChanged: (val) => setState(() {
                dropdownValue = val!;
              })),
    );
  }
}

class _ChooseSupplierView extends StatefulWidget {
  const _ChooseSupplierView({
    Key? key,
  }) : super(key: key);

  @override
  State<_ChooseSupplierView> createState() => _ChooseSupplierViewState();
}

class _ChooseSupplierViewState extends State<_ChooseSupplierView> {
  final _suppliersList = SuppliersList().suppliersList;
  int? _selectedIndex;
  late final SuplliersCubit _cubit;

  @override
  void initState() {
    _cubit = BlocProvider.of<SuplliersCubit>(context);
    super.initState();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_suppliersList.isEmpty) {
      if (_cubit.state is SuplliersLoading) {
        return const SizedBox(
          height: 200,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else if (_cubit.state is! SuplliersData) {
        return const SizedBox(
          height: 200,
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                  "لا يوجد موردين حاليًا، قم بإضافة مورد ثم حاول مرة اخري"),
            ),
          ),
        );
      }
    }
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: ((context, index) {
        SupplierModel model = _suppliersList[index];
        return ListTile(
          title: Text(model.name),
          selected: index == _selectedIndex,
          subtitle: Text(model.phoneNumber ?? ""),
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
        );
      }),
      itemCount: _suppliersList.length,
    );
  }
}
