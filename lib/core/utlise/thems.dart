// ignore_for_file: unused_import, duplicate_import, prefer_const_constructors

import 'package:date_picker_timeline/extra/color.dart';
import 'package:flutter/material.dart';
import 'package:taskati/core/utlise/color.dart';
import 'package:taskati/core/utlise/function.dart';
import'color.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor:Colors.white,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white, centerTitle: true),
      colorScheme: ColorScheme.fromSeed(
        seedColor:Appcolor.primary,
        onSurface: Appcolor.darkcolor,
      ),
      
      datePickerTheme:  DatePickerThemeData(
        backgroundColor: Colors.white,
        headerForegroundColor:Appcolor.redcolor,
      ),
      timePickerTheme: TimePickerThemeData(
        backgroundColor:Colors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        //hintStyle:gettitlestyle(),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:  BorderSide(
              color:Color(0xff4E5AE8),
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:  BorderSide(
              // color: Appcolor.primary,
              color: Color(0xff4E5AE8),
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:  BorderSide(
              color:Appcolor.redcolor,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:  BorderSide(
              color:Appcolor.redcolor,
            )),
      ));







 static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor:Appcolor.darkcolor,
      appBarTheme:  AppBarTheme(
          backgroundColor:Appcolor.darkcolor, centerTitle: true),
      colorScheme: ColorScheme.fromSeed(
        seedColor: Appcolor.primary,
        onSurface:Colors.white,
      ),
      datePickerTheme:  DatePickerThemeData(
          backgroundColor:Appcolor.darkcolor,
          headerForegroundColor:Appcolor.primary),
      timePickerTheme:  TimePickerThemeData(
          backgroundColor:Appcolor.primary,
          dialBackgroundColor: Appcolor.darkcolor,
          hourMinuteTextColor:Appcolor.primary,
          dayPeriodColor: Appcolor.darkcolor,
          hourMinuteColor: Appcolor.darkcolor,
          dayPeriodTextColor:Appcolor.primary),
      inputDecorationTheme: InputDecorationTheme(
        //  hintStyle: getSmallTextStyle(),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:  BorderSide(
              color:Appcolor.primary,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:  BorderSide(
              color:Appcolor.primary,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:  BorderSide(
              color:Appcolor.redcolor,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:  BorderSide(
              color:Appcolor.redcolor,
            )),
      ));

      }