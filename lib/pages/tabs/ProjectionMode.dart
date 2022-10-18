import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProjectionMode extends StatefulWidget {
  const ProjectionMode({Key? key}) : super(key: key);

  @override
  _ProjectionModeState createState() => _ProjectionModeState();
}

class _ProjectionModeState extends State<ProjectionMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("ProjectionMode"),
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
                  fontSize: 30,
                  fontFamily: 'test'),
            ),
          ),
        )

        );
  }
}
