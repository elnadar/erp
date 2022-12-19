part of 'prices_cubit.dart';

@immutable
abstract class PricesState {}

class PricesInitial extends PricesState {}

class PricesLoading extends PricesState {}

class PricesData extends PricesState {}

class PricesNoDataFound extends PricesState {}

class PricesGettingDataError extends PricesState {
  final String error;
  PricesGettingDataError(this.error) {
    debugPrint(error);
  }
}
