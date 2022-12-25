part of '../../product_info.dart';

class _MainDataTable extends StatelessWidget {
  const _MainDataTable({
    Key? key,
    required this.model,
  }) : super(key: key);

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return OutlinedCard(
      child: DataTable(
        rows: [
          DataRow(cells: [
            const DataCell(CustomText(
              "اسم المنتج",
              fontWeight: FontWeight.bold,
            )),
            DataCell(Text(model.name)),
          ]),
          if (model.notes != null)
            DataRow(cells: [
              const DataCell(
                CustomText(
                  "ملاحظات",
                  fontWeight: FontWeight.bold,
                ),
              ),
              DataCell(Text(model.notes!))
            ])
        ],
        columns: const [
          DataColumn(
              label: Expanded(
            child: CustomText(
              "عنوان البيان",
              fontWeight: FontWeight.bold,
            ),
          )),
          DataColumn(
              label: Expanded(
            child: CustomText(
              "قيمة البيان",
              fontWeight: FontWeight.bold,
            ),
          ))
        ],
      ),
    );
  }
}
