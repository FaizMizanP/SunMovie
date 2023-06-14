import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sunmovie/views/homepage_view.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: view_homepage(),
    );
  }
}
