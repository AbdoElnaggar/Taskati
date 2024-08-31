// ignore_for_file: depend_on_referenced_packages, unused_import

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utlise/thems.dart';
import 'package:taskati/feature/home/home_view.dart';
import 'package:taskati/feature/spalsh/splash_view.dart';
import 'package:taskati/feature/add_task/add_task.dart';

import 'core/model/model_taskbox.dart';

void main() async {
 await Hive.initFlutter();
 Hive.registerAdapter(TaskmodelAdapter());
 await Hive.openBox('userbox');
  await Hive.openBox<Taskmodel>('taskbox');
 App_local_storage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
      return ValueListenableBuilder(
        valueListenable: App_local_storage.userbox.listenable(),
        builder: (context, userBox, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: userBox.get(App_local_storage.kIsDarkMode)
                ? ThemeMode.dark
                : ThemeMode.light,
            darkTheme: AppTheme.darkTheme,
            theme: AppTheme.lightTheme,
            home: const splash_view(),
          );
  });
  }
}
