import 'package:bloc/bloc.dart';
import 'package:erp/screens/home/components/prouducts_screen/components/products_view/data/products_db.dart';
import 'package:erp/screens/home/components/prouducts_screen/components/products_view/data/products_list.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial()) {
    getData();
  }
  final ProductsList _products = ProductsList();
  final DbProductsTable _table = DbProductsTable();

  Future<void> getData() async {
    emit(ProductsLoading());
    try {
      _products.productsList = await _table.listRows() ?? [];
      if (_products.productsList.isEmpty) {
        emit(ProductsNoDataFound());
      } else {
        emit(ProductsData());
      }
    } catch (e) {
      emit(ProductsGettingDataError(e.toString()));
    }
  }
}
