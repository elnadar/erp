part of '../../materials_view.dart';

class _LogicBuilder extends StatelessWidget {
  const _LogicBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialsCubit, MaterialsState>(
      builder: (context, state) {
        if (state is MaterialsLoading) {
          return const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is MaterialsNoDataFound) {
          return const SliverFillRemaining(
            child: Center(
              child: Text(
                  'لا توجد خامات حاليًا، قم بالضغط على زر + لإضافة خامة جديدة.'),
            ),
          );
        }
        final List<MaterialModel> data = MaterialsList().materialsList;
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final MaterialModel model = data[index];
              return _MaterialTile(model: model);
            },
            childCount: data.length,
          ),
        );
      },
    );
  }
}
