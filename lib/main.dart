// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, unused_field

import 'package:flutter/material.dart';
import 'package:Calmpet/pages/tabs/ClassData.dart';
import 'package:Calmpet/pages/tabs/ProjectionMode.dart';
import 'package:Calmpet/pages/tabs/Setting.dart';
import 'package:Calmpet/pages/tabs/StartAnimal.dart';
import 'package:Calmpet/pages/tabs/StartAnimal2.dart';
import 'pages/tabs.dart';
import 'pages/user/login.dart';
import 'pages/user/register.dart';
import 'pages/tabs/video.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      home: Tabs(),
      routes: {
        '/login': (context) => Login(),
        '/tabs': (context) => Tabs(),
        '/setting': (context) => Setting(),
        '/register': (context) => Register(),
        '/start': (context) => StartAnimal(),
        '/start2': (context) => StartAnimal2(),
        '/classData': (context) => ClassData(),
        '/projectionMode': (context) => ProjectionMode(),
        '/video' : (context) => VideoApp(),
      },
    );
  }
}
