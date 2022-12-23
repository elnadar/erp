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
    return OutlinedCard(child: BlocBuilder<PricesCubit, PricesState>(
      builder: (context, state) {
        if (state is PricesLoading) {
          return const Padding(
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is PricesNoDataFound ||
            PricesList().materialsList.isEmpty) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: TextButton(
                  onPressed: () {},
                  child: const Text(
                      "لا توجد أسعار حاليا لهذه الخامة قم بالضغط هنا لإضافة سعر")),
            ),
          );
        }
        return DataTable(columns: const [
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
        ], rows: [
          DataRow(cells: [
            DataCell(Text("")),
            DataCell(Text("")),
          ])
        ]);
      },
    ));
  }
}
