import 'package:flutter/material.dart';

class MyColors {
  MyColors._();
  //basic color
  static const Color primary = Color(0xFF4b68FF);
  static const Color secondary = Color(0xFFFFE248);
  static const Color accent = Color(0xFFb0c7ff);
  //textColors
  static const Color textprimary = Color(0xFF333333);
  static const Color textsecodary = Color(0xFF6C7570);
  static const Color textWhite = Colors.white;
  //backgroundColors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBg = Color(0xFFF3F5FF);
  //bg Containers
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContaner = MyColors.white.withOpacity(.1);

  //Btn Colors
  static const Color btnPrimary = Color(0xFF4b68ff);
  static const Color btnSecondary = Color(0xFF6C757D);
  static const Color btnDisabled = Color(0xFFC4C4C4);

  //border Colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  //Errore && valid
  static const Color error = Color(0xFFD32F2F);
  static const Color sucess = Color(0xFF388E3C);
  static const Color darkSucess = Color.fromARGB(255, 3, 248, 15);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  //neutral
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);

  //inputColor
  static const Color gris = Color(0xFFF5F5F5);
}
