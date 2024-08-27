// ignore_for_file: camel_case_types, prefer_const_constructors, unnecessary_import, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/utlise/color.dart';
import 'package:taskati/core/utlise/function.dart';
import 'package:taskati/core/utlise/navigator.dart';
import 'package:taskati/feature/home/home_view.dart';

class add_task extends StatefulWidget {
  const add_task({super.key});

  @override
  State<add_task> createState() => _add_taskState();
}

class _add_taskState extends State<add_task> {
  int colorindex = 0;
  String Taskdate=DateFormat.yMd().format(DateTime.now());
  String Starttime=DateFormat('hh:mma').format(DateTime.now());
  String Endtime=DateFormat('hh:mma').format(DateTime.now().add(Duration(hours:1)));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              pop(context, home_view());
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text(
          "Add taks",
          style: gettitlestyle(
            color: Appcolor.primary,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Text('Title', style: gettitlestyle()),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                onTap: () {},
                decoration: InputDecoration(
                  suffixIconColor: Colors.black,
                  border: OutlineInputBorder(),
                  hintText: ("ENter your title here"),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text('Note', style: gettitlestyle()),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                maxLines: 4,
                onTap: () {},
                decoration: InputDecoration(
                  suffixIconColor: Colors.black,
                  border: OutlineInputBorder(),
                  hintText: ("ENter your Note here"),
                ),
              ),
              SizedBox(
                height: 15,
              ),



              Text('Data', style: gettitlestyle()),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                readOnly: true,
                onTap: () {
                  showDatePicker(
                      initialDate: DateTime.now(),
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2040)).then((value){
                        if(value !=null){
                           setState(() {
                             Taskdate=DateFormat.yMd().format(value);
                           });
                        }
                      });
                },
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.calendar_month),
                  suffixIconColor: Colors.black,
                  border: OutlineInputBorder(),
                  hintText: (Taskdate),
                  hintStyle: gettitlestyle(),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                                     
                      children: [
                      
                      SizedBox(
                        height: 15,
                      ),
                      Text('Start time', style: gettitlestyle()),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        readOnly: true,
                onTap: () {
                  showTimePicker(context: context, initialTime:TimeOfDay.now()).then((value){
                    if(value !=null){
                           setState(() {
                             Starttime=value.format(context);
                           });
                        }
                  });
                },
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.watch_later_outlined),
                          suffixIconColor: Colors.black,
                          border: OutlineInputBorder(),
                          hintText: (Starttime),
                          
                          hintStyle: gettitlestyle(),
                        ),
                      )
                    ]),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: Column(children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text('end time', style: gettitlestyle()),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      readOnly: true,
                onTap: () {
                  showTimePicker(context: context, initialTime:TimeOfDay.now()).then((value){
                    if(value !=null){
                           setState(() {
                             Endtime=value.format(context);
                           });
                        }
                  });
                },
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.watch_later_outlined),
                        suffixIconColor: Colors.black,
                        border: OutlineInputBorder(),
                        hintStyle: gettitlestyle(),
                        hintText: (Endtime),
                      ),
                    )
                  ])),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Row(
                    children: List.generate(3, (int index) {
                      return Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                colorindex = index;
                              });
                            },
                            child: Expanded(
                              child: CircleAvatar(
                                backgroundColor: (index == 0)
                                    ? Appcolor.primary
                                    : (index == 1)
                                        ? Appcolor.orangecolor
                                        : Appcolor.redcolor,
                                child: colorindex == index
                                    ? Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 25,
                                      )
                                    : null,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Appcolor.primary,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {},
                      child: Text(
                        'Creat Task',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
