import 'package:flutter/material.dart';

import 'element/text_theme.dart';



extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

// ignore: non_constant_identifier_names
ThemeData LightThemeData() {
  return ThemeData(
    brightness: Brightness
        .light, //Setting the Brightness to light  so that this can be used as Light ThemeData
    scaffoldBackgroundColor:const Color(0xFF18FFFF),
    // '#41a7d2'.toColor(),
        // .blueGrey.shade200,
    textTheme: CustomTextTheme
        .textThemeLight, //Setting the Text Theme to LightTextTheme
    // textTheme: GoogleFonts.secularOneTextTheme(),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF18FFFF),
      // Colors.white,
      elevation: 0,
      centerTitle: true,
    ),


    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
    )),

      scrollbarTheme: const ScrollbarThemeData().copyWith(
        thumbColor: MaterialStateProperty.all(Colors.pink,),
        thumbVisibility: MaterialStateProperty.all<bool>(true),
      ),
  //   iconTheme: IconThemeData(
  // color: Colors.yellow),
  // const IconThemeData( color: Colors.yellow),



);
}



