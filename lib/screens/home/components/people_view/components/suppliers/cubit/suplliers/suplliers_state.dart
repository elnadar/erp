part of 'suplliers_cubit.dart';

@immutable
abstract class SuplliersState {}

class SuplliersInitial extends SuplliersState {}

class SuplliersLoading extends SuplliersState {}

class SuplliersData extends SuplliersState {}

class SuplliersNoDataFound extends SuplliersState {}

class SuplliersGettingDataError extends SuplliersState {
  final String error;
  SuplliersGettingDataError(this.error) {
    debugPrint(error);
  }
}
