import 'package:flutter/material.dart';

// class FilledButton extends StatelessWidget {
//   const FilledButton({
//     Key? key,
//     required this.child,
//     required this.onPressed,
//     this.padding = const EdgeInsets.all(20),
//   }) : super(key: key);
//   final Widget child;
//   final VoidCallback onPressed;
//   final EdgeInsets? padding;
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//               foregroundColor: Theme.of(context).colorScheme.onPrimary,
//               backgroundColor: Theme.of(context).colorScheme.primary,
//               padding: padding)
//           .copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
//       onPressed: onPressed,
//       child: child,
//     );
//   }
// }

class FilledTonalButton extends StatelessWidget {
  const FilledTonalButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.padding = const EdgeInsets.all(18),
  }) : super(key: key);
  final Widget child;
  final VoidCallback onPressed;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
              foregroundColor:
                  Theme.of(context).colorScheme.onSecondaryContainer,
              backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
              padding: padding)
          .copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
      onPressed: onPressed,
      child: child,
    );
  }
}
