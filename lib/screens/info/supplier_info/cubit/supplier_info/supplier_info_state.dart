part of 'supplier_info_cubit.dart';

@immutable
abstract class SupplierInfoState {}

class SupplierInfoInitial extends SupplierInfoState {}

class SupplierInfoLoading extends SupplierInfoState {}

class SupplierInfoDone extends SupplierInfoState {}

class SupplierInfoNotFound extends SupplierInfoState {}

class SupplierInfoError extends SupplierInfoState {
  final String error;
  SupplierInfoError(this.error) {
    debugPrint(error);
  }
}
