import 'package:bloc/bloc.dart';
import 'package:erp/home/presentation/components/people_view/components/suppliers/data/suppliers_db.dart';
import 'package:meta/meta.dart';

import '../data/supplier_model.dart';

part 'suplliers_state.dart';

class SuplliersCubit extends Cubit<SuplliersState> {
  SuplliersCubit() : super(SuplliersInitial()) {
    getData();
  }
  List<SupplierModel> suppliersList = [];
  final DbSupplierTable table = DbSupplierTable();

  Future<void> getData() async {
    emit(SuplliersLoading());
    try {
      suppliersList = await table.listRows() ?? [];
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
