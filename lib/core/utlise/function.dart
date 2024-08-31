// ignore_for_file: unused_import

import 'package:date_picker_timeline/extra/color.dart';
import 'package:flutter/material.dart';

TextStyle gettitlestyle(BuildContext? context,
{double? fontSize,Color ?color, FontWeight? fontwigth,}){
  return TextStyle(
    fontFamily:'poppins',
    fontSize: fontSize?? 18,
    fontWeight: fontwigth?? FontWeight.bold,
    color: color ?? Theme.of(context!).colorScheme.onSurface,
  );
}

TextStyle getBodyTextStyle(BuildContext? context,
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontFamily: 'Poppins',
    fontSize: fontSize ?? 16,
    color: color ?? Theme.of(context!).colorScheme.onSurface,
  );
}

TextStyle getSmallTextStyle(
  BuildContext? context,
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontFamily: 'Poppins',
    fontSize: fontSize ?? 14,
    color: color ?? Theme.of(context!).colorScheme.onSurface,
  );
}