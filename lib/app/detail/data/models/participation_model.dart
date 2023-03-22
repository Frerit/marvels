import 'item_model.dart';

class Participation {
  List<ItemData>? items;
  int? returned;

  Participation({this.items, this.returned});

  Participation.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <ItemData>[];
      json['items'].forEach((v) {
        items!.add(ItemData.fromJson(v));
      });
    }
    returned = json['returned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['returned'] = returned;
    return data;
  }
}
