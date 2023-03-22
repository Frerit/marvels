import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvels/app/detail/data/models/character_data.dart';
import 'package:marvels/app/detail/domain/repositories/detail_repository.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc(this._repository) : super(InitialState()) {
    on<InitialEvent>(_onInitialEvent);
  }

  DetailRepository _repository;

  void _onInitialEvent(InitialEvent event, Emitter<DetailState> emit) async {
    emit(LoadingComicsState());
    final comicsOrFailure = await _repository.getCharacterComics(
      event.id.toString(),
    );

    comicsOrFailure.fold(
      (l) {
        if (l.results.isEmpty) {
          emit(FailureComicsState());
        } else {
          emit(LoadedComicsState(l));
        }
      },
      (r) => emit(FailureComicsState()),
    );

    emit(LoadingEventsState());
    final eventsOrFailure = await _repository.getCharacterEvents(
      event.id.toString(),
    );

    eventsOrFailure.fold(
      (l) {
        if (l.results.isEmpty) {
          emit(FailureEventsState());
        } else {
          emit(LoadedEventsState(l));
        }
      },
      (r) => emit(FailureEventsState()),
    );

    emit(LoadingSeriessState());
    final seriesOrFailure = await _repository.getCharacterSeries(
      event.id.toString(),
    );
    seriesOrFailure.fold(
      (l) {
        if (l.results.isEmpty) {
          emit(FailureSeriesState());
        } else {
          emit(LoadedSeriesState(l));
        }
      },
      (r) => emit(FailureSeriesState()),
    );

    emit(LoadingStoriesState());
    final storiesOrFailure = await _repository.getCharacterStories(
      event.id.toString(),
    );
    storiesOrFailure.fold(
      (l) {
        if (l.results.isEmpty) {
          emit(FailureStoriesState());
        } else {
          emit(LoadedStoriesState(l));
        }
      },
      (r) => emit(FailureStoriesState()),
    );
  }
}
