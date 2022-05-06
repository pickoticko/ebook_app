import 'package:flutter/material.dart';
import 'package:ebook_app/utilities/constants.dart';
import 'package:ebook_app/screens/book_details.dart';

class BookImage extends StatelessWidget {
  final int index;
  final String imagePath;

  BookImage({required this.index, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 20),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookDetails(index: index),
            ),
          );
        },
        child: Container(
          height: 210,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                spreadRadius: 3,
                blurRadius: 8,
              ),
            ],
            borderRadius: BorderRadius.circular(kDefaultBorderRadius),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(imagePath),
            ),
          ),
        ),
      ),
    );
  }
}
