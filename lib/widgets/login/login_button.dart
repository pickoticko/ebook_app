import 'package:flutter/material.dart';
import 'package:ebook_app/utilities/constants.dart';

class LoginButton extends StatelessWidget {
  LoginButton(
      {required this.title,
      required this.buttonColor,
      required this.onButtonTapped});

  final String title;
  final Color buttonColor;
  final VoidCallback onButtonTapped;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kLoginPageDefaultPadding),
      child: Container(
        child: MaterialButton(
          minWidth: double.infinity,
          height: kLoginButtonHeight,
          onPressed: onButtonTapped,
          color: kSecondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              kDefaultBorderRadius,
            ),
          ),
          child: Text(
            title,
            style: kLoginButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
