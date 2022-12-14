part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsData extends ProductsState {}

class ProductsNoDataFound extends ProductsState {}

class ProductsGettingDataError extends ProductsState {
  final String error;
  ProductsGettingDataError(this.error) {
    debugPrint(error);
  }
}
