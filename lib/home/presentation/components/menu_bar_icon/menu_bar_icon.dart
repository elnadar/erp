import 'package:erp/home/presentation/controllers/menu_bar_icon/menu_bar_icon_cubit.dart';
import 'package:erp/utils/localization/ar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuBarIcon extends StatelessWidget {
  const MenuBarIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.menu),
      tooltip: ArabicLangLoc.homeScreenAppBarMenue,
      onPressed: () => BlocProvider.of<MenuBarIconCubit>(context).open(context),
    );
  }
}
