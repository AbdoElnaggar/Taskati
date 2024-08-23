import 'package:flutter/material.dart';

TextStyle gettitlestyle({double? fontSize,Color ?color, FontWeight? fontwigth,}){
  return TextStyle(
    fontFamily:'poppins',
    fontSize: fontSize?? 18,
    color: color?? Colors.black,
    fontWeight: fontwigth?? FontWeight.bold,
  );
}