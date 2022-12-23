part of 'material_info_cubit.dart';

@immutable
abstract class MaterialInfoState {}

class MaterialInfoInitial extends MaterialInfoState {}

class MaterialInfoLoading extends MaterialInfoState {}

class MaterialInfoDone extends MaterialInfoState {}

class MaterialInfoNotFound extends MaterialInfoState {}

class MaterialInfoError extends MaterialInfoState {
  final String error;
  MaterialInfoError(this.error) {
    debugPrint(error);
  }
}
