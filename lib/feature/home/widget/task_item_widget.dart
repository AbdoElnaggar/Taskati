// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:taskati/core/model/model_taskbox.dart';
import 'package:taskati/core/utlise/color.dart';
import 'package:taskati/core/utlise/function.dart';

class home_task_item extends StatelessWidget {
  const home_task_item({
    super.key,
    required this.model
  });
final Taskmodel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      margin: EdgeInsets.only(bottom: 10,left: 10,right: 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color:model.color==0?Appcolor.primary:model.color==1? model.color==2?Appcolor.orangecolor:Appcolor.redcolor:Colors.green,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  style: gettitlestyle(
                    context,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.alarm),
                    SizedBox(
                      width: 5,
                    ),
                    Text('${model.start_time} - ${model.end_time}'),
                  ],
                ),
                Text(
                  model.descrption,
                  style: gettitlestyle(
                    context,
                      color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            color: Colors.white,
            width: 1,
          ),
          SizedBox(width: 5,),
          RotatedBox(
              quarterTurns: 3,
              child: Text(
                (model.iscomplet?'Complet':'TODO'),
                style: gettitlestyle(context,color: Colors.white),
              ))
        ],
      ),
    );
  }
}
