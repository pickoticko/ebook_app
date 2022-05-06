import 'dart:io';
import 'package:ebook_app/models/books_data.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:ebook_app/utilities/constants.dart';
import 'package:path_provider/path_provider.dart';

class FavoriteBookCard extends StatelessWidget {
  int _index = 0;

  FavoriteBookCard({required int index}) : _index = index;

  Future<void> downloadFileExample() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    File downloadToFile = File('${appDocDir.path}/downloaded1.pdf');
    String fileToDownload = BooksData.booksList[_index].downloadCloudPath;

    print(downloadToFile);

    try {
      await FirebaseStorage.instance
          .ref(fileToDownload)
          .writeToFile(downloadToFile)
          .then((p0) => print("SUCCESS"));
    } on FirebaseException catch (e) {
      print('Download error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        downloadFileExample();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kDefaultBorderRadius),
          color: kBackgroundColor,
        ),
        margin: EdgeInsets.only(bottom: 20),
        height: 80,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    BooksData.booksList[_index].imagePath,
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  BooksData.booksList[_index].title,
                  style: TextStyle(
                    overflow: TextOverflow.fade,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  BooksData.booksList[_index].author,
                  style: TextStyle(
                    overflow: TextOverflow.fade,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
