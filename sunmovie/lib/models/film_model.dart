class MovieModel {
  final int id;
  final String title;
  final String posterUrl;
  final String releaseDate;
  final String overview;
  final int runtime;

  MovieModel({
    required this.id,
    required this.title,
    required this.posterUrl,
    required this.releaseDate,
    required this.overview,
    required this.runtime,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    int runtime = json['episode_run_time'] ?? 0;
    return MovieModel(
      id: json['id'],
      title: json['title'],
      posterUrl: json['poster_path'] != null
          // ignore: prefer_interpolation_to_compose_strings
          ? "https://image.tmdb.org/t/p/w500" + json['poster_path']
          : "https://via.placeholder.com/150",
      releaseDate: json['release_date'],
      overview: json['overview'],
      runtime: runtime,
    );
  }
}

class TVModel {
  final int id;
  final String name;
  final String posterUrl;
  final String releaseDate;
  final String overview;
  final int runtime;
  //final double voteAverage;
  //final int episodeNumber;

  TVModel({
    required this.id,
    required this.name,
    required this.posterUrl,
    required this.releaseDate,
    required this.overview,
    required this.runtime,
    //required this.voteAverage,
    //required this.episodeNumber,
  });

  factory TVModel.fromJson(Map<String, dynamic> json) {
    int runtime = json['episode_run_time'] ?? 0;

    return TVModel(
      id: json['id'],
      name: json['name'],
      posterUrl: "https://image.tmdb.org/t/p/w500/${json['poster_path']}",
      releaseDate: json['first_air_date'],
      overview: json['overview'],
      runtime: runtime,
      //voteAverage: json['vote_average'],
      //episodeNumber: json['number_of_episodes'],
    );
  }
}

class TrendingModel {
  final String posterPath;

  TrendingModel({required this.posterPath});
}
