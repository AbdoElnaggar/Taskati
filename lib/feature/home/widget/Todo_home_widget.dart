// ignore_for_file: prefer_const_constructors, file_names


import 'package:flutter/material.dart';
import 'package:taskati/core/utlise/color.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/utlise/navigator.dart';

import 'package:taskati/feature/add_task/add_task.dart';
import '../../../../core/utlise/function.dart';

class TodoHomeWidget extends StatelessWidget {
  const TodoHomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(DateFormat.yMMMMd().format(DateTime.now()),
                  style: gettitlestyle(
                    fontSize: 20,
                    color: Appcolor.darkcolor,
                  )),
              Text('Today',
                  style: gettitlestyle(
                    fontSize: 18,
                    fontwigth: FontWeight.bold,
                    color: Appcolor.darkcolor,
                  )),

                 
            ],
          ),
        ),
   ElevatedButton(
          style:ElevatedButton.styleFrom(
            backgroundColor: Appcolor.primary,
            foregroundColor: Colors.white,
          ),
          onPressed: (){push(context,add_task());}
          , child: Text('+ Add Task',style:TextStyle(color: Colors.white,fontSize: 16),))
      ],
    );
  }
}