import 'package:marvels/app/list/domain/entities/characters_tumb.dart';

class CharactersThumModel extends CharactersThumb {
  CharactersThumModel({
    required super.path,
    required super.extension,
  });

  factory CharactersThumModel.fromJson(Map<String, dynamic> json) =>
      CharactersThumModel(
        path: json["path"] ?? '',
        extension: json["extension"] ?? '',
      );
}
