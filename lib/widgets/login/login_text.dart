import 'package:flutter/material.dart';
import 'package:ebook_app/utilities/constants.dart';

class LoginText extends StatelessWidget {
  String text;

  LoginText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kLoginPageDefaultPadding),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          text,
          style: kLoginLogoTextStyle,
        ),
      ),
    );
  }
}
