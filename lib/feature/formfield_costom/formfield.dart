// ignore_for_file: camel_case_types, dead_code, prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:taskati/core/utlise/function.dart';

class custome_Form extends StatefulWidget {
  final String? text;
  final String? description;

  custome_Form({super.key, required this.text,required this.icon,required this.read, required this.description,required this.line});
int? line;
IconData?icon;
bool read;


  @override
  State<custome_Form> createState() => _custome_FormState();
}

class _custome_FormState extends State<custome_Form> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15,),
        Text(widget.text!,style:gettitlestyle()),
        SizedBox(height: 15,),
        TextFormField(
          onTap: (){
            
          },
          readOnly: widget.read,
          maxLines: widget.line,
          decoration: InputDecoration(
            suffixIcon:Icon(widget.icon),
            suffixIconColor: Colors.black,
            border: OutlineInputBorder(),
            hintText: (widget.description),
          ),
        ),
      ],
    );
  }
}