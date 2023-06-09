import 'package:flutter/material.dart';

import 'package:sunmovie/models/movie_model.dart';
import 'package:sunmovie/models/genre_model.dart';

import 'package:sunmovie/controllers/genre_controller.dart';
import 'package:sunmovie/controllers/movie_controller.dart';
import 'package:sunmovie/views/movie_detail_view.dart';

class DiscoverMovieScreen extends StatefulWidget {
  const DiscoverMovieScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DiscoverMovieScreenState createState() => _DiscoverMovieScreenState();
}

class _DiscoverMovieScreenState extends State<DiscoverMovieScreen> {
  final genreMovieController _genreController = genreMovieController();
  final MoviesController _movieController = MoviesController();
  late Future<List<genreModel>> _genres;
  late Future<List<MovieModel>> _movies;
  int _selectedGenreId = 0;

  @override
  void initState() {
    super.initState();
    _genres = _genreController.getAllGenres();
    _movies = _movieController.getMoviesByGenre(_selectedGenreId);
  }

  void _selectGenre(int genreId) {
    setState(() {
      _selectedGenreId = genreId;
      _movies = _movieController.getMoviesByGenre(_selectedGenreId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover Movie'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FutureBuilder<List<genreModel>>(
              future: _genres,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final genres = snapshot.data!;

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: genres.map((genre) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ChoiceChip(
                            label: Text(genre.name),
                            selected: _selectedGenreId == genre.id,
                            onSelected: (selected) {
                              _selectGenre(genre.id);
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Text("Failed to load genres");
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
          Expanded(
            child: FutureBuilder<List<MovieModel>>(
              future: _movies,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final movies = snapshot.data!;

                  return ListView.builder(
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      final movie = movies[index];

                      return ListTile(
                        leading: Image.network(movie.posterUrl),
                        title: Text(movie.title),
                        subtitle: Text(movie.releaseDate.substring(0, 4)),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => movie_detail(movie: movie),
                            ),
                          );
                        },
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Text("Failed to load movies");
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
