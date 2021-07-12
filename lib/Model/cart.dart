class CastMovieScreen {
  final String name;
  final String profile_path;
  final String character;
  final int id;

  CastMovieScreen(this.name, this.profile_path, this.character, this.id);
  CastMovieScreen.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        profile_path = json["profile_path"],
        character = json['character'],
        id = json['id'];
}
