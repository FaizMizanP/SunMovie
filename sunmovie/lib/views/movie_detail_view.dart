import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sunmovie/models/film_model.dart';

// ignore: camel_case_types
class movie_detail extends StatelessWidget {
  final MovieModel movie;

  const movie_detail({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(movie.title),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(movie.posterUrl),
            fit: BoxFit.fill,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 60.0,
              right: 60.0,
              top: 80.0,
            ),
            child: Column(
              children: [
                Text(
                  movie.overview,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Release Date : ${movie.releaseDate}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
