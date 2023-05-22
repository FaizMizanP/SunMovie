class MovieModel {
  final int id;
  final String title;
  final String posterUrl;
  final String releaseDate;

  MovieModel({
    required this.id,
    required this.title,
    required this.posterUrl,
    required this.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      posterUrl: json['poster_path'] != null
          // ignore: prefer_interpolation_to_compose_strings
          ? "https://image.tmdb.org/t/p/w500" + json['poster_path']
          : "https://via.placeholder.com/150",
      releaseDate: json['release_date'],
    );
  }
}

class TVModel {
  final int id;
  final String name;
  final String posterUrl;
  final String releaseDate;

  TVModel({
    required this.id,
    required this.name,
    required this.posterUrl,
    required this.releaseDate,
  });

  factory TVModel.fromJson(Map<String, dynamic> json) {
    return TVModel(
      id: json['id'],
      name: json['name'],
      posterUrl: "https://image.tmdb.org/t/p/w500/${json['poster_path']}",
      releaseDate: json['first_air_date'],
    );
  }
}
