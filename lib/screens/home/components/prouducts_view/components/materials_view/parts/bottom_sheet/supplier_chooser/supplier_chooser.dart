part of '../../../materials_view.dart';

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
  late final SuplliersCubit _supplierCubit;

  @override
  void initState() {
    _supplierCubit = BlocProvider.of<SuplliersCubit>(context);
    super.initState();
  }

  @override
  void dispose() {
    _supplierCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_suppliersList.isEmpty) {
      if (_supplierCubit.state is SuplliersLoading) {
        return const SizedBox(
          height: 200,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else if (_supplierCubit.state is! SuplliersData) {
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
