import 'package:erp/utils/theme/colors.dart';
import 'package:flutter/material.dart';

class MaterialsView extends StatelessWidget {
  const MaterialsView({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return SafeArea(
      top: false,
      bottom: false,
      child: Stack(
        children: [
          Builder(
            builder: (BuildContext context) {
              return CustomScrollView(
                key: PageStorageKey<String>(name),
                slivers: <Widget>[
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return ListTile(
                          title: Text("فريون"),
                          subtitle: Text("اخر تعديل الساعة 15"),
                          trailing: Text("25ج"),
                          onTap: () {},
                        );
                      },
                      childCount: 30,
                    ),
                  ),
                ],
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: FloatingActionButton(
                onPressed: () => showMaterialsSheet(context),
                tooltip: "إضافة خامة",
                child: const Icon(Icons.add),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Future<dynamic> showMaterialsSheet(BuildContext context) {
  return showModalBottomSheet(
    // constraints: BoxConstraints.expand(height: height / 2),
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
    context: context,
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: DraggableScrollableSheet(
          expand: false,
          builder: (context, scrollController) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 7,
                    width: 60,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: mainColorScheme.surfaceVariant,
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
                const Divider(
                  thickness: 1,
                  height: 0,
                ),
                Expanded(
                  child: SafeArea(
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Form(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(),
                              const SizedBox(height: 16),
                              TextFormField(),
                              const SizedBox(height: 16),
                              TextFormField(),
                              const SizedBox(height: 16),
                              TextFormField(),
                              const SizedBox(height: 16),
                              TextFormField(),
                              const SizedBox(height: 16),
                              TextFormField(),
                              const SizedBox(height: 16),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    ),
  );
}
