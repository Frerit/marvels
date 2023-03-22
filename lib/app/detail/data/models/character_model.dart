import 'package:marvels/app/list/data/models/character_tumb_model.dart';
import 'package:marvels/app/list/domain/entities/characters_tumb.dart';

class CharacterModel {
  int? id;
  String? title;
  String? description;
  CharactersThumb? thumbnail;

  CharacterModel({
    this.id,
    this.title,
    this.description,
    this.thumbnail,
  });

  CharacterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    thumbnail = CharactersThumModel.fromJson(json['thumbnail'] ?? {});
  }
}
