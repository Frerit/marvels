part of 'list_bloc.dart';

@immutable
abstract class ListState extends Equatable {
  @override
  List<Object> get props => [];
}

class ListInitialState extends ListState {}

class LoadingListState extends ListState {}

class LoadedListState extends ListState {
  LoadedListState({
    required this.results,
  });

  final List<MarverCharacter> results;

  @override
  // TODO: implement props
  List<Object> get props => [results];
}

class FailureListState extends ListState {}
