import 'package:flutter/material.dart';

import 'package:sunmovie/controllers/genre_controller.dart';
import 'package:sunmovie/models/genre_model.dart';

class AllGenresScreen extends StatefulWidget {
  const AllGenresScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AllGenresScreenState createState() => _AllGenresScreenState();
}

class _AllGenresScreenState extends State<AllGenresScreen> {
  final genreController _genreController = genreController();
  late Future<List<genreModel>> _genres;

  @override
  void initState() {
    super.initState();
    _genres = _genreController.getAllGenres();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Genres'),
      ),
      body: FutureBuilder<List<genreModel>>(
        future: _genres,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final genres = snapshot.data!;

            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: genres.length,
              itemBuilder: (context, index) {
                final genre = genres[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Aksi yang ingin dilakukan saat tombol genre ditekan
                      // Misalnya, navigasi ke halaman berdasarkan genre yang dipilih
                    },
                    child: Text(genre.name),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Failed to load genres"),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
