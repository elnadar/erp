import 'package:bloc/bloc.dart';
import 'package:erp/screens/home/components/people_view/components/suppliers/data/supplier_model.dart';
import 'package:erp/screens/home/components/people_view/components/suppliers/data/suppliers_db.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'suplliers_state.dart';

class SuplliersCubit extends Cubit<SuplliersState> {
  SuplliersCubit() : super(SuplliersInitial()) {
    getData();
  }
  List<SupplierModel> suppliersList = [];
  final DbSupplierTable _table = DbSupplierTable();

  Future<void> getData() async {
    emit(SuplliersLoading());
    try {
      suppliersList = await _table.listRows() ?? [];
      if (suppliersList.isEmpty) {
        emit(SuplliersNoDataFound());
      } else {
        emit(SuplliersData(suppliersList));
      }
    } catch (e) {
      emit(SuplliersGettingDataError(e.toString()));
    }
  }
}
