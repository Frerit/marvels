import 'package:marvels/app/list/domain/entities/m_characters.dart';

class CharactersData {
  final int offset;
  final int limit;
  final int total;
  final int count;
  final List<MarverCharacter> results;

  CharactersData({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });
}
