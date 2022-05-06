import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'package:ebook_app/services/authentication_service.dart';
import 'package:ebook_app/screens/landing_page.dart';
import 'package:ebook_app/models/auth_user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate();
  runApp(const HappyLifeApp());
}

class HappyLifeApp extends StatelessWidget {
  const HappyLifeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(),
        ),
        StreamProvider<AuthUser?>.value(
          value: AuthenticationService().getCurrentUser,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        title: 'Happy Life',
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        debugShowCheckedModeBanner: false,
        home: LandingPage(),
      ),
    );
  }
}
