// ignore_for_file: camel_case_types, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utlise/color.dart';
import 'package:taskati/core/utlise/navigator.dart';
import 'package:taskati/feature/profile/profile_view.dart';

import '../../../core/utlise/function.dart';

class header_home_widget extends StatelessWidget {
  const header_home_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text('Hellow ${App_local_storage.getcash(App_local_storage.Kname)}',
                style:gettitlestyle(
                  
                  color: Appcolor.primary,
                )),
            Text('Have a Nice day',
                style: gettitlestyle(
                  fontSize: 16,
                  color: Appcolor.darkcolor,
                )),
          ],
        ),
        InkWell(
          onTap: (){
            push(context,profile_view());
          },
          child: CircleAvatar(
            radius: 50,
            backgroundImage:
                (App_local_storage.getcash(App_local_storage.Kimage) != null)
                    ? FileImage(
                        File(App_local_storage.getcash(App_local_storage.Kimage) ?? ' '))
                    : AssetImage('asset/user.png'),
          ),
        ),
      ],
    );
  }
}
