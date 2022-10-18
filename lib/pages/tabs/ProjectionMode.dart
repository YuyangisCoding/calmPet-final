import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Calmpet/main.dart' as main;

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
            title: Text("Noise level setting"),
            centerTitle: true,
            toolbarHeight: 50),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/startbg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("noise threshold ",
                      style: TextStyle(
                          fontFamily: 'test',
                          fontSize: 18.0,
                          color: Color.fromARGB(255, 253, 230, 230))),
                  SizedBox(width: 120.0)
                ],
              ),
              SizedBox(
                width: 210.0,
                height: 35.0,
                child: TextField(
                    textAlignVertical: TextAlignVertical.bottom,

                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        hintText: 'an integer',
                        filled: true,
                        fillColor: Color.fromARGB(51, 5, 20, 110)),
                    onChanged: (value) {
                      main.db_level = int.parse(value.toString());
                    },
                    style: TextStyle(fontFamily: 'test', fontSize: 20.0)),
              ),
              SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 100.0,
                      height: 35.0,
                      child: ElevatedButton(
                        child: Text("Set",
                            style: TextStyle(
                                fontFamily: 'test', fontSize: 16.0)),
                        onPressed: () {
                          Navigator.pushNamed(context, '/tabs');
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.orange,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                      )),
                ],
              ),
            ],
          )
        )

        );
  }
}
