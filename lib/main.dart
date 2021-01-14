import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/home.dart';

final ThemeData _appTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    brightness: Brightness.dark,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.black54,
      splashColor: Colors.green[500],
      textTheme: ButtonTextTheme.accent,
    ),
    textTheme: _appTextTheme(base.textTheme)
  );
}

TextTheme _appTextTheme(TextTheme base){
  return base.copyWith(
    bodyText2: base.bodyText1.copyWith(
      fontSize: 25,
      // fontFamily: "Redressed",
      // fontStyle: FontStyle.italic,
      color: Colors.cyanAccent[100]
    ),
    headline2: base.bodyText1.copyWith(
        fontSize: 25,
        // fontFamily: "Redressed",
        // fontStyle: FontStyle.italic,
        color: Colors.cyanAccent[100]
    ),
    headline1: base.headline1.copyWith(
      fontSize: 30,
      color: Colors.pink,
      fontWeight: FontWeight.bold
    ),
    button: base.button.copyWith(
      color: Colors.pink,
        fontSize: 16,
        // fontFamily: "Redressed",
      letterSpacing: 3.0,
      decoration: TextDecoration.underline
    ),
  ).apply(
    fontFamily: "Redressed",
  ) ;
}

void main()=> runApp(new MaterialApp(
  debugShowCheckedModeBanner: false,

  theme: _appTheme,

  // theme: ThemeData(
  //   brightness: Brightness.dark,
  //   textTheme: TextTheme(
  //     bodyText2: TextStyle(
  //       color: Colors.white,
  //       fontSize: 20,
  //       fontWeight: FontWeight.bold
  //     ),
  //
  //     button: TextStyle(
  //       fontSize: 20,
  //         color: Colors.black54,
  //     ),
  //
  //   )
  // ),
  home: QuizApp(),
));


