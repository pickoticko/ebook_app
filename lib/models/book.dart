import 'user.dart';

class Book {
  List<String> readersQueue = [];

  final int id;
  final String title;
  final String author;
  final String imagePath;
  final String descriptionPath;
  final String downloadCloudPath;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.imagePath,
    required this.descriptionPath,
    required this.downloadCloudPath,
  });
}
