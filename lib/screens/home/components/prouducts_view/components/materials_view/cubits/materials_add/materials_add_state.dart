part of 'materials_add_cubit.dart';

@immutable
abstract class MaterialsAddState {}

class MaterialsAddInitial extends MaterialsAddState {}

class MaterialsAddingDataLoading extends MaterialsAddState {}

class MaterialsAddingDataDone extends MaterialsAddState {}

class MaterialsAddingDataError extends MaterialsAddState {
  final String error;
  MaterialsAddingDataError(this.error) {
    debugPrint(error);
  }
}
