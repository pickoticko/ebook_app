import 'package:flutter/material.dart';
import 'package:ebook_app/utilities/constants.dart';
import 'package:ebook_app/screens/sections/books_section.dart';
import 'package:ebook_app/screens/sections/favorites_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final bodies = [
    BookViewBody(),
    MyBooksViewBody(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodies[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kBackgroundColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kDarkestColor,
        unselectedItemColor: kSecondaryColor,
        selectedFontSize: 14.0,
        unselectedFontSize: 14.0,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Books',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections_bookmark),
            label: 'My Books',
          ),
        ],
      ),
    );
  }
}
