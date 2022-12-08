import 'package:bloc/bloc.dart';
import 'package:erp/screens/home/components/people_view/components/suppliers/data/supplier_model.dart';
import 'package:erp/screens/home/components/people_view/components/suppliers/data/suppliers_db.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'supplier_info_state.dart';

class SupplierInfoCubit extends Cubit<SupplierInfoState> {
  final int id;
  SupplierInfoCubit(this.id) : super(SupplierInfoInitial()) {
    getData();
  }
  final DbSupplierTable _table = DbSupplierTable();
  SupplierModel? model;

  getData() async {
    emit(SupplierInfoLoading());
    try {
      model = await _table.getSupplier(id);
      if (model == null) {
        emit(SupplierInfoNotFound());
      } else {
        emit(SupplierInfoDone());
      }
    } catch (e) {
      model = null;
      emit(
        SupplierInfoError(e.toString()),
      );
    }
  }
}
