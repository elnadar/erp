part of 'suplliers_cubit.dart';

@immutable
abstract class SuplliersState {}

class SuplliersInitial extends SuplliersState {}

class SuplliersLoading extends SuplliersState {}

class SuplliersData extends SuplliersState {
  final List<SupplierModel> data;

  SuplliersData(this.data);
}

class SuplliersNoDataFound extends SuplliersState {}

class SuplliersGettingDataError extends SuplliersState {
  final String error;
  SuplliersGettingDataError(this.error) {
    debugPrint(error);
  }
}
