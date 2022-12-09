import 'package:bloc/bloc.dart';
import 'package:erp/screens/home/components/people_view/components/suppliers/data/suppliers_db.dart';
import 'package:erp/screens/home/components/people_view/components/suppliers/data/suppliers_list.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'suplliers_state.dart';

class SuplliersCubit extends Cubit<SuplliersState> {
  SuplliersCubit() : super(SuplliersInitial()) {
    getData();
  }
  final SuppliersList _suppliers = SuppliersList();
  final DbSupplierTable _table = DbSupplierTable();

  Future<void> getData() async {
    emit(SuplliersLoading());
    try {
      _suppliers.suppliersList = await _table.listRows() ?? [];
      if (_suppliers.suppliersList.isEmpty) {
        emit(SuplliersNoDataFound());
      } else {
        emit(SuplliersData());
      }
    } catch (e) {
      emit(SuplliersGettingDataError(e.toString()));
    }
  }
}
