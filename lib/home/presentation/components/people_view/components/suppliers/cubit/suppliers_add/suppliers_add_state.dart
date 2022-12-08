part of 'suppliers_push_cubit.dart';

@immutable
abstract class SuppliersPushState {}

class SuppliersPushInitial extends SuppliersPushState {}

class SuplliersPushingDataLoading extends SuppliersPushState {}

class SuplliersPushingDataDone extends SuppliersPushState {}

class SuplliersPushingDataError extends SuppliersPushState {}
