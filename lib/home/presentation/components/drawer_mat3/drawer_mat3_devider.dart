import 'package:flutter/material.dart';

class DrawerMat3Devider extends StatelessWidget {
  const DrawerMat3Devider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: SizedBox(
        height: 1,
        width: double.infinity,
        child: ColoredBox(color: Theme.of(context).colorScheme.outline),
      ),
    );
  }
}
