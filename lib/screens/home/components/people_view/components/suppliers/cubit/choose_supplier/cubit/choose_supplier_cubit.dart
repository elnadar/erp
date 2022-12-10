import 'package:bloc/bloc.dart';
import 'package:erp/screens/home/components/people_view/components/suppliers/data/supplier_model.dart';
import 'package:erp/screens/home/components/people_view/components/suppliers/data/suppliers_list.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'choose_supplier_state.dart';

class ChooseSupplierCubit extends Cubit<ChooseSupplierState> {
  ChooseSupplierCubit._sharedInstance() : super(ChooseSupplierInitial());
  static final ChooseSupplierCubit _shared =
      ChooseSupplierCubit._sharedInstance();
  factory ChooseSupplierCubit() => _shared;
  SupplierModel? _model;
  SupplierModel? get model => _model;
  int? _currentIndex;
  int? get currentIndex => _currentIndex;

  choose(int index) {
    emit(ChooseSupplierLoading());

    try {
      _model = SuppliersList().suppliersList[index];
      _currentIndex = index;
      debugPrint("$_currentIndex");
      emit(ChooseSupplierDone());
    } catch (e) {
      emit(ChooseSupplierError(e.toString()));
    }
  }
}
