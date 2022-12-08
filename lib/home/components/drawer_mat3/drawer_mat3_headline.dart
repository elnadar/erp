import 'package:flutter/material.dart';

class DrawerMat3Headline extends StatelessWidget {
  const DrawerMat3Headline({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SizedBox(
      height: 56,
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
              start: 16, end: 8, top: 8, bottom: 8),
          child: DefaultTextStyle(
              textAlign: TextAlign.start,
              style: theme.textTheme.titleSmall!
                  .copyWith(color: theme.colorScheme.onSurfaceVariant),
              child: child),
        ),
      ),
    );
  }
}
