import 'package:bloc/bloc.dart';
import 'package:erp/screens/home/components/prouducts_screen/controllers/prices_controller/data/prices_db.dart';
import 'package:erp/screens/home/components/prouducts_screen/controllers/prices_controller/data/prices_list.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'prices_state.dart';

class PricesCubit extends Cubit<PricesState> {
  PricesCubit() : super(PricesInitial()) {
    getMaterialsPrices();
    getProductsPrices();
  }
  final PricesList _prices = PricesList();
  final DbPricesTable _table = DbPricesTable();

  Future<void> getMaterialsPrices() async {
    emit(PricesLoading());
    try {
      _prices.materialsList = await _table.listRows() ?? [];
      if (_prices.materialsList.isEmpty) {
        emit(PricesNoDataFound());
      } else {
        emit(PricesData());
      }
    } catch (e) {
      emit(PricesGettingDataError(e.toString()));
    }
  }

  Future<void> getProductsPrices() async {
    emit(PricesLoading());
    try {
      _prices.productsList = await _table.listRows() ?? [];
      if (_prices.productsList.isEmpty) {
        emit(PricesNoDataFound());
      } else {
        emit(PricesData());
      }
    } catch (e) {
      emit(PricesGettingDataError(e.toString()));
    }
  }
}
