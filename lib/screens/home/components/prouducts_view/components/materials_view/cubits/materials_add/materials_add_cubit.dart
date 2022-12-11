import 'package:bloc/bloc.dart';
import 'package:erp/screens/home/components/prouducts_view/components/materials_view/data/material_model.dart';
import 'package:erp/screens/home/components/prouducts_view/components/materials_view/data/materials_db.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'materials_add_state.dart';

class MaterialsAddCubit extends Cubit<MaterialsAddState> {
  MaterialsAddCubit() : super(MaterialsAddInitial());
  addData(MaterialModel model) async {
    try {
      emit(MaterialsAddingDataLoading());
      await DbMaterialsTable().insert(model).then((value) {
        debugPrint('$value');
      });
      emit(MaterialsAddingDataDone());
    } catch (e) {
      emit(MaterialsAddingDataError(e.toString()));
    }
  }
}
