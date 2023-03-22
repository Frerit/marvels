import 'package:marvels/app/detail/data/models/character_model.dart';

class CharacterData {
  int? offset;
  int? limit;
  int? total;
  int? count;
  final List<CharacterModel> results;

  CharacterData(
      {this.offset, this.limit, this.total, this.count, required this.results});

  factory CharacterData.fromJson(Map<String, dynamic> json) {
    return CharacterData(
      offset: json['offset'],
      limit: json['limit'],
      total: json['total'],
      count: json['count'],
      results: List.from(
        json['results'].map(
          (x) => CharacterModel.fromJson(x),
        ),
      ),
    );
  }
}
