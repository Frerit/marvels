import 'dart:convert';

import 'package:marvels/app/detail/data/models/character_data.dart';

class DetailModel {
  int? code;
  String? status;
  String? etag;
  CharacterData? data;

  DetailModel({
    this.code,
    this.status,
    this.etag,
    this.data,
  });

  DetailModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    etag = json['etag'];
    data = CharacterData.fromJson(json['data'] ?? {});
  }
}

DetailModel resultModelFromJson(String str) {
  return DetailModel.fromJson(json.decode(str));
}
