import 'package:date_picker_timeline/extra/color.dart';
import 'package:flutter/material.dart';

TextStyle gettitlestyle({double? fontSize,Color ?color, FontWeight? fontwigth,}){
  return TextStyle(
    fontFamily:'poppins',
    fontSize: fontSize?? 18,
    color: color?? Colors.black,
    fontWeight: fontwigth?? FontWeight.bold,
  );
}

TextStyle getBodyTextStyle(BuildContext context,
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontFamily: 'Poppins',
    fontSize: fontSize ?? 16,
    color: color ?? Theme.of(context).colorScheme.onSurface,
  );
}

TextStyle getSmallTextStyle(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontFamily: 'Poppins',
    fontSize: fontSize ?? 14,
    color: color ?? AppColors.defaultMonthColor,
  );
}