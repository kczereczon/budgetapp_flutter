import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';


class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData(
    // This is the theme of your application.
    //
    // Try running your application with "flutter run". You'll see the
    // application has a blue toolbar. Then, without quitting the app, try
    // changing the primarySwatch below to Colors.green and then invoke
    // "hot reload" (press "r" in the console where you ran "flutter run",
    // or simply save your changes to "hot reload" in a Flutter IDE).
    // Notice that the counter didn't reset back to zero; the application
    // is not restarted.
      backgroundColor: Colors.indigo[50],
      primarySwatch: Colors.indigo,
      primaryColorLight: Colors.white,
      primaryColorDark: Colors.indigo[50],
      primaryColor: Colors.indigo,
      iconTheme: IconThemeData(shadows: [Shadow(color: Colors.black12, blurRadius: 20)]),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.indigo,
      ),
      navigationBarTheme: const NavigationBarThemeData(backgroundColor: Colors.white),
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
          centerTitle: false,
          color: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(color: Colors.black)));

  static final _darkTheme = ThemeData(
      backgroundColor: Colors.black38,
      primarySwatch: Colors.indigo,
      primaryColorLight: Colors.grey[300],
      primaryColorDark: Colors.grey[800],
      primaryColor: Colors.indigo,
      iconTheme: IconThemeData(shadows: [Shadow(color: Colors.black12, blurRadius: 20)]),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.indigo,
      ),
      navigationBarTheme: const NavigationBarThemeData(backgroundColor: Colors.black54),
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
          centerTitle: false,
          color: Colors.black,
          elevation: 0,
          titleTextStyle: TextStyle(color: Colors.white)));

  /// Toggles the current brightness between light and dark.
  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }
}
