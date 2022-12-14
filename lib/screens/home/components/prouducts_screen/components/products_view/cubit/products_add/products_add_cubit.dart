import 'package:bloc/bloc.dart';
import 'package:erp/screens/home/components/prouducts_screen/components/products_view/data/product_model.dart';
import 'package:erp/screens/home/components/prouducts_screen/components/products_view/data/products_db.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'products_add_state.dart';

class ProductsAddCubit extends Cubit<ProductsAddState> {
  ProductsAddCubit() : super(ProductsAddInitial());
  addData(ProductModel model) async {
    try {
      emit(ProductsAddingDataLoading());
      await DbProductsTable().insert(model).then((value) {
        debugPrint('$value');
      });
      emit(ProductsAddingDataDone());
    } catch (e) {
      emit(ProductsAddingDataError(e.toString()));
    }
  }
}
