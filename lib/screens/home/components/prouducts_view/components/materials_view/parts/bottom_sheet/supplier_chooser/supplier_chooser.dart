part of '../../../materials_view.dart';

class _SuppliersChooser extends StatefulWidget {
  const _SuppliersChooser({super.key});

  @override
  State<_SuppliersChooser> createState() => __SuppliersChooserState();
}

class __SuppliersChooserState extends State<_SuppliersChooser> {
  ThemeData get theme => Theme.of(context);
  final ChooseSupplierCubit _cubit = ChooseSupplierCubit();

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
          MultiBlocProvider(
            providers: [
              BlocProvider<SuplliersCubit>(
                create: (context) => SuplliersCubit(),
              ),
              BlocProvider<ChooseSupplierCubit>.value(
                value: _cubit,
              ),
            ],
            child: const Material(
              child: _ChooseSupplierView(),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChooseSupplierCubit>(
      create: (context) => _cubit,
      lazy: true,
      child: Builder(builder: (context) {
        SupplierModel? model = context.watch<ChooseSupplierCubit>().model;
        return InkWell(
          onTap: _chooseSupplier,
          child: DropdownButtonFormField<int?>(
            decoration: InputDecoration(labelText: model?.name ?? 'المورد'),
            value: model?.id,
            items: null,
            enableFeedback: true,
            onChanged: (val) {},
          ),
        );
      }),
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
  late final SuplliersCubit _supplierCubit;
  late final ChooseSupplierCubit _chooseSupplierCubit;
  @override
  void initState() {
    _supplierCubit = BlocProvider.of<SuplliersCubit>(context);
    _chooseSupplierCubit = BlocProvider.of<ChooseSupplierCubit>(context);
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
          selected: index == context.watch<ChooseSupplierCubit>().currentIndex,
          subtitle: Text(model.phoneNumber ?? ""),
          onTap: () {
            _chooseSupplierCubit.choose(index);
            Navigator.of(context).pop();
          },
        );
      }),
      itemCount: _suppliersList.length,
    );
  }
}
