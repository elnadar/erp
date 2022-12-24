import 'package:bloc/bloc.dart';
import 'package:erp/screens/home/components/prouducts_screen/controllers/prices_controller/data/price_model.dart';
import 'package:erp/screens/home/components/prouducts_screen/controllers/prices_controller/data/prices_db.dart';
import 'package:erp/screens/home/components/prouducts_screen/controllers/prices_controller/data/prices_list.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'prices_state.dart';

class PricesCubit extends Cubit<PricesState> {
  final int? id;
  PricesCubit({this.id}) : super(PricesInitial());
  final PricesList _prices = PricesList();
  final DbPricesTable _table = DbPricesTable();
  List<PriceModel> _pricesList = [];

  List<PriceModel> get pricesList => _pricesList;

  getMaterialsPricesById() async {
    emit(PricesLoading());
    try {
      _pricesList = await _table.getByTypeAndId(PricesType.material, id!) ?? [];
      if (_pricesList.isEmpty) {
        emit(PricesNoDataFound());
      } else {
        emit(PricesData());
      }
    } catch (e) {
      emit(PricesGettingDataError(e.toString()));
    }
  }

  getProductsPricesById() async {
    emit(PricesLoading());
    try {
      _pricesList = await _table.getByTypeAndId(PricesType.product, id!) ?? [];
      if (_pricesList.isEmpty) {
        emit(PricesNoDataFound());
      } else {
        emit(PricesData());
      }
    } catch (e) {
      emit(PricesGettingDataError(e.toString()));
    }
  }

  Future<void> getMaterialsPrices() async {
    emit(PricesLoading());
    try {
      _prices.materialsList = await _table.getByType(PricesType.material) ?? [];
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
      _prices.productsList = await _table.getByType(PricesType.product) ?? [];
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
