import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ClassData extends StatefulWidget {
  const ClassData({Key? key}) : super(key: key);

  @override
  _ClassDataState createState() => _ClassDataState();
}

class _ClassDataState extends State<ClassData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("ClassData"),
            centerTitle: true,
            toolbarHeight: 50),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/startbg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Text(
              "Upcoming...",
              style: TextStyle(color: Colors.deepOrange,
              fontSize: 40,
              fontFamily: 'test'),
            ),
          ),
        ));
  }
}
