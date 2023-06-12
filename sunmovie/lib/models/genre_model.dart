// ignore: camel_case_types
class genreModel {
  final int id;
  final String name;

  genreModel({
    required this.id,
    required this.name,
  });

  factory genreModel.fromJson(Map<String, dynamic> json) {
    return genreModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
