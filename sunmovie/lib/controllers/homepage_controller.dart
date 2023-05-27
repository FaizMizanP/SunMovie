import 'package:carousel_slider/carousel_slider.dart';
import 'package:sunmovie/models/homepage_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class TrendingController extends StatefulWidget {
  const TrendingController({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TrendingControllerState createState() => _TrendingControllerState();
}

class _TrendingControllerState extends State<TrendingController> {
  List<TrendingModel> trendingMovies = [];

  @override
  void initState() {
    super.initState();
    fetchTrendingMovies();
  }

  Future<void> fetchTrendingMovies() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/trending/movie/day?api_key=2b106eac51c7ebba580862759524ba9f'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      List<TrendingModel> movies = [];
      for (var movie in jsonData['results']) {
        movies.add(TrendingModel(posterPath: movie['backdrop_path']));
      }
      setState(() {
        trendingMovies = movies;
      });
    } else {
      throw Exception('Failed to fetch trending movies');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return CarouselSlider.builder(
      itemCount: trendingMovies.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return SizedBox(
          width: screenWidth,
          child: Image.network(
            'https://image.tmdb.org/t/p/w500/${trendingMovies[index].posterPath}',
            fit: BoxFit.cover,
          ),
        );
      },
      options: CarouselOptions(
        enlargeCenterPage: false,
        scrollDirection: Axis.horizontal,
        viewportFraction: 1.0,
        autoPlay: true,
      ),
    );
  }
}

class MovieController {
  final String _apiKey = "2b106eac51c7ebba580862759524ba9f";

  Future<List<MovieModel>> getTop10Movies() async {
    final url =
        "https://api.themoviedb.org/3/movie/popular?api_key=$_apiKey&page=1";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final List<dynamic> moviesData = decoded['results'];
      final List<MovieModel> movies = [];

      for (var movieData in moviesData) {
        if (movies.length >= 10) {
          break;
        }

        final MovieModel movie = MovieModel.fromJson(movieData);
        movies.add(movie);
      }

      return movies;
    } else {
      throw Exception("Failed to load top 10 movies");
    }
  }
}

class Top10MoviesScreen extends StatefulWidget {
  const Top10MoviesScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Top10MoviesScreenState createState() => _Top10MoviesScreenState();
}

class _Top10MoviesScreenState extends State<Top10MoviesScreen> {
  final MovieController _movieController = MovieController();

  late Future<List<MovieModel>> _movies;

  @override
  void initState() {
    super.initState();
    _movies = _movieController.getTop10Movies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieModel>>(
      future: _movies,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                snapshot.data!.length,
                (index) {
                  final movie = snapshot.data![index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        // Aksi yang akan dilakukan ketika card ditekan
                        // Misalnya, menampilkan detail film atau melakukan navigasi ke halaman detail
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            movie.posterUrl,
                            width: 200,
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              movie.title.length > 20
                                  ? '${movie.title.substring(0, 20)}...'
                                  : movie.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                              right: 8.0,
                              bottom: 8.0,
                            ),
                            child: Text(
                              movie.releaseDate,
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Failed to load top 10 movies"),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class TVController {
  final String _apiKey = "2b106eac51c7ebba580862759524ba9f";

  Future<List<TVModel>> getTop10TV() async {
    final url =
        "https://api.themoviedb.org/3/tv/popular?api_key=$_apiKey&page=1";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final List<dynamic> tvData = decoded['results'];
      final List<TVModel> tvList = [];

      for (var tvData in tvData) {
        if (tvList.length >= 10) {
          break;
        }

        final TVModel tv = TVModel.fromJson(tvData);
        tvList.add(tv);
      }

      return tvList;
    } else {
      throw Exception("Failed to load top 10 TV shows");
    }
  }
}

class Top10TvScreen extends StatefulWidget {
  const Top10TvScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Top10TvScreenState createState() => _Top10TvScreenState();
}

class _Top10TvScreenState extends State<Top10TvScreen> {
  final TVController _tvController = TVController();

  late Future<List<TVModel>> _tvShows;

  @override
  void initState() {
    super.initState();
    _tvShows = _tvController.getTop10TV();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TVModel>>(
      future: _tvShows,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                snapshot.data!.length,
                (index) {
                  final tvShow = snapshot.data![index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        // Aksi yang akan dilakukan ketika card ditekan
                        // Misalnya, menampilkan detail TV show atau melakukan navigasi ke halaman detail
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            tvShow.posterUrl,
                            width: 200,
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              tvShow.name.length > 20
                                  ? '${tvShow.name.substring(0, 20)}...'
                                  : tvShow.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                              right: 8.0,
                              bottom: 8.0,
                            ),
                            child: Text(
                              tvShow.releaseDate,
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Failed to load top 10 TV shows"),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
