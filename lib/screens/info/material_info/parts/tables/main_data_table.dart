part of '../../material_info.dart';

class _MainDataTable extends StatelessWidget {
  const _MainDataTable({
    Key? key,
    required this.model,
  }) : super(key: key);

  final MaterialModel model;

  @override
  Widget build(BuildContext context) {
    return OutlinedCard(
      child: DataTable(
        rows: [
          DataRow(cells: [
            const DataCell(CustomText(
              "اسم الخامة",
              fontWeight: FontWeight.bold,
            )),
            DataCell(Text(model.name)),
          ]),
          DataRow(cells: [
            const DataCell(CustomText(
              "الوزن",
              fontWeight: FontWeight.bold,
            )),
            DataCell(Text(model.quantity.toString())),
          ]),
          DataRow(cells: [
            const DataCell(CustomText(
              "وحدة القياس",
              fontWeight: FontWeight.bold,
            )),
            DataCell(Text(getWeightUnitAr(model.measurement!))),
          ]),
          if (model.supplierId != null)
            DataRow(cells: [
              const DataCell(CustomText(
                "المورد",
                fontWeight: FontWeight.bold,
              )),
              DataCell(model.supplierId == null
                  ? const Text("لا يوجد موردين لهذه الخامة")
                  : const Text("")),
            ]),
          if (model.notes != null)
            DataRow(cells: [
              DataCell(
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
