import 'package:flutter/material.dart';

import 'element/text_theme.dart';

// ignore: non_constant_identifier_names
ThemeData DarkThemeData() {
  return ThemeData(
    brightness: Brightness.dark, //Setting the Brightness to Dark  so that this can be used as Dark ThemeData
    scaffoldBackgroundColor: Colors.black,
    textTheme:
        CustomTextTheme.textThemeDark, //Setting the Text Theme to DarkTextTheme

    // appBarTheme: const AppBarTheme(centerTitle: true),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
      centerTitle: true,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
    )),



      scrollbarTheme: const ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(Colors.yellowAccent),
        thumbVisibility: MaterialStateProperty.all<bool>(true),

      )




    // bottomAppBarColor:
  );







    //! You Can Set All Your Custom Dark Theme Here


}
