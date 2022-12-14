part of '../../products_view.dart';

class _ProductTile extends StatelessWidget {
  const _ProductTile({
    Key? key,
    required this.model,
  }) : super(key: key);

  final ProductModel model;

  // void _submit() {
  //   context.push();
  // }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: ValueKey('ProductId_${model.id}'),
      title: Text(model.name),
      // subtitle: Text(model.phoneNumber ?? ""),
      onTap: () => context.push('/info/product_info/${model.id}'),
    );
  }
}
