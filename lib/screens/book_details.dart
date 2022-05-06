import 'package:ebook_app/models/auth_user.dart';
import 'package:ebook_app/models/books_data.dart';
import 'package:ebook_app/services/database_service.dart';

import 'package:ebook_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class BookDetails extends StatelessWidget {
  final int _index;

  BookDetails({required int index}) : _index = index;

  void showAlert({required String message, required Color color}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      fontSize: 16,
    );
  }

  Future<String> _getData(String path) async {
    return await rootBundle.loadString(path);
  }

  Future<void> _addBookToUser(BuildContext context) async {
    final AuthUser user = Provider.of<AuthUser>(context, listen: false);
    DatabaseService databaseService = DatabaseService(uid: user.id);

    bool isExist = await databaseService.isBookExistInUser(
      bookID: BooksData.booksList[_index].id,
      bookName: BooksData.booksList[_index].title,
    );

    if (isExist) {
      showAlert(message: "Already took this book", color: Colors.red);
      return;
    }

    int bookCount = await databaseService.getBooksCount();

    if (bookCount < 8) {
      databaseService.addData(
        bookID: BooksData.booksList[_index].id,
        bookName: BooksData.booksList[_index].title,
      );
      showAlert(message: "Subscribed!", color: Colors.green);

      if (BooksData.booksList[_index].readersQueue.length < 8) {
        BooksData.booksList[_index].readersQueue.add(user.id.toString());
      }
    } else {
      showAlert(message: "Took too many books", color: Colors.yellow);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                            size: 24,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.black,
                            size: 24,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.40,
                    height: MediaQuery.of(context).size.height * 0.30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                      child: Image.asset(
                        BooksData.booksList[_index].imagePath,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 32.0, right: 32.0, top: 16.0),
                    child: Text(
                      BooksData.booksList[_index].title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "By ${BooksData.booksList[_index].author}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                    ),
                    elevation: 2.0,
                    margin: EdgeInsets.symmetric(horizontal: 32.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                      height: MediaQuery.of(context).size.height * 0.30,
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: FutureBuilder(
                          future: _getData(
                            BooksData.booksList[_index].descriptionPath,
                          ),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Text(
                                snapshot.data.toString(),
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              );
                            }
                            return CircularProgressIndicator();
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.39,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            onPressed: () async {
                              _addBookToUser(context);
                            },
                            child: Text(
                              "Subscribe",
                              style: TextStyle(color: Colors.black87),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.39,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            child: Text(
                              "Readers list",
                              style: TextStyle(color: Colors.black87),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
