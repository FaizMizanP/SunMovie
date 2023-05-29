import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sunmovie/models/film_model.dart';

// ignore: camel_case_types
class tv_detail extends StatelessWidget {
  final TVModel tvshow;

  const tv_detail({Key? key, required this.tvshow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(tvshow.name),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(tvshow.posterUrl),
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
                  tvshow.overview,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Release Date : ${tvshow.releaseDate}",
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
