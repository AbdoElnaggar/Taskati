// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, unused_local_variable, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/core/utlise/function.dart';
import 'package:taskati/core/utlise/navigator.dart';
import 'package:taskati/feature/home/home_view.dart';
import '../upload/upload_view.dart';

class splash_view extends StatefulWidget {
  const splash_view({super.key});

  @override
  State<splash_view> createState() => _splash_viewState();
}

class _splash_viewState extends State<splash_view> {
  
  @override
  void initState() {
    
    super.initState();
    var box=Hive.box('userbox');
    Future.delayed(Duration(seconds: 3),(){
   pushrelacement(context,box.get('isupload')==true? home_view():upload_view());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Lottie.asset('asset/logo.json'),
          Text('Taskaiti',style: gettitlestyle(fontSize: 22)),
          Text('it\'s To Get Organized',style: gettitlestyle()),
        ],
      ),
      ),  
    );
  }
}