import 'package:flutter/material.dart';

import 'sliver_tab_bar_scrollable_child.dart';

class SliverTabBarScrollableChildWithFab extends StatelessWidget {
  const SliverTabBarScrollableChildWithFab(
      {super.key,
      required this.child,
      required this.floatingActionButton,
      this.fabMargins});
  final SliverTabBarScrollableChild child;
  final FloatingActionButton floatingActionButton;
  final EdgeInsetsGeometry? fabMargins;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Stack(
        children: [
          child,
          Padding(
            padding: fabMargins ?? const EdgeInsets.all(20.0),
            child: Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: floatingActionButton,
            ),
          )
        ],
      ),
    );
  }
}
