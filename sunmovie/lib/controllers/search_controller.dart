import 'package:sunmovie/models/search_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CustomSearchDelegateController {
  final String apiKey = "2b106eac51c7ebba580862759524ba9f";

  Future<List<SearchResult>> performSearch(String query) async {
    final url =
        "https://api.themoviedb.org/3/search/multi?api_key=$apiKey&query=$query";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final List<dynamic> searchResults = decoded['results'];

      final List<SearchResult> formattedResults = searchResults.map((result) {
        final id = result['id'] ?? 0;
        final title = result['title'] ?? result['name'] ?? '';
        final posterUrl = result['poster_path'] ?? '';
        final releaseDate =
            result['release_date'] ?? result['first_air_date'] ?? '';
        final overview = result['overview'] ?? '';
        final runtime = result['runtime'] ?? 0;
        final voteAverage = result['vote_average'] ?? 0.0;
        final mediaType = result['media_type'] ?? '';

        return SearchResult(
          id: id,
          title: title,
          posterUrl: posterUrl,
          releaseDate: releaseDate,
          overview: overview,
          runtime: runtime,
          voteAverage: voteAverage,
          mediaType: mediaType,
        );
      }).toList();

      return formattedResults;
    } else {
      throw Exception("Failed to perform search");
    }
  }
}
