// ignore_for_file: unused_local_variable, non_constant_identifier_names, depend_on_referenced_packages, camel_case_types

import 'package:hive/hive.dart';
class App_local_storage{
  static String KIsupload='isupload';
  static String Kname='name';
  static String Kimage='image';
  static late Box userbox;
  static init(){
     userbox=Hive.box('userbox');
  }
  static cashdata(String key,path){
   return userbox.put(key,path);
  }
  static getcash(String key){
   return userbox.get(key);
  }
}