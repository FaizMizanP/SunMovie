import 'package:flutter/material.dart';

import 'package:sunmovie/models/tv_model.dart';
import 'package:sunmovie/models/genre_model.dart';

import 'package:sunmovie/controllers/genre_controller.dart';
import 'package:sunmovie/controllers/tv_controller.dart';
import 'package:sunmovie/views/tv_detail_view.dart';

class DiscoverTVScreen extends StatefulWidget {
  const DiscoverTVScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DiscoverTVScreenState createState() => _DiscoverTVScreenState();
}

class _DiscoverTVScreenState extends State<DiscoverTVScreen> {
  final genreTVController _genreController = genreTVController();
  final TVController _tvController = TVController();
  late Future<List<genreModel>> _genres;
  late Future<List<TVModel>> _tvShows;
  int _selectedGenreId = 0;

  @override
  void initState() {
    super.initState();
    _genres = _genreController.getAllGenres();
    _tvShows = _tvController.getTVShowsByGenre(_selectedGenreId);
  }

  void _selectGenre(int genreId) {
    setState(() {
      _selectedGenreId = genreId;
      _tvShows = _tvController.getTVShowsByGenre(_selectedGenreId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover TV Shows'),
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
            child: FutureBuilder<List<TVModel>>(
              future: _tvShows,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final tvShows = snapshot.data!;

                  return ListView.builder(
                    itemCount: tvShows.length,
                    itemBuilder: (context, index) {
                      final tvShow = tvShows[index];

                      return ListTile(
                        leading: Image.network(tvShow.posterUrl),
                        title: Text(tvShow.name),
                        subtitle: Text(tvShow.releaseDate),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => tv_detail(tvshow: tvShow),
                            ),
                          );
                        },
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("Failed to load TV shows : ${snapshot.error}");
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
