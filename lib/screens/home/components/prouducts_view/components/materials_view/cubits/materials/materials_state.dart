part of 'materials_cubit.dart';

@immutable
abstract class MaterialsState {}

class MaterialsInitial extends MaterialsState {}

class MaterialsLoading extends MaterialsState {}

class MaterialsData extends MaterialsState {}

class MaterialsNoDataFound extends MaterialsState {}

class MaterialsGettingDataError extends MaterialsState {
  final String error;
  MaterialsGettingDataError(this.error) {
    debugPrint(error);
  }
}
