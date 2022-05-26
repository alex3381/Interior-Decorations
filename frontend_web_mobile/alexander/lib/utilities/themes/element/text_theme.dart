import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Custom Text Styles Class For Both Dark and Light Theme
class CustomTextTheme {
  //! Default Font is GoogleFonts.Ubuntu You can change it as your Need

  static const _textColorLight =
      Color(0xFF000000); // Light Theme Default Text Color
  static const _textColorDark =
      Color(0xFFFFFFFF); // Light Theme Default Text Color

  static TextTheme get textThemeLight {
    return _textTheme(textColor: _textColorLight);
  }

  static TextTheme get textThemeDark {
    return _textTheme(textColor: _textColorDark);
  }

  // Private Method For Text Theme so that we can change the vale for Both Dark And Light Theme
  static TextTheme _textTheme({required Color textColor}) {
    const FontWeight light = FontWeight.w400;
    const FontWeight medium = FontWeight.w500;
    const FontWeight regular = FontWeight.w400;

    return TextTheme(
      headline1: GoogleFonts.ubuntu(
        fontSize: 12,
        color: textColor,
        fontWeight: light,
        letterSpacing: -0.5,
      ),
      headline2: GoogleFonts.ubuntu(
        color: textColor,
        fontSize: 25,
        fontWeight: light,
        letterSpacing: 2.0,
      ),
      headline3: GoogleFonts.ubuntu(
        color: textColor,
        fontSize: 48,
        fontWeight: regular,
        letterSpacing: 0.0,
      ),
      headline4: GoogleFonts.ubuntu(
        color: textColor,
        fontSize: 38,
        fontWeight: regular,
        letterSpacing: 1.0,
      ),
      headline5: GoogleFonts.ubuntu(
        color: textColor,
        fontSize: 20,
        fontWeight: regular,
        letterSpacing: 0.0,
      ),
      headline6: GoogleFonts.ubuntu(
        color: textColor,
        fontSize: 12,
        fontWeight: medium,
        letterSpacing: 0.15,
      ),

      bodyText1: GoogleFonts.ubuntu(
        color: textColor,
        fontSize: 16,
        fontWeight: regular,
        letterSpacing: 0.5,
      ),
      bodyText2: GoogleFonts.ubuntu(
        color: textColor,
        fontSize: 14,
        fontWeight: regular,
        letterSpacing: 0.25,
      ),
      button: GoogleFonts.ubuntu(
        color: textColor,
        fontSize: 14,
        fontWeight: medium,
        letterSpacing: 1.25,
      ),
      caption: GoogleFonts.ubuntu(
        color: textColor,
        fontSize: 12,
        fontWeight: regular,
        letterSpacing: 0.4,
      ),
      overline: GoogleFonts.ubuntu(
        color: textColor,
        fontSize: 7,
        fontWeight: regular,
        // letterSpacing: 1.5,
      ),


      subtitle1: GoogleFonts.ubuntu(
        fontSize: 10,
        color: textColor,
        fontWeight: medium,
          // letterSpacing: 0.5,
          fontStyle: FontStyle.normal

      ),


      subtitle2: GoogleFonts.ubuntu(
        fontSize: 6,
        color: textColor,
        fontWeight: light,
        // letterSpacing: -0.5,
      ),
      // : GoogleFonts.ubuntu(
      //   fontSize: 20,
      //   color: Colors.blueGrey,
      //   fontWeight: _light,
      //   letterSpacing: -0.5,
      // ),

      // bodySmall: GoogleFonts.ubuntu(
      //   color: textColor,
      //   fontSize: 25,
      //   fontWeight: _medium,
      //   letterSpacing: 0.15,
      // ),

    );
  }
}
