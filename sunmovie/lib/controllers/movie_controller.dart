import 'package:sunmovie/models/movie_model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class MoviesController {
  final String _apiKey = "2b106eac51c7ebba580862759524ba9f";

  Future<List<MovieModel>> getMoviesByGenre(int genreId) async {
    final url =
        "https://api.themoviedb.org/3/discover/movie?api_key=$_apiKey&page=1&with_genres=$genreId";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final List<dynamic> moviesData = decoded['results'];
      final List<MovieModel> movies = [];

      for (var movieData in moviesData) {
        if (movies.length >= 30) {
          break;
        }

        final MovieModel movie = MovieModel.fromJson(movieData);
        movies.add(movie);
      }

      return movies;
    } else {
      throw Exception("Failed to load movies by genre");
    }
  }
}
