// ignore_for_file: camel_case_types, dead_code, prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:taskati/core/utlise/function.dart';

class custome_Form extends StatelessWidget {
  final String? text;
  final String? description;

  custome_Form({super.key, required this.text, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15,),
        Text(text!,style: gettitlestyle(),),
        SizedBox(height: 15,),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: (description),
          ),
        ),
      ],
    );
  }
}