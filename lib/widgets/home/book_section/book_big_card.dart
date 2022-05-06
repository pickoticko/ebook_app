import 'package:flutter/material.dart';
import 'package:ebook_app/widgets/home/book_section/card_text_box.dart';
import 'package:ebook_app/widgets/home/book_section/book_image.dart';
import 'package:ebook_app/models/books_data.dart';
import 'package:ebook_app/utilities/constants.dart';

class BigBookCard extends StatelessWidget {
  final int _index;

  BigBookCard({required int index}) : _index = index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BookImage(
          index: _index,
          imagePath: BooksData.booksList[_index].imagePath,
        ),
        SizedBox(height: 8),
        TextBox(
          text: BooksData.booksList[_index].title,
          fontSize: 15.0,
        ),
        TextBox(
          text: BooksData.booksList[_index].author,
          fontSize: 11.0,
          fontColor: kAuthorFontColor,
        ),
      ],
    );
  }
}
