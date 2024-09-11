import 'package:flutter/material.dart';

class AppWidget {

  static TextStyle boldTextFieldStyle() {
    return TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
      fontFamily: 'Poppins',
    );
  }

  static TextStyle HeadlineTextFieldStyle() {
    return TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 24.0,
      fontFamily: 'Poppins',
    );
  }

  static TextStyle LightTextFieldStyle() {
    return TextStyle(
      color: Colors.black45,
      fontWeight: FontWeight.w500,
      fontSize: 15.0,
      fontFamily: 'Poppins',
    );
  }

  static TextStyle SemiBoldTextFieldStyle() {
    return TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: 18.0,
      fontFamily: 'Poppins',
    );
  }

}