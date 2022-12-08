import 'package:flutter/material.dart';

class DrawerMat3 extends StatelessWidget {
  const DrawerMat3({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    const Radius radius = Radius.circular(16);
    return Drawer(
      shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadiusDirectional.only(topEnd: radius, bottomEnd: radius)),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: child,
        ),
      ),
    );
  }
}
