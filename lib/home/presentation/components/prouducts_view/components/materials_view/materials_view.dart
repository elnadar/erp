import 'package:flutter/material.dart';

class MaterialsView extends StatelessWidget {
  const MaterialsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: List.filled(
            20,
            ListTile(
              title: Text("فريون"),
              subtitle: Text("اخر تعديل الساعة 15"),
              trailing: Text("25ج"),
              onTap: () {},
            ),
          ),
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
    );
  }
}
