part of '../../products_view.dart';

class _LogicBuilder extends StatelessWidget {
  const _LogicBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is ProductsNoDataFound) {
          return const SliverFillRemaining(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                    'لا توجد منتجات خالة بك حاليًا، قم بالضغط على زر + لإضافة منتج جديد.'),
              ),
            ),
          );
        }
        final List<ProductModel> data = ProductsList().productsList;
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final ProductModel model = data[index];
              return _ProductTile(model: model);
            },
            childCount: data.length,
          ),
        );
      },
    );
  }
}
