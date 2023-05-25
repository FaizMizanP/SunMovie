// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class CreateHeaderDrawer extends StatefulWidget {
  const CreateHeaderDrawer({super.key});

  @override
  _CreateHeaderDrawerState createState() => _CreateHeaderDrawerState();
}

class _CreateHeaderDrawerState extends State<CreateHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('lib/assets/images/duit.jpg'),
              ),
            ),
          ),
          const Text(
            "Faiz Mizan Pelu",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            "faizmizanpelu@gmail.com",
            style: TextStyle(color: Colors.grey[200], fontSize: 14),
          )
        ],
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget CreateDrawerList() {
  return Container(
    padding: const EdgeInsets.only(
      top: 15.0,
    ),
    child: Column(
      children: [menuItem()],
    ),
  );
}

Widget menuItem() {
  return Material(
    child: Column(
      children: [
        InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Icon(
                        Icons.login_outlined,
                        size: 22,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Icon(
                        Icons.home_outlined,
                        size: 22,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        "Home",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Icon(
                        Icons.movie_outlined,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        "Movies",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Icon(
                        Icons.tv_outlined,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        "TV Shows",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
