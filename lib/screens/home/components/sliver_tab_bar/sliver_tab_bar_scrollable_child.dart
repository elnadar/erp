import 'package:flutter/material.dart';

class SliverTabBarScrollableChild extends StatelessWidget {
  const SliverTabBarScrollableChild(
      {super.key, required this.name, required this.child});
  final String name;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return CustomScrollView(
          key: PageStorageKey<String>(name),
          slivers: <Widget>[
            SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            child
          ],
        );
      },
    );
    ;
  }
}
