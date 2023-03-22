import 'dart:convert';

import 'package:marvels/app/list/data/models/response_data.dart';
import 'package:marvels/app/list/domain/entities/characters_data.dart';

class ResultCharacters {
  int? code;
  String? status;
  String? etag;
  CharactersData data;

  ResultCharacters({
    required this.code,
    required this.status,
    required this.etag,
    required this.data,
  });

  factory ResultCharacters.fromJson(Map<String, dynamic> json) {
    return ResultCharacters(
      code: json['code'],
      status: json['status'],
      etag: json['etag'],
      data: CharactersDataModel.fromJson(json['data']),
    );
  }
}

ResultCharacters resultChraracterFromJson(String str) {
  return ResultCharacters.fromJson(json.decode(str));
}
