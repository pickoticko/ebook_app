import 'package:flutter/material.dart';
import 'package:ebook_app/screens/home_page.dart';
import 'package:ebook_app/screens/login_page.dart';
import 'package:ebook_app/models/auth_user.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthUser? user = Provider.of<AuthUser?>(context);
    final bool _isLoggedIn = user != null;

    return _isLoggedIn ? HomePage() : LoginPage();
  }
}
