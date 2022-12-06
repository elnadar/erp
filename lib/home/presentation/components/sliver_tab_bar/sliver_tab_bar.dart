import 'package:flutter/material.dart';

class SliverTabBar extends StatelessWidget {
  const SliverTabBar({
    Key? key,
    required this.tabLength,
    required this.sliverAppBar,
    required this.body,
  }) : super(key: key);
  final int tabLength;
  final SliverAppBar sliverAppBar;
  final TabBarView body;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabLength,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                leading: sliverAppBar.leading,
                actions: sliverAppBar.actions,
                floating: sliverAppBar.floating,
                pinned: sliverAppBar.pinned,
                stretch: sliverAppBar.stretch,
                forceElevated: innerBoxIsScrolled,
                title: sliverAppBar.title,
                bottom: sliverAppBar.bottom,
              ),
            ),
          ];
        },
        body: body,
      ),
    );
  }
}
