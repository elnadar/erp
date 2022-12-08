import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'suppliers_delete_state.dart';

class SuppliersDeleteCubit extends Cubit<SuppliersDeleteState> {
  SuppliersDeleteCubit() : super(SuppliersDeleteInitial());
}
