import 'package:flutter/material.dart';

class MaterialsView extends StatelessWidget {
  const MaterialsView({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
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
                onPressed: () {},
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


// class MaterialsView extends StatelessWidget {
//   const MaterialsView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         ListView(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           children: List.filled(
//             20,
            // ListTile(
            //   title: Text("فريون"),
            //   subtitle: Text("اخر تعديل الساعة 15"),
            //   trailing: Text("25ج"),
            //   onTap: () {},
            // ),
//           ),
//         ),
        // Padding(
        //   padding: const EdgeInsets.all(20.0),
        //   child: Align(
        //     alignment: AlignmentDirectional.bottomEnd,
        //     child: FloatingActionButton(
        //       onPressed: () {},
        //       tooltip: "إضافة خامة",
        //       child: const Icon(Icons.add),
        //     ),
        //   ),
        // )
//       ],
//     );
//   }
// }
