// ignore_for_file: camel_case_types, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';


import '../utlise/color.dart';


class custome_bottom extends StatelessWidget {
   custome_bottom({
    required this.text,
    super.key, required this.onTap,required this.width,required this.margin
  });
String text;
double?width;
double margin;
final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                  onTap: (){},
                  child: Container(
                    width: width,
                    margin: EdgeInsets.only(top:margin),
                    decoration: BoxDecoration(
                        color: Appcolor.primary,
                        borderRadius: BorderRadius.circular(10),
                    ),
                    
                    padding: EdgeInsets.all(12),
                    child: Text(text),
                  ),
                );
}}