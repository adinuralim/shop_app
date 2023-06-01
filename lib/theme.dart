import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/constants.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: "Muli",
      appBarTheme: appBarTheme(),
      textTheme: textTheme(),
      inputDecorationTheme: inputDecorationTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity);
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
      color: Colors.white,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(color: Color(0xFF8B8B8B), fontSize: 18));
}

TextTheme textTheme() {
  return const TextTheme(
      bodySmall: TextStyle(color: kTextColor),
      bodyLarge: TextStyle(color: kTextColor));
}

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 36, vertical: 16),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        gapPadding: 10,
        borderSide: BorderSide(color: kTextColor)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        gapPadding: 10,
        borderSide: BorderSide(color: kTextColor)),
    errorBorder: OutlineInputBorder(
        gapPadding: 10,
        borderRadius: BorderRadius.circular(28),
        borderSide: BorderSide(color: Colors.red)),
    focusedErrorBorder: OutlineInputBorder(
        gapPadding: 10,
        borderRadius: BorderRadius.circular(28),
        borderSide: BorderSide(color: Colors.red)),
  );
}
