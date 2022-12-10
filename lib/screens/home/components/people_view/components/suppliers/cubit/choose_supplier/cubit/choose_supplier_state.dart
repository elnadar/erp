part of 'choose_supplier_cubit.dart';

@immutable
abstract class ChooseSupplierState {}

class ChooseSupplierInitial extends ChooseSupplierState {}

class ChooseSupplierLoading extends ChooseSupplierState {}

class ChooseSupplierDone extends ChooseSupplierState {}

class ChooseSupplierError extends ChooseSupplierState {
  final String error;
  ChooseSupplierError(this.error);
}
