import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
    this.text, {
    Key? key,
    this.color,
    this.fontSize,
    this.textAlign = TextAlign.start,
    this.fontWeight,
    this.overflow,
    this.maxLines,
    this.textStyle,
  }) : super(key: key);
  final String text;
  final Color? color;
  final double? fontSize;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight)
          .merge(textStyle),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}

class CustomSelectableText extends StatelessWidget {
  const CustomSelectableText(this.text,
      {Key? key,
      this.color,
      this.fontSize,
      this.textAlign = TextAlign.start,
      this.fontWeight,
      this.maxLines})
      : super(key: key);
  final String text;
  final Color? color;
  final double? fontSize;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text,
      style:
          TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}
