class Popular {
  final int id;
  final String name;

  Popular({this.id, this.name});
  Popular.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json['name'];
}
