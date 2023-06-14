import 'package:sunmovie/models/tv_model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class TVController {
  final String _apiKey = "2b106eac51c7ebba580862759524ba9f";

  Future<List<TVModel>> getTVShowsByGenre(int genreId) async {
    final url =
        "https://api.themoviedb.org/3/discover/tv?api_key=$_apiKey&page=1&with_genres=$genreId";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final List<dynamic> tvShowsData = decoded['results'];
      final List<TVModel> tvShows = [];

      for (var tvShowData in tvShowsData) {
        if (tvShows.length >= 30) {
          break;
        }

        final TVModel tvShow = TVModel.fromJson(tvShowData);
        tvShows.add(tvShow);
      }

      return tvShows;
    } else {
      throw Exception("Failed to load TV shows by genre");
    }
  }
}
