class ItemData {
  String? resource;
  String? name;

  ItemData({this.resource, this.name});

  ItemData.fromJson(Map<String, dynamic> json) {
    resource = json['resourceURI'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resourceURI'] = resource;
    data['name'] = name;
    return data;
  }
}
