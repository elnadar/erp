import 'package:bloc/bloc.dart';
import 'package:erp/screens/home/components/prouducts_screen/components/products_view/data/product_model.dart';
import 'package:erp/screens/home/components/prouducts_screen/components/products_view/data/products_db.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'product_info_state.dart';

class ProductInfoCubit extends Cubit<ProductInfoState> {
  final int id;
  ProductInfoCubit(this.id) : super(ProductInfoInitial()) {
    getData();
  }
  final DbProductsTable _table = DbProductsTable();
  ProductModel? model;

  getData() async {
    emit(ProductInfoLoading());
    try {
      model = await _table.getProduct(id);
      if (model == null) {
        emit(ProductInfoNotFound());
      } else {
        emit(ProductInfoDone());
      }
    } catch (e) {
      model = null;
      emit(
        ProductInfoError(e.toString()),
      );
    }
  }
}
