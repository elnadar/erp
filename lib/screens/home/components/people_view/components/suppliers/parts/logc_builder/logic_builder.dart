part of '../../suppliers_view.dart';

class _LogicBuilder extends StatelessWidget {
  const _LogicBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuplliersCubit, SuplliersState>(
      builder: (context, state) {
        if (state is SuplliersLoading) {
          return const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is SuplliersNoDataFound) {
          return const SliverFillRemaining(
            child: Center(
              child: Text(
                  'لا يوجد موردين حاليًا، قم بالضغط على زر + لإضافة مورد جديد.'),
            ),
          );
        }
        final List<SupplierModel> data = SuppliersList().suppliersList;
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final SupplierModel model = data[index];
              return _SupplierTile(model: model);
            },
            childCount: data.length,
          ),
        );
      },
    );
  }
}
