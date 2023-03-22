import 'package:marvels/app/list/domain/entities/characters_tumb.dart';

class MarverCharacter {
  MarverCharacter({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnail,
  });

  final int id;
  final String name;
  final String description;
  final CharactersThumb thumbnail;
}
