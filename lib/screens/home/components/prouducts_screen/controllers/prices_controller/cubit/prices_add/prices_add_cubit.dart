import 'package:bloc/bloc.dart';
import 'package:erp/screens/home/components/prouducts_screen/controllers/prices_controller/data/price_model.dart';
import 'package:erp/screens/home/components/prouducts_screen/controllers/prices_controller/data/prices_db.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'prices_add_state.dart';

class PricesAddCubit extends Cubit<PricesAddState> {
  PricesAddCubit() : super(PricesAddInitial());
  addData(PriceModel model) async {
    try {
      emit(PricesAddingDataLoading());
      await DbPricesTable().insert(model).then((value) {
        debugPrint('$value');
      });
      emit(PricesAddingDataDone());
    } catch (e) {
      emit(PricesAddingDataError(e.toString()));
    }
  }
}
