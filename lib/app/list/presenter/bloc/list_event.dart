part of 'list_bloc.dart';

@immutable
abstract class ListEvent extends Equatable {
  const ListEvent();
  @override
  List<Object> get props => [];
}

class GetCharactersEvent extends ListEvent {
  @override
  List<Object> get props => [];
}

class GetMoreCharactersEvent extends ListEvent {
  @override
  List<Object> get props => [];
}
