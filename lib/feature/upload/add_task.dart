// ignore_for_file: camel_case_types, prefer_const_constructors, unnecessary_import, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taskati/core/utlise/color.dart';
import 'package:taskati/core/utlise/function.dart';
import 'package:taskati/core/utlise/navigator.dart';
import 'package:taskati/core/widgits/custom_bottom.dart';
import 'package:taskati/feature/formfield_costom/formfield.dart';
import 'package:taskati/feature/home/home_view.dart';


class add_task extends StatefulWidget {
  const add_task({super.key});

  @override
  State<add_task> createState() => _add_taskState();
}

class _add_taskState extends State<add_task> {
  int colorindex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          pop(context, home_view());
        }, icon:Icon(Icons.arrow_back_ios)),
        title: Text("Add taks",style: gettitlestyle(color: Appcolor.primary,),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            custome_Form(text: "title", description:"ENter your title here"),
            custome_Form(text: "note", description:"ENter your notes  here"),
            custome_Form(text: "date", description:"20/12/2022"),


           Row(
            children: [
           Expanded(child: 
           Column(
              children: [

                custome_Form(text: "start time'", description:"00:00"),
                 
              ],
            )),
            SizedBox(width: 15,),
            Expanded(child: Column(
              children: [
                custome_Form(text: "end time", description:"'00:00'"),  
              ],
            )
            ),
            
            ],
             

           ),
            
 
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            
            textBaseline:TextBaseline.alphabetic,
            children: [
              
              Column(
                children: [
                  SizedBox(height: 20,),
                  Text('Colors',style: gettitlestyle(),),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            colorindex=1;
                          });
                        },
                        child: Expanded(
                          child: CircleAvatar(
                            backgroundColor:Appcolor.primary,
                              child:colorindex==1 ? Icon(Icons.check,color:Colors.white,size: 25,):null,
                              
                          ),
                        ),
                      ),
                      SizedBox(width: 7,),
                      InkWell(
                        onTap: (){
                          setState(() {
                            colorindex=2;
                          });
                        },
                        child: Expanded(
                          child: CircleAvatar(
                            backgroundColor:Appcolor.redcolor,
                            child: colorindex==2?Icon(Icons.check,color:Colors.white,size: 25,):null,
                          ),
                        ),
                      ),
                      SizedBox(width: 7,),
                      InkWell(
                        onTap: (){
                          setState(() {
                            colorindex=3;
                          });
                        },
                        child: Expanded(
                          child: CircleAvatar(
                            backgroundColor:Appcolor.orangecolor,
                            child:colorindex==3?Icon(Icons.check,color:Colors.white,size: 25,):null,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            
              custome_bottom(text: 'Add_Task', onTap:(){},width: 120,margin: 27,)
            ],
          )
          ],

        ),
      ),
    );
  }
}