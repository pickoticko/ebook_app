import 'package:ebook_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ebook_app/services/authentication_service.dart';
import 'package:ebook_app/widgets/home/book_section/heading_block.dart';
import 'package:ebook_app/widgets/home/book_section/book_little_card.dart';
import 'package:ebook_app/widgets/home/book_section/book_big_card.dart';

class BookViewBody extends StatefulWidget {
  const BookViewBody({Key? key}) : super(key: key);

  @override
  State<BookViewBody> createState() => _BookViewBodyState();
}

class _BookViewBodyState extends State<BookViewBody> {
  void _logOutButtonAction(BuildContext context) {
    Provider.of<AuthenticationService>(context).signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: ListView(
        children: [
          HeadingBlock(),
          BigBookList(),
          Padding(
            padding: EdgeInsets.only(left: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Popular',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            padding: EdgeInsets.only(top: 25, left: 15, right: 25),
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 7,
            itemBuilder: (context, index) {
              return LittleBookCard(index: index + 5);
            },
          ),
        ],
      ),
    );
  }
}

class BigBookList extends StatelessWidget {
  const BigBookList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 20),
        itemCount: 5,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return BigBookCard(index: index);
        },
      ),
    );
  }
}
