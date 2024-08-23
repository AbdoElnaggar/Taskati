// ignore_for_file: depend_on_referenced_packages, unused_import

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/feature/home/home_view.dart';
import 'package:taskati/feature/spalsh/splash_view.dart';
import 'package:taskati/feature/upload/add_task.dart';

void main() async {
 await Hive.initFlutter();
 await Hive.openBox('userbox');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splash_view(),
    );
  }
}
