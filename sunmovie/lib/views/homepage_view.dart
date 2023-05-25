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
        children: const [
          Column(
            children: [
              TrendingController(),
              SizedBox(
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
              SizedBox(
                child: Top10MoviesScreen(),
              ),
              SizedBox(
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
              SizedBox(
                child: Top10TvScreen(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
