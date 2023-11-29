part of 'imagine_bloc.dart';

@immutable
abstract class ImagineState {}

class ImagineInitial extends ImagineState {}
class ImagineblocLoading extends ImagineState {}
class ImagineblocLoaded extends ImagineState {}
class ImagineblocError extends ImagineState {}
