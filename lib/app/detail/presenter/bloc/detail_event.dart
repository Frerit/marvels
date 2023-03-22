part of 'detail_bloc.dart';

@immutable
abstract class DetailEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialEvent extends DetailEvent {
  InitialEvent({required this.id});
  final int id;

  @override
  List<Object> get props => [];
}
