part of 'detail_bloc.dart';

@immutable
abstract class DetailState extends Equatable {
  const DetailState();
  @override
  List<Object> get props => [];
}

class InitialState extends DetailState {}

class LoadingComicsState extends DetailState {}

class FailureComicsState extends DetailState {}

class LoadedComicsState extends DetailState {
  const LoadedComicsState(this.events);
  final CharacterData events;

  @override
  List<Object> get props => [events];
}

class LoadingSeriessState extends DetailState {}

class FailureSeriesState extends DetailState {}

class LoadedSeriesState extends DetailState {
  const LoadedSeriesState(this.events);
  final CharacterData events;

  @override
  List<Object> get props => [events];
}

class LoadingEventsState extends DetailState {}

class FailureEventsState extends DetailState {}

class LoadedEventsState extends DetailState {
  const LoadedEventsState(this.events);
  final CharacterData events;

  @override
  List<Object> get props => [events];
}

class LoadingStoriesState extends DetailState {}

class FailureStoriesState extends DetailState {}

class LoadedStoriesState extends DetailState {
  const LoadedStoriesState(this.events);
  final CharacterData events;

  @override
  List<Object> get props => [events];
}

class FailureDetailState extends DetailState {}
