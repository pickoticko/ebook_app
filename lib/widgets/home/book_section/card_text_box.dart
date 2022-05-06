import 'package:flutter/material.dart';
import 'package:ebook_app/utilities/constants.dart';

class TextBox extends StatelessWidget {
  final Color _fontColor;
  final String _text;
  final double _fontSize;

  TextBox(
      {required String text,
      Color fontColor = Colors.black87,
      double fontSize = 15.0})
      : _text = text,
        _fontSize = fontSize,
        _fontColor = fontColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kDefaultBookCoverWidth,
      child: Text(
        _text,
        maxLines: 1,
        softWrap: false,
        overflow: TextOverflow.fade,
        style: TextStyle(
          color: _fontColor,
          fontSize: _fontSize,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
