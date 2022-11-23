import 'package:flutter/material.dart';

class FilmesAppUiConfig {
  FilmesAppUiConfig._(); //Não permite que a classe seja instanciada (construtor default privado)

  static String get title => 'Filmes App';
  static ThemeData get theme => ThemeData(
        fontFamily: 'Metropolis',
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Color(0xff222222),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
}
