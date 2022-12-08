import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Future<dynamic> sheetBuilder(
  BuildContext context,
  WidgetBuilder builder,
) {
  return showBarModalBottomSheet(
      context: context,
      builder: builder,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(16), topEnd: Radius.circular(16)),
      ),
      barrierColor: Colors.black54);
}
