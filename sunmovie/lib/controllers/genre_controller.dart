import 'package:sunmovie/models/genre_model.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class genreMovieController {
  final String _apiKey = "2b106eac51c7ebba580862759524ba9f";

  Future<List<genreModel>> getAllGenres() async {
    final url =
        "https://api.themoviedb.org/3/genre/movie/list?api_key=$_apiKey";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final List<dynamic> genresData = decoded['genres'];
      final List<genreModel> genresList = [];

      for (var genreData in genresData) {
        final genreModel genre = genreModel.fromJson(genreData);
        genresList.add(genre);
      }

      return genresList;
    } else {
      throw Exception('Failed to load genres');
    }
  }
}

// ignore: camel_case_types
class genreTVController {
  final String _apiKey = "2b106eac51c7ebba580862759524ba9f";

  Future<List<genreModel>> getAllGenres() async {
    final url = "https://api.themoviedb.org/3/genre/tv/list?api_key=$_apiKey";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final List<dynamic> genresData = decoded['genres'];
      final List<genreModel> genresList = [];

      for (var genreData in genresData) {
        final genreModel genre = genreModel.fromJson(genreData);
        genresList.add(genre);
      }

      return genresList;
    } else {
      throw Exception('Failed to load genres');
    }
  }
}
