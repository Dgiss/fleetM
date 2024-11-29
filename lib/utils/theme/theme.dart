import 'package:fleet_watcher_mobile/utils/theme/custums_themes/app_bar_theme.dart';
import 'package:fleet_watcher_mobile/utils/theme/custums_themes/bottom_sheet_theme.dart';
import 'package:fleet_watcher_mobile/utils/theme/custums_themes/checkbox_theme.dart';
import 'package:fleet_watcher_mobile/utils/theme/custums_themes/chip_theme.dart';
import 'package:fleet_watcher_mobile/utils/theme/custums_themes/elevat_buton_theme.dart';
import 'package:fleet_watcher_mobile/utils/theme/custums_themes/outlined_btn.dart';
import 'package:fleet_watcher_mobile/utils/theme/custums_themes/text_field_theme.dart';
import 'package:fleet_watcher_mobile/utils/theme/custums_themes/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    chipTheme: Chiptheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: Appbartheme.lightAppBarTheme,
    checkboxTheme: Checkboxtheme.lightCheckboxTheme,
    bottomSheetTheme: Bottomsheettheme.lightBottomSheetTheme,
    outlinedButtonTheme: Outlinedbtn.lightOutlinedButtonTheme,
    textTheme: TtextTheme.lightTextTheme,
    elevatedButtonTheme: ElevatBtnTheme.lightElevatBtnTheme,
    inputDecorationTheme: Textfieldtheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    chipTheme: Chiptheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: Appbartheme.lightAppBarTheme,
    checkboxTheme: Checkboxtheme.darkCheckboxTheme,
    inputDecorationTheme: Textfieldtheme.darkInputDecorationTheme,
    bottomSheetTheme: Bottomsheettheme.lightBottomSheetTheme,
    textTheme: TtextTheme.darkTextTheme,
    outlinedButtonTheme: Outlinedbtn.darkOutlinedButtonTheme,
    elevatedButtonTheme: ElevatBtnTheme.darkElevatBtnTheme,
  );
}
