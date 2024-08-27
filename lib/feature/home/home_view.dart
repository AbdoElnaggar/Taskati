// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, unused_import

import 'dart:io';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';

import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utlise/color.dart';
import 'package:taskati/core/utlise/function.dart';
import 'package:taskati/core/utlise/navigator.dart';
import 'package:taskati/feature/home/widget/Todo_home_widget.dart';

import 'package:taskati/feature/add_task/add_task.dart';

import 'widget/header_home_widget.dart';
import 'widget/task_item_widget.dart';

class home_view extends StatefulWidget {
  const home_view({super.key});

  @override
  State<home_view> createState() => _home_viewState();
}

class _home_viewState extends State<home_view> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              header_home_widget(),
              SizedBox(
                height: 20,
              ),
              TodoHomeWidget(),
              SizedBox(
                height: 20,
              ),
              DatePicker(
                height: 90,
                width: 80,
                DateTime.now().subtract(Duration(days: 0)),
                initialSelectedDate: DateTime.now(),
                selectionColor: Appcolor.primary,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  // New date selected
                  // setState(() {
                  //   _selectedValue = date;
                  // });
                },
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Dismissible
                    
                      (
                        key: UniqueKey(),
                        background: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                               color: Colors.green,
                               borderRadius: BorderRadius.circular(10),
                          ),
                        child: Row(
                         
                            children: [
                              Icon(Icons.check),
                            Text('Complet' ,style: gettitlestyle(),),
                            ],
                          ),
                        ),


                        secondaryBackground: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.red,
                               borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.delete),
                            Text('Delete',style: gettitlestyle()),
                            ],
                          ),
                        ),
                        onDismissed: (direction) {
                          if(direction == DismissDirection.endToStart){

                          }
                          else{

                          }
                        },
                        child: home_task_item());
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

