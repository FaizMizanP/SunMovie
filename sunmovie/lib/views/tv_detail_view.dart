import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sunmovie/models/tv_model.dart';

// ignore: camel_case_types
class tv_detail extends StatelessWidget {
  final TVModel tvshow;

  const tv_detail({Key? key, required this.tvshow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          tvshow.name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 2,
                offset: const Offset(1, 1),
              )
            ],
          ),
        ),
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
          filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 60.0,
              right: 60.0,
              top: 80.0,
            ),
            child: Column(
              children: [
                Center(
                  child: Image.asset('lib/assets/images/logo utama.png',
                      height: 200),
                ),
                Text(
                  tvshow.overview,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 2,
                        offset: const Offset(1, 1),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(blurRadius: 5.0),
                            ],
                            border: Border.all(
                              color: Colors.white,
                              style: BorderStyle.solid,
                              width: 6,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              tvshow.releaseDate.substring(0, 4),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(blurRadius: 5.0),
                            ],
                            border: Border.all(
                              color: Colors.white,
                              style: BorderStyle.solid,
                              width: 6,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              tvshow.voteAverage.toString().substring(0, 3),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
