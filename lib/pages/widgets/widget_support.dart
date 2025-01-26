import 'package:flutter/material.dart';

class fontSetting {
  static TextStyle boldFont() {
    return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
        fontFamily: 'poppins',
        color: Colors.black);
  }

  static TextStyle headerFont() {
    return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        fontFamily: 'poppins',
        color: Colors.black);
  }

  static TextStyle lightFont() {
    return TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        fontFamily: 'poppins',
        color: Colors.grey,
        letterSpacing: 1);
  }

  static TextStyle semiboldFont() {
    return TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 18,
      fontFamily: 'poppins',
      color: Colors.black,
    );
  }

  static TextStyle disFont() {
    return TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 16,
        fontFamily: 'poppins',
        color: Colors.black54);
  }
}
