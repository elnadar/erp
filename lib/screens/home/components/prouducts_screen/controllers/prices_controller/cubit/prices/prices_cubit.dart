import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'prices_state.dart';

class PricesCubit extends Cubit<PricesState> {
  PricesCubit() : super(PricesInitial());
}
