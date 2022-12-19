part of 'prices_add_cubit.dart';

@immutable
abstract class PricesAddState {}

class PricesAddInitial extends PricesAddState {}

class PricesAddingDataLoading extends PricesAddState {}

class PricesAddingDataDone extends PricesAddState {}

class PricesAddingDataError extends PricesAddState {
  final String error;
  PricesAddingDataError(this.error) {
    debugPrint(error);
  }
}
