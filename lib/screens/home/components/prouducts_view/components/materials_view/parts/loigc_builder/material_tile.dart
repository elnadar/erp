part of '../../materials_view.dart';

class _MaterialTile extends StatelessWidget {
  const _MaterialTile({
    Key? key,
    required this.model,
  }) : super(key: key);

  final MaterialModel model;

  // void _submit() {
  //   context.push();
  // }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: ValueKey('MaterialId_${model.id}'),
      title: Text(model.name),
      // subtitle: Text(model.phoneNumber ?? ""),
      onTap: () => context.push('/info/material_info/${model.id}'),
    );
  }
}
