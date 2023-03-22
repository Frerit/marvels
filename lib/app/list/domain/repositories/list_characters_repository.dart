import 'package:dartz/dartz.dart';
import 'package:marvels/app/list/domain/entities/characters_data.dart';

abstract class ListCharactersRepository {
  Future<Either<CharactersData, String>> getCharacters(int page);
}
