// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/core/utlise/color.dart';
import 'package:taskati/core/utlise/function.dart';
import 'package:taskati/core/utlise/navigator.dart';

import 'package:taskati/feature/upload/add_task.dart';
class home_view extends StatefulWidget {
  const home_view({super.key});

  @override
  State<home_view> createState() => _home_viewState();
}

class _home_viewState extends State<home_view> {
  @override
  Widget build(BuildContext context) {
     var box =Hive.box('userbox');
    return SafeArea(
      child: Scaffold(
        body:Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('Hellow ${box.get('name')}',style: gettitlestyle(fontSize: 18,color: Appcolor.primary,)),
                      Text('Have a Nice day',style: gettitlestyle(fontSize: 16,color: Appcolor.darkcolor,)),
                    ],
                    
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: (box.get('image')!=null)?FileImage(File(box.get('image')??' ')): AssetImage('asset/user.png'),
                  ),
                  
                ],
              ),
              
           InkWell(
            onTap: () {
              push(context,add_task());
            },
             child: Container(
                      width: 180,
                      margin: EdgeInsets.only(top:120),
                      decoration: BoxDecoration(
                          color: Appcolor.primary,
                          borderRadius: BorderRadius.circular(10),
                      ),
                      
                      padding: EdgeInsets.all(12),
                      child: Text('Add task'),
                    ),
           ),
            ],
            
          ),
        ),
      ),
    );
  }
}