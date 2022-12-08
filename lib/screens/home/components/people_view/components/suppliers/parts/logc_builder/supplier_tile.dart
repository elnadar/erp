part of '../../suppliers_view.dart';

class _SupplierTile extends StatelessWidget {
  const _SupplierTile({
    Key? key,
    required this.model,
  }) : super(key: key);

  final SupplierModel model;

  // void _submit() {
  //   context.push();
  // }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: ValueKey('SupplierId_${model.id}'),
      title: Text(model.name),
      subtitle: Text(model.phoneNumber ?? ""),
      onTap: () => context.push('/info/supplier_info/${model.id}'),
    );
  }
}
