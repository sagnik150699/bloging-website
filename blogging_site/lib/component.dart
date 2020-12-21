import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Variables {
  Card cards(double size, color, String str, cardColor) {
    return Card(
      color: cardColor,
      elevation: 0,
      child: Text(
        str,
        textAlign: TextAlign.center,
        style: GoogleFonts.oswald(
            fontSize: size,
            color: color),
      ),
    );
  }
  List<Widget> item = [
  Image(
  height: 300,
  image: AssetImage('images/cropped7.png'),
  ),
  Image(
  height: 200,
  image: AssetImage('images/cropped1.png'),
  ),
  Image(
  height: 300,
  image: AssetImage('images/cropped4.png'),
  ),];
}