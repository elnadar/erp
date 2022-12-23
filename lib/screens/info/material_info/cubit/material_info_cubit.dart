import 'package:bloc/bloc.dart';
import 'package:erp/screens/home/components/prouducts_screen/components/materials_view/data/material_model.dart';
import 'package:erp/screens/home/components/prouducts_screen/components/materials_view/data/materials_db.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'material_info_state.dart';

class MaterialInfoCubit extends Cubit<MaterialInfoState> {
  final int id;
  MaterialInfoCubit(this.id) : super(MaterialInfoInitial()) {
    getData();
  }
  final DbMaterialsTable _table = DbMaterialsTable();
  MaterialModel? model;

  getData() async {
    emit(MaterialInfoLoading());
    try {
      model = await _table.getMaterial(id);
      if (model == null) {
        emit(MaterialInfoNotFound());
      } else {
        emit(MaterialInfoDone());
      }
    } catch (e) {
      model = null;
      emit(
        MaterialInfoError(e.toString()),
      );
    }
  }
}
