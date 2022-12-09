import 'package:bloc/bloc.dart';
import 'package:erp/screens/home/components/people_view/components/suppliers/data/suppliers_db.dart';
import 'package:erp/screens/home/components/prouducts_view/components/materials_view/data/materials_list.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'materials_state.dart';

class MaterialsCubit extends Cubit<MaterialsState> {
  MaterialsCubit() : super(MaterialsInitial()) {
    getData();
  }
  final MaterialsList _materials = MaterialsList();
  final DbSupplierTable _table = DbSupplierTable();

  Future<void> getData() async {
    emit(MaterialsLoading());
    try {
      _materials.materialsList = await _table.listRows() ?? [];
      if (_materials.materialsList.isEmpty) {
        emit(MaterialsNoDataFound());
      } else {
        emit(MaterialsData());
      }
    } catch (e) {
      emit(MaterialsGettingDataError(e.toString()));
    }
  }
}
