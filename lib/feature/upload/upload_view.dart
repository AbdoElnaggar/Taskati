// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, use_key_in_widget_constructors, unused_element, unused_local_variable, sort_child_properties_last, depend_on_referenced_packages, unrelated_type_equality_checks

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utlise/color.dart';
import 'package:taskati/core/utlise/function.dart';
import 'package:taskati/core/utlise/navigator.dart';
import 'package:taskati/feature/home/home_view.dart';

class upload_view extends StatefulWidget {
  const upload_view({super.key});

  @override
  State<upload_view> createState() => _upload_viewState();
}

class _upload_viewState extends State<upload_view> {
  String? path;
  String? name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: (){
              if(path !=null  && name!=null){
                App_local_storage.cashdata(App_local_storage.Kname, name);
                App_local_storage.cashdata(App_local_storage.Kimage,path);
                App_local_storage.cashdata(App_local_storage.KIsupload,true);
                
              ScaffoldMessenger.of(context).showSnackBar(
                
                 SnackBar(
                  backgroundColor:Appcolor.primary,
                  content: Text('succes')));
                  pushrelacement(context, home_view());
              }
             else if(path==null  && name!=null){
              ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(
                  backgroundColor:Appcolor.redcolor,
                  content: Text('Please enter image'))
              );
              }

              else if(path !=null  && name==null){
              ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(
                  backgroundColor:Appcolor.redcolor,
                  content: Text('Please enter your Name'))
              );
              }

              else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor:Appcolor.redcolor,
                  content: Text('Please enter image and name'))
              );
              }
            },
            child: 
            Text('Done  ',style: gettitlestyle(context,color: Appcolor.primary),),
            
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Appcolor.primary,
                  radius: 100,
                  backgroundImage:(path!=null)?FileImage(File(path??' ')): AssetImage('asset/user.png'),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    ImagePicker()
                        .pickImage(source: ImageSource.gallery)
                        .then((value) {
                          if(value != null){
                            setState(() {
                        path = value.path;
                      });
                          }
                      
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Appcolor.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(12),
                    child: Text(
                      'Upload Image from Gallary',
                      style: gettitlestyle(context,color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    ImagePicker().pickImage(source: ImageSource.camera).then((value)
                    {
                      if(value !=null){
                        setState(() {
                          path=value.path;
                        });
                      }
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Appcolor.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(12),
                    child: Text(
                      'Upload Image from Camera',
                      style: gettitlestyle(context,color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: ((value){
                    setState(() {
                      name=value;
                    });
                  }),
                  decoration: InputDecoration(
                    hintText: 'Enter your Name',
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Appcolor.primary),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Appcolor.primary),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Appcolor.primary),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Appcolor.primary),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
