part of '../../product_info.dart';

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

  _addPrice() => sheetBuilder(
      context,
      (contxt) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: _cubit),
              BlocProvider.value(
                  value: BlocProvider.of<ProductInfoCubit>(context)),
            ],
            child: _builderOfSheetBuilder(contxt),
          ));

  @override
  Widget build(BuildContext context) {
    _cubit.getProductsPricesById();
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
                  onPressed: _addPrice,
                  child: const Text(
                      "لا توجد أسعار حاليا لهذه الخامة قم بالضغط هنا لإضافة سعر")),
            ),
          );
        }
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(text: 'السعر الحالي: '),
                        TextSpan(
                          text: "${_cubit.pricesList[0].price} ج.م",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  FilledButton(
                      onPressed: _addPrice, child: const Text("تعديل السعر")),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Divider(
                height: 1,
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: DataTable(
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
                  )),
                  DataColumn(
                      label: Expanded(
                    child: CustomText(
                      "الوقت",
                      fontWeight: FontWeight.bold,
                    ),
                  ))
                ],
                rows: _cubit.pricesList.map((e) {
                  final List<String> date =
                      e.date!.toLocal().toString().split(' ');
                  return DataRow(
                    cells: [
                      DataCell(Text("${e.price}")),
                      DataCell(Text(date[0])),
                      DataCell(Text(date[1].split('.')[0])),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        );
      },
    ));
  }
}
