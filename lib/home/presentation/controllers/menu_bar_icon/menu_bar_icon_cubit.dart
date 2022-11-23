import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'menu_bar_icon_state.dart';

class MenuBarIconCubit extends Cubit<MenuBarIconState> {
  MenuBarIconCubit() : super(MenuBarIconState());

  void open(BuildContext context) {
    Scaffold.of(context).openDrawer();
    emit(MenuBarIconState());
  }
}
