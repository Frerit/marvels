import 'package:dartz/dartz.dart';
import 'package:marvels/app/detail/data/models/character_data.dart';

abstract class DetailRepository {
  Future<Either<CharacterData, String>> getCharacterComics(String id);
  Future<Either<CharacterData, String>> getCharacterEvents(String id);
  Future<Either<CharacterData, String>> getCharacterSeries(String id);
  Future<Either<CharacterData, String>> getCharacterStories(String id);
}
