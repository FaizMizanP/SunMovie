class SearchResult {
  final int id;
  final String title;
  final String posterUrl;
  final String releaseDate;
  final String overview;
  final int runtime;
  final double voteAverage;
  final String mediaType;

  SearchResult({
    required this.id,
    required this.title,
    required this.posterUrl,
    required this.releaseDate,
    required this.overview,
    required this.runtime,
    required this.voteAverage,
    required this.mediaType,
  });
}
