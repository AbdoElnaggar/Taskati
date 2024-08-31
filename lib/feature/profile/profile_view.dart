// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, use_key_in_widget_constructors, unused_element, unused_local_variable, sort_child_properties_last, depend_on_referenced_packages, unrelated_type_equality_checks, sized_box_for_whitespace, use_super_parameters, no_leading_underscores_for_local_identifiers, unused_label

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utlise/color.dart';
import 'package:taskati/core/utlise/function.dart';
import 'package:taskati/core/utlise/navigator.dart';

import '../home/home_view.dart';


class profile_view extends StatefulWidget {
  const profile_view({super.key});

  @override
  State<profile_view> createState() => _profile_viewState();
}

class _profile_viewState extends State<profile_view> {


  String? path;
  String? name;
  @override
  void initState() {
    //
    super.initState();
    path = App_local_storage.getcash(App_local_storage.Kimage);
    name = App_local_storage.getcash(App_local_storage.Kname);
  }

  @override
  Widget build(BuildContext context) {
     bool mode=App_local_storage.getcash(App_local_storage.kIsDarkMode)??false;
    return Scaffold(
      appBar: AppBar(
        actions: [

         
            // make dark and light button
            IconButton(
              onPressed: () {
               
             App_local_storage.cashdata(App_local_storage.kIsDarkMode, !mode);
                
                setState(() {});
              },
              icon: Icon(
                mode ? Icons.light_mode : Icons.dark_mode,
                color: Appcolor.primary,
              ),
            ),
          
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
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: Appcolor.primary,
                      radius: 100,
                      backgroundImage: (path != null)
                          ? FileImage(File(path ?? ' '))
                          : AssetImage('asset/user.png'),
                    ),
                    Positioned(
                        right: 10,
                        bottom: 8,
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context, builder:(context){
                               backgroundColor:
                                      Theme.of(context).scaffoldBackgroundColor;
                              return Column(
                                  mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color:Theme.of(context).scaffoldBackgroundColor,                                    ),
                                    width: double.infinity,
                                    child: TextButton(onPressed: (){
                                    
                                      pickImage(true);
                                      Navigator.pop(context);
                                    }, child: Text('Camera',style: gettitlestyle(context,fontSize: 33,color:Appcolor.primary),)),
                                  ),
                                   Container(
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color:Theme.of(context).scaffoldBackgroundColor,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    width: double.infinity,
                                    child: TextButton(onPressed: (){
                                    
                                      pickImage(false);
                                      Navigator.pop(context);
                                    }, child: Text('Gallary',style: gettitlestyle(context,fontSize: 33,color:Appcolor.primary),)),
                                  ),
                                ],
                              );
                            });
                          },
                          child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: Icon(
                                Icons.camera_alt_rounded,color: Appcolor.primary,
                                size: 33,
                              )),
                        ))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      name!,
                      style: gettitlestyle(context,color: Appcolor.primary),
                    )),
                    IconButton.outlined(
                        onPressed: () {
                          showModalBottomSheet(context: context, builder:(context){
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextFormField(
                                    onChanged: ((value){
                                                  setState(() {
                                                    name=value;
                                                  });
                                                }),
                                                
                                                decoration: InputDecoration(
                                                
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
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Appcolor.primary,
                                                ),
                                                onPressed: (){
                                                  if(name !=null){
                                                    App_local_storage.cashdata(App_local_storage.Kname, name);
                                                  }
                                                }, 
                                              child: Text('Change your Name') )
                                ],
                              ),
                            );
                          });
                        },
                        icon: (Icon(
                          Icons.edit,
                          color: Appcolor.primary,
                        )))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  pickImage(bool isCamera) {
    ImagePicker()
        .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery)
        .then((value) {
      if (value != null) {
        setState(() {
          path = value.path;
        });
        App_local_storage.cashdata(App_local_storage.Kimage, path);
       
      }
    });
  }
}



