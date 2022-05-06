import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook_app/models/auth_user.dart';
import 'package:ebook_app/services/database_service.dart';
import 'package:ebook_app/widgets/home/favorites_section/favorite_book_card.dart';
import 'package:flutter/material.dart';
import 'package:ebook_app/utilities/constants.dart';
import 'package:provider/provider.dart';

class MyBooksViewBody extends StatelessWidget {
  List<int> favoriteBooksID = [];

  MyBooksViewBody();

  Future<void> initializeFavoriteBooks(BuildContext context) async {
    final AuthUser user = Provider.of<AuthUser>(context, listen: false);
    DatabaseService databaseService = DatabaseService(uid: user.id);

    favoriteBooksID = await databaseService.getAllUserBooksID();
  }

  @override
  Widget build(BuildContext context) {
    initializeFavoriteBooks(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: kDarkestColor,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Reading list',
                  style: TextStyle(
                    color: kBackgroundColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                  ),
                ),
              ),
              FutureBuilder(
                future: initializeFavoriteBooks(context),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return Expanded(
                    child: ListView.builder(
                      padding:
                          EdgeInsets.only(left: 24.0, right: 24.0, top: 16),
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: favoriteBooksID.length,
                      itemBuilder: (context, index) {
                        return FavoriteBookCard(
                          index: favoriteBooksID[index],
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
