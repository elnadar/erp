part of 'suppliers_add_cubit.dart';

@immutable
abstract class SuppliersAddState {}

class SuppliersAddInitial extends SuppliersAddState {}

class SuplliersAddingDataLoading extends SuppliersAddState {}

class SuplliersAddingDataDone extends SuppliersAddState {}

class SuplliersAddingDataError extends SuppliersAddState {}
