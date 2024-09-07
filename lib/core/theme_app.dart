import 'package:flutter/material.dart';

class ThemeApp{
  static ThemeData themDark = ThemeData(
    scaffoldBackgroundColor: Color(0xff06111C),
    fontFamily: "VALORANT",
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: Colors.white
      )
    )
  );
}