part of 'product_info_cubit.dart';

@immutable
abstract class ProductInfoState {}

class ProductInfoInitial extends ProductInfoState {}

class ProductInfoLoading extends ProductInfoState {}

class ProductInfoDone extends ProductInfoState {}

class ProductInfoNotFound extends ProductInfoState {}

class ProductInfoError extends ProductInfoState {
  final String error;
  ProductInfoError(this.error) {
    debugPrint(error);
  }
}
