part of 'imagine_bloc.dart';

@immutable
abstract class ImagineEvent {}
class FetchImagine extends ImagineEvent{
  final String message;

  FetchImagine({required this.message});
}
