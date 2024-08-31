// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, unused_import, avoid_function_literals_in_foreach_calls

import 'dart:io';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/model/model_taskbox.dart';

import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utlise/color.dart';
import 'package:taskati/core/utlise/function.dart';
import 'package:taskati/core/utlise/navigator.dart';
import 'package:taskati/feature/home/widget/Todo_home_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/feature/add_task/add_task.dart';

import 'widget/header_home_widget.dart';
import 'widget/task_item_widget.dart';

class home_view extends StatefulWidget {
  const home_view({super.key});

  @override
  State<home_view> createState() => _home_viewState();
}

class _home_viewState extends State<home_view> {
  String selectDate=DateFormat.yMd().format(DateTime.now());
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
                dateTextStyle: getBodyTextStyle(context, fontSize: 18),
                monthTextStyle: getBodyTextStyle(context, fontSize: 14),
                dayTextStyle: getBodyTextStyle(context, fontSize: 14),
                onDateChange: (date) {
                
                  setState(() {
                   selectDate=DateFormat.yMd().format(date);
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ValueListenableBuilder(
                   valueListenable:App_local_storage.taskbox.listenable(),
                  builder: (context, taskbox, child) {
                    List<Taskmodel>tasks=[];
                    taskbox.keys.forEach((key){
                      if(selectDate== App_local_storage.gettask(key)?.date){
                      tasks.add( App_local_storage.gettask(key)!);
                      }
                 
                    });
                   
                    return tasks.isEmpty?
                    Center(
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset('asset/logo2.json'),
                          SizedBox(height: 15,),
                          Text('No Task Found',style:gettitlestyle(context,color: Appcolor.primary) ,),
                        ],
                      )
                    )

                    :ListView.builder(           
                    physics: BouncingScrollPhysics(),
                      itemCount: tasks.length,
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
                              Text('Complet' ,style: gettitlestyle(context,),),
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
                              Text('Delete',style: gettitlestyle(context,)),
                              ],
                            ),
                          ),
                          onDismissed: (direction) {
                            if(direction == DismissDirection.endToStart){
                           taskbox.delete(tasks[index].id);
                            }
                            else{
                            taskbox.put(
                              tasks[index].id,
                              Taskmodel(
                                id: tasks[index].id,
                               title: tasks[index].title,
                                descrption:tasks[index]. descrption,
                                 date: tasks[index].date,
                                  start_time:tasks[index]. start_time,
                                   end_time:tasks[index]. end_time,
                                    color:3,
                                     iscomplet:true,
                                     )
                            );
                            }
                          },
                          child: home_task_item(model: tasks[index],));
                      });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

