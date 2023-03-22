import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvels/app/list/domain/repositories/list_characters_repository.dart';

import '../../domain/entities/m_characters.dart';

part 'list_state.dart';
part 'list_event.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc(this._repository) : super(ListInitialState()) {
    on<GetCharactersEvent>(_onGetCharactersEvent);
    on<GetMoreCharactersEvent>(_onGetMoreCharactersEvent);
  }

  ListCharactersRepository _repository;
  List<MarverCharacter> characters = [];
  int page = 0;
  int offset = 20;
  bool isFetching = false;

  void _onGetCharactersEvent(
    GetCharactersEvent event,
    Emitter<ListState> emit,
  ) async {
    emit(LoadingListState());

    final charactersOrFailure = await _repository.getCharacters(0);

    charactersOrFailure.fold(
      (succes) {
        characters = succes.results;
        emit(LoadedListState(results: characters));
      },
      (failure) {
        emit(FailureListState());
      },
    );
  }

  void _onGetMoreCharactersEvent(
    GetMoreCharactersEvent event,
    Emitter<ListState> emit,
  ) async {
    try {
      final moreOrFailure = await _repository.getCharacters(page);

      final newList = moreOrFailure.fold((l) => l, (r) {
        emit(FailureListState());
      });

      characters.addAll(newList?.results ?? []);
      isFetching = false;
      emit(LoadingListState());
      emit(LoadedListState(results: characters));
    } catch (e) {
      emit(FailureListState());
    }
  }
}
