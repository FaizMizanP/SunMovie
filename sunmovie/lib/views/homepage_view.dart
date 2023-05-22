import 'package:flutter/material.dart';
import 'package:sunmovie/controllers/homepage_controller.dart';
import 'package:sunmovie/views/drawer_view.dart';
import 'package:sunmovie/views/search_view.dart';

// ignore: camel_case_types
class view_homepage extends StatelessWidget {
  const view_homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [const CreateHeaderDrawer(), CreateDrawerList()],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 10,
        title: Center(
          child: Expanded(
            child: Image.asset('lib/assets/images/logo3.jpg', height: 35),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
          )
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'lib/assets/images/Fakta-Game-The-Last-of-Us-yang-Diadaptasi-jadi-Serial-HBO.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 200,
                child: Row(
                  children: [
                    SizedBox(
                      width: 50,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_circle_left_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {}, //isi entar
                      ),
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "The Last of Us",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'When youre lost in the darkness, look for the light.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(elevation: 2),
                          onPressed: () {}, //isi entar
                          child: const Text('Detail'),
                        )
                      ],
                    )),
                    SizedBox(
                      width: 50,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_circle_right_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Top 10 Movies',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      )
                    ],
                  )),
              const SizedBox(
                child: Top10MoviesScreen(),
              ),
              const SizedBox(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Top 10 TV Shows',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      )
                    ],
                  )),
              const SizedBox(
                child: Top10TvScreen(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
