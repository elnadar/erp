part of 'products_add_cubit.dart';

@immutable
abstract class ProductsAddState {}

class ProductsAddInitial extends ProductsAddState {}

class ProductsAddingDataLoading extends ProductsAddState {}

class ProductsAddingDataDone extends ProductsAddState {}

class ProductsAddingDataError extends ProductsAddState {
  final String error;
  ProductsAddingDataError(this.error) {
    debugPrint(error);
  }
}
