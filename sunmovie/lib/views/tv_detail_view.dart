import 'package:flutter/material.dart';
import 'package:sunmovie/models/film_model.dart';

// ignore: camel_case_types
class tv_detail extends StatelessWidget {
  final TVModel tvshow;

  const tv_detail({Key? key, required this.tvshow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tvshow.name),
      ),
      body: Column(
        children: [
          Image.network(tvshow.posterUrl),
          Text(tvshow.name),
          Text(tvshow.releaseDate),
          // Tambahkan informasi detail lainnya
        ],
      ),
    );
  }
}
