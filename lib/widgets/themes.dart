import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.red,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      canvasColor: creamColor,
      dialogBackgroundColor: redishColor,
      focusColor: redishColor,
      dividerColor: Colors.white,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.red),
        toolbarTextStyle: Theme.of(context).textTheme.bodyMedium,
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkredishColor,
      dialogBackgroundColor: darkredishColor,
      focusColor: Colors.white,
      dividerColor: Colors.white,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 113, 203, 245)),
        toolbarTextStyle: Theme.of(context).textTheme.bodyMedium,
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
      ));
//colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkcreamColor = const Color.fromARGB(255, 95, 141, 241);
  static Color redishColor = Color.fromARGB(255, 236, 18, 18);
  static Color darkredishColor = Color.fromARGB(255, 113, 203, 245);
  static Color lightredishColor = Vx.gray900;
}
