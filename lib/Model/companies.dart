class Companies {
  final int id;
  final String logo_path;
  final String name;
  final String origin_country;

  Companies(this.id, this.logo_path, this.name, this.origin_country);
  Companies.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        logo_path = json["logo_path"],
        name = json["name"],
        origin_country = json[" origin_country"];
}
