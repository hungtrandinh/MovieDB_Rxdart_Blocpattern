import 'package:movie_traninhhung/Model/companies.dart';
import 'package:movie_traninhhung/Model/popurlar_reponse.dart';

class Movie_daital {
  //  "adult":false,
  //  "backdrop_path":"/9Qs9oyn4iE8QtQjGZ0Hp2WyYNXT.jpg",
  //  "belongs_to_collection":null,
  //  "budget":31500000,
  //  "genres":[
  //     {
  //        "id":18,
  //        "name":"Drama"
  //     },
  //     {
  //        "id":10752,
  //        "name":"War"
  //     }
  //  ],
  //  "homepage":"http://www.apocalypsenow.com",
  //  "id":28,
  //  "imdb_id":"tt0078788",
  //  "original_language":"en",
  //  "original_title":"Apocalypse Now",
  //  "overview":"At the height of the Vietnam war, Captain Benjamin Willard is sent on a dangerous mission that, officially, \"does not exist, nor will it ever exist.\" His goal is to locate - and eliminate - a mysterious Green Beret Colonel named Walter Kurtz, who has been leading his personal army on illegal guerrilla missions into enemy territory.",
  //  "popularity":18.505,
  //  "poster_path":"/gQB8Y5RCMkv2zwzFHbUJX3kAhvA.jpg",
  //  "production_companies":[
  //     {
  //        "id":60,
  //        "logo_path":"/oJXpAs4I3W46e4dkaOEzCa4yBko.png",
  //        "name":"United Artists",
  //        "origin_country":"US"
  //     },
  //     {
  //        "id":70,
  //        "logo_path":"/ueaENQkPcy8rlr5fGZVBXKOhlBh.png",
  //        "name":"American Zoetrope",
  //        "origin_country":"US"
  //     }
  //  ],
  //  "production_countries":[
  //     {
  //        "iso_3166_1":"US",
  //        "name":"United States of America"
  //     }
  //  ],
  //  "release_date":"1979-08-15",
  //  "revenue":150000000,
  //  "runtime":147,
  //  "spoken_languages":[
  //     {
  //        "english_name":"Khmer",
  //        "iso_639_1":"km",
  //        "name":""
  //     },
  //     {
  //        "english_name":"English",
  //        "iso_639_1":"en",
  //        "name":"English"
  //     },
  //     {
  //        "english_name":"French",
  //        "iso_639_1":"fr",
  //        "name":"Français"
  //     },
  //     {
  //        "english_name":"Vietnamese",
  //        "iso_639_1":"vi",
  //        "name":"Tiếng Việt"
  //     }
  //  ],
  //  "status":"Released",
  //  "tagline":"This is the end...",
  //  "title":"Apocalypse Now",
  //  "video":false,
  //  "vote_average":8.3,
  //  "vote_count":5790
  final String backdrop_path;
  final int budget;
  final List<Companies> companies;
  final List<Popular> genres;
  final int vote_count;
  final double vote_average;
  final String title;
  final String tagline;
  final String release_date;
  final int runtime;
  final String overview;
  final String original_title;
  final String poster_path;

  Movie_daital(
      this.genres,
      this.backdrop_path,
      this.budget,
      this.companies,
      this.vote_count,
      this.vote_average,
      this.title,
      this.tagline,
      this.release_date,
      this.runtime,
      this.overview,
      this.original_title,
      this.poster_path);
  Movie_daital.fromJson(Map<String, dynamic> json)
      : backdrop_path = json['backdrop_path'],
        budget = json['budget'],
        companies = (json['production_companies'] as List)
            .map((e) => Companies.fromJson(e))
            .toList(),
        genres =
            (json['genres'] as List).map((e) => Popular.fromJson(e)).toList(),
        title = json['title'],
        original_title = json['original_title'],
        vote_average = json['vote_average'].toDouble(),
        vote_count = json['vote_count'],
        tagline = json['tagline'],
        overview = json['overview'],
        release_date = json['release_date'],
        runtime = json['runtime'],
        poster_path = json['poster_path'];
}
