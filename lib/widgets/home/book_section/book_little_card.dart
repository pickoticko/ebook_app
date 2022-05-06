import 'package:ebook_app/models/books_data.dart';
import 'package:flutter/material.dart';
import 'package:ebook_app/utilities/constants.dart';
import 'package:ebook_app/screens/book_details.dart';

class LittleBookCard extends StatelessWidget {
  final int index;

  LittleBookCard({
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetails(index: index),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        height: 80,
        width: MediaQuery.of(context).size.width - 50,
        color: kBackgroundColor,
        child: Row(
          children: [
            Container(
              height: 81,
              width: 62,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                image: DecorationImage(
                  image: AssetImage(
                    BooksData.booksList[index].imagePath,
                  ),
                ),
              ),
            ),
            SizedBox(width: 21),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  BooksData.booksList[index].title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 5),
                Text(BooksData.booksList[index].author),
                SizedBox(height: 5),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
