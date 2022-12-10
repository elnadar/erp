import 'package:bloc/bloc.dart';
import 'package:erp/screens/home/components/people_view/components/suppliers/data/supplier_model.dart';
import 'package:erp/screens/home/components/people_view/components/suppliers/data/suppliers_list.dart';
import 'package:meta/meta.dart';

part 'choose_supplier_state.dart';

class ChooseSupplierCubit extends Cubit<ChooseSupplierState> {
  ChooseSupplierCubit() : super(ChooseSupplierInitial());
  SupplierModel? _model;
  SupplierModel? get model => _model;
  choose(int index) {
    emit(ChooseSupplierLoading());

    try {
      _model = SuppliersList().suppliersList[index];
      emit(ChooseSupplierDone());
    } catch (e) {
      emit(ChooseSupplierError(e.toString()));
    }
  }
}
