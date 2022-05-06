import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ebook_app/services/authentication_service.dart';
import 'package:ebook_app/utilities/constants.dart';
import 'package:ebook_app/widgets/login/login_button.dart';
import 'package:ebook_app/widgets/login/login_text.dart';
import 'package:ebook_app/widgets/login/login_text_field.dart';
import 'package:ebook_app/models/auth_user.dart';
import 'package:ebook_app/screens/registration_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _loginButtonAction(BuildContext context) async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      return;
    }

    print('Login is accessed');

    AuthUser? user = await Provider.of<AuthenticationService>(
      context,
      listen: false,
    ).signIn(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    if (user == null) {
      print("Sign in is not successful!");
    } else {
      _emailController.clear();
      _passwordController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Container(
            child: SvgPicture.asset(
              'assets/images/icons/book_icon.svg',
              color: kDarkestColor,
            ),
            width: 110,
            height: 110,
          ),
          SizedBox(height: 20),
          LoginText(text: 'Login to account'),
          SizedBox(height: 20),
          LoginTextField(
            controller: _emailController,
            hint: 'Email',
            secureInput: false,
            inputType: TextInputType.text,
            iconPath: 'assets/images/icons/email_icon.svg',
          ),
          SizedBox(height: 20),
          LoginTextField(
            controller: _passwordController,
            hint: 'Password',
            secureInput: true,
            inputType: TextInputType.text,
            iconPath: 'assets/images/icons/key_icon.svg',
          ),
          SizedBox(height: 20),
          LoginButton(
            title: 'Login',
            buttonColor: kPrimaryColor,
            onButtonTapped: () {
              context.read<AuthenticationService>().signIn(
                    email: _emailController.text.trim(),
                    password: _passwordController.text.trim(),
                  );
            },
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegistrationPage(),
                ),
              );
            },
            child: Text(
              "Don't have an acount? Sign up",
              style: TextStyle(
                color: kDarkestColor,
                decoration: TextDecoration.underline,
                decorationThickness: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
