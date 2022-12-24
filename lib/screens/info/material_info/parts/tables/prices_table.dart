part of '../../material_info.dart';

class _PricesTable extends StatefulWidget {
  const _PricesTable({
    Key? key,
  }) : super(key: key);

  @override
  State<_PricesTable> createState() => _PricesTableState();
}

class _PricesTableState extends State<_PricesTable> {
  late final PricesCubit _cubit;
  @override
  void initState() {
    _cubit = BlocProvider.of<PricesCubit>(context);
    super.initState();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _cubit.getMaterialsPricesById();
    return OutlinedCard(child: BlocBuilder<PricesCubit, PricesState>(
      builder: (context, state) {
        if (state is PricesLoading) {
          return const Padding(
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is PricesNoDataFound) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: TextButton(
                  onPressed: () => sheetBuilder(
                      context,
                      (contxt) => MultiBlocProvider(
                            providers: [
                              BlocProvider.value(value: _cubit),
                              BlocProvider.value(
                                  value: BlocProvider.of<MaterialInfoCubit>(
                                      context)),
                            ],
                            child: _builderOfSheetBuilder(contxt),
                          )),
                  child: const Text(
                      "لا توجد أسعار حاليا لهذه الخامة قم بالضغط هنا لإضافة سعر")),
            ),
          );
        }
        return DataTable(
          columns: const [
            DataColumn(
                label: Expanded(
              child: CustomText(
                "السعر",
                fontWeight: FontWeight.bold,
              ),
            )),
            DataColumn(
                label: Expanded(
              child: CustomText(
                "التاريخ",
                fontWeight: FontWeight.bold,
              ),
            ))
          ],
          rows: _cubit.pricesList
              .map((e) => DataRow(
                    cells: [
                      DataCell(Text("${e.price}")),
                      DataCell(Text(e.date.toString())),
                    ],
                  ))
              .toList(),
        );
      },
    ));
  }
}
