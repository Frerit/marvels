import 'package:marvels/app/list/data/models/character_model.dart';
import 'package:marvels/app/list/domain/entities/characters_data.dart';
import 'package:marvels/app/list/domain/entities/m_characters.dart';

class CharactersDataModel extends CharactersData {
  CharactersDataModel({
    required int offset,
    required int limit,
    required int total,
    required int count,
    required List<MarverCharacter> results,
  }) : super(
          count: count,
          limit: limit,
          offset: offset,
          results: results,
          total: total,
        );

  factory CharactersDataModel.fromJson(Map<String, dynamic> json) {
    return CharactersDataModel(
      offset: json["offset"],
      limit: json["limit"],
      total: json["total"],
      count: json["count"],
      results: List<MarverCharacter>.from(
        json["results"].map(
          (x) => CharacterModel.fromJson(x),
        ),
      ),
    );
  }
}
