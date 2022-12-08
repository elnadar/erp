import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'suppliers_add_state.dart';

class SuppliersAddCubit extends Cubit<SuppliersAddState> {
  SuppliersAddCubit() : super(SuppliersAddInitial());
}
