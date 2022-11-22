import 'package:erp/components/custom_text.dart';
import 'package:flutter/material.dart';

class H1 extends StatelessWidget {
  const H1(
    this.text, {
    Key? key,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return CustomText(
      text,
      textStyle: Theme.of(context).textTheme.headlineLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onSurface),
    );
  }
}
