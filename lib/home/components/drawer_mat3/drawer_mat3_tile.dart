// ignore_for_file: unused_local_variable

import 'package:erp/utils/theme/colors.dart';
import 'package:erp/utils/theme/reusable.dart';
import 'package:flutter/material.dart';

class DrawerMat3Tile extends StatelessWidget {
  const DrawerMat3Tile(
      {super.key,
      this.leading,
      this.title,
      this.trailing,
      this.onTap,
      this.onLongPressed,
      this.selected = false});
  final Widget? leading;
  final Widget? title;
  final Widget? trailing;
  final VoidCallback? onTap;
  final VoidCallback? onLongPressed;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color selectTextColor = selected
        ? theme.colorScheme.onSecondaryContainer
        : theme.colorScheme.onSurfaceVariant;
    return SizedBox(
      width: 336,
      height: 56,
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPressed,
        customBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Ink(
          decoration: BoxDecoration(
            color: selected
                ? theme.colorScheme.secondaryContainer
                : Colors.transparent,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DefaultTextStyle(
              style:
                  theme.textTheme.labelLarge!.copyWith(color: selectTextColor),
              child: IconTheme.merge(
                data:
                    theme.iconTheme.copyWith(size: 24, color: selectTextColor),
                child: Row(children: [
                  leading ?? const SizedBox(),
                  if (leading != null)
                    const SizedBox(
                      width: 12,
                    ),
                  title ?? const SizedBox(),
                  const Spacer(),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 12, end: 8),
                    child: DefaultTextStyle(
                        style: DefaultTextStyle.of(context).style.copyWith(
                            color: theme.colorScheme.onSurfaceVariant),
                        child: trailing ?? const SizedBox()),
                  )
                ]),
              ),
            ),
          ),
        ),
      ),
    );

    // return Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 12),
    //   child: SizedBox(
    //     width: 336,
    //     height: 56,
    //     child: ListTile(
    //       contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    //       // contentPadding: const EdgeInsets.all(16),
    //       minVerticalPadding: 18,
    //       leading: IconTheme.merge(
    //           data: IconTheme.of(context).copyWith(size: 24),
    //           child: SizedBox(child: leading)),
    //       title: title,
    //       horizontalTitleGap: 12,
    //       trailing: trailing,
    //       onLongPress: onLongPressed,
    //       onTap: onTap,
    //       style: ListTileStyle.drawer,
    //       shape:
    //           RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
    //       selectedTileColor: mainColorScheme.secondaryContainer,
    //       selectedColor: mainColorScheme.onSecondaryContainer,
    //       textColor: mainColorScheme.onSurfaceVariant,
    //       iconColor: mainColorScheme.onSurfaceVariant,
    //       selected: selected,
    //     ),
    //   ),
    // );
  }
}
