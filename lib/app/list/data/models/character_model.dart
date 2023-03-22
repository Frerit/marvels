import 'package:marvels/app/list/data/models/character_tumb_model.dart';
import 'package:marvels/app/list/domain/entities/characters_tumb.dart';
import 'package:marvels/app/list/domain/entities/m_characters.dart';

class CharacterModel extends MarverCharacter {
  CharacterModel({
    required int id,
    required String name,
    required String description,
    required CharactersThumb thumbnail,
  }) : super(
          id: id,
          name: name,
          description: description,
          thumbnail: thumbnail,
        );

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        thumbnail: CharactersThumModel.fromJson(json['thumbnail'] ?? {}),
      );
}
