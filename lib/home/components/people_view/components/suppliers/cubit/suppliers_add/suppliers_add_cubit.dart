import 'package:bloc/bloc.dart';
import 'package:erp/home/components/people_view/components/suppliers/data/supplier_model.dart';
import 'package:erp/home/components/people_view/components/suppliers/data/suppliers_db.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'suppliers_add_state.dart';

class SuppliersAddCubit extends Cubit<SuppliersAddState> {
  SuppliersAddCubit() : super(SuppliersAddInitial());

  addData(SupplierModel model) async {
    try {
      emit(SuplliersAddingDataLoading());
      await DbSupplierTable().insert(model).then((value) {
        debugPrint('$value');
      });
      emit(SuplliersAddingDataDone());
    } catch (e) {
      emit(SuplliersAddingDataError(e.toString()));
    }
  }
}
