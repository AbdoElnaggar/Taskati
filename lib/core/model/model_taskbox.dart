// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages

import 'package:hive/hive.dart';

part 'model_taskbox.g.dart';


@HiveType(typeId: 1)
class Taskmodel{
@HiveField(0)
String id;
@HiveField(1)
String title;
@HiveField(2)
String descrption;
@HiveField(3)
String date;
@HiveField(4)
String start_time;
@HiveField(5)
String end_time;
@HiveField(6)
int color;
@HiveField(7)
bool iscomplet;
Taskmodel(
  {
    required this.id,
    required this.title,
    required this.descrption,
    required this.date,
    required this.start_time,
    required this.end_time,
    required this.color,
    required this.iscomplet,

  }
);
}