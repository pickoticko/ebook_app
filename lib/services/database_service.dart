import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook_app/services/authentication_service.dart';

class DatabaseService {
  final String? uid;

  DatabaseService({required this.uid});

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> addData({required int bookID, required String bookName}) async {
    usersCollection
        .doc(uid)
        .collection('books')
        .doc((await getBooksCount()).toString())
        .set({
          'bookID': bookID,
          'bookName': bookName,
        })
        .then((value) => print("Successfully added book"))
        .catchError((error) => print("Failed to add book"));
  }

  Future<bool> isBookExistInUser({
    required int bookID,
    required String bookName,
  }) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await usersCollection
        .doc(uid)
        .collection('books')
        .where('bookID', isEqualTo: bookID)
        .get();

    if (snapshot.docs.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  Future<int> getBooksCount() async {
    return (await usersCollection.doc(uid).collection('books').get()).size;
  }

  Future getAllUserBooksID() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await usersCollection.doc(uid).collection('books').get();

    List<int> allBooksID = [];

    await usersCollection.doc(uid).collection('books').get().then((snapshot) {
      for (int i = 0; i < snapshot.docs.length; i++) {
        allBooksID.add(snapshot.docs[i].data()['bookID']);
      }
    });

    return allBooksID;
  }
}
