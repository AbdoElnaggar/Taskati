// ignore_for_file: unused_local_variable, non_constant_identifier_names, depend_on_referenced_packages, camel_case_types

import 'package:hive/hive.dart';
import 'package:taskati/core/model/model_taskbox.dart';
class App_local_storage{
  static String KIsupload='isupload';
  static String kIsDarkMode = 'isDarkMode';
  static String Kname='name';
  static String Kimage='image';
  static late Box<Taskmodel> taskbox;
  static late Box userbox;
  static init(){
    taskbox=Hive.box('taskbox');
     userbox=Hive.box('userbox');
  }
  static cashdata(String key,path){
   return userbox.put(key,path);
  }
  static getcash(String key){
   return userbox.get(key);
  }


  static cashtask(String key,Taskmodel path){
   return taskbox.put(key,path);
  }
  static gettask(String key){
   return taskbox.get(key);
  }
}