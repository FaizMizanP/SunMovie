import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CustomSearchDelegate extends SearchDelegate<String> {
  final String apiKey = "2b106eac51c7ebba580862759524ba9f";

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, query);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: _performSearch(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Failed to load search results'));
        } else if (snapshot.hasData) {
          final searchResults = snapshot.data!;
          return ListView.builder(
            itemCount: searchResults.length,
            itemBuilder: (context, index) {
              final result = searchResults[index];
              final title = result['title'] ?? result['name'] ?? '';
              final mediaType = result['media_type'] ?? '';

              return ListTile(
                title: Text(title),
                subtitle: Text(mediaType),
                onTap: () {
                  close(context, title);
                  // Navigasi atau aksi yang ingin dilakukan saat item dipilih
                },
              );
            },
          );
        } else {
          return Center(child: Text('No search results found'));
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(); // Tidak perlu menampilkan saran dalam contoh ini
  }

  Future<List<dynamic>> _performSearch(String query) async {
    final url =
        "https://api.themoviedb.org/3/search/multi?api_key=$apiKey&query=$query";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final List<dynamic> searchResults = decoded['results'];

      return searchResults;
    } else {
      throw Exception("Failed to perform search");
    }
  }
}
