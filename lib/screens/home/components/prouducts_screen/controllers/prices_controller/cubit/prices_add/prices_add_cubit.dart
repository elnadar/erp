import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'prices_add_state.dart';

class PricesAddCubit extends Cubit<PricesAddState> {
  PricesAddCubit() : super(PricesAddInitial());
}
