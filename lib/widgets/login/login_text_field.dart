import 'package:flutter/material.dart';
import 'package:ebook_app/utilities/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginTextField extends StatelessWidget {
  String? hint;
  String iconPath;
  bool secureInput;
  TextInputType inputType;
  TextEditingController controller;

  LoginTextField({
    required this.hint,
    required this.secureInput,
    required this.inputType,
    required this.controller,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kLoginPageDefaultPadding),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(kDefaultBorderRadius),
              ),
            ),
            child: TextField(
              style: TextStyle(color: Colors.white),
              controller: controller,
              obscureText: secureInput,
              keyboardType: inputType,
              cursorColor: kSecondaryColor,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 10.0),
                  child: SvgPicture.asset(
                    iconPath,
                    fit: BoxFit.scaleDown,
                    height: 1,
                    color: kDarkestColor,
                  ),
                ),
                fillColor: kLoginTextFieldFillColor,
                filled: true,
                hintText: hint,
                hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 13.0,
                  horizontal: 10.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
