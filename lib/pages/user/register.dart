// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:Calmpet/main.dart' as main;

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}
String username = "";
String password = "";
String email = "";


class _RegisterState extends State<Register> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/register.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Name",
                          style: TextStyle(
                              fontFamily: 'test',
                              fontSize: 18.0,
                              color: Color.fromARGB(255, 253, 230, 230))),
                      SizedBox(width: 160.0)
                    ],
                  ),
                  SizedBox(height: 10.0),
                  SizedBox(
                    width: 210.0,
                    height: 30.0,
                    child: TextField(
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0)),
                            hintText: "Username",
                            filled: true,
                            fillColor: Color.fromARGB(51, 5, 20, 110)),
                        onChanged: (value) {
                          username = value;
                        },
                        style: TextStyle(fontFamily: 'test', fontSize: 17.0)),
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("E-mail",
                          style: TextStyle(
                              fontFamily: 'test',
                              fontSize: 18.0,
                              color: Color.fromARGB(255, 253, 230, 230))),
                      SizedBox(width: 160.0)
                    ],
                  ),
                  SizedBox(height: 10.0),
                  SizedBox(
                    width: 210.0,
                    height: 30.0,
                    child: TextField(
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0)),
                            hintText: "1234XXX@xxxx",
                            filled: true,
                            fillColor: Color.fromARGB(51, 5, 20, 110)),
                        onChanged: (value){
                          email = value;
                        },
                        style: TextStyle(fontFamily: 'test', fontSize: 17.0)),
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Password",
                          style: TextStyle(
                              fontFamily: 'test',
                              fontSize: 18.0,
                              color: Color.fromARGB(255, 253, 230, 230))),
                      SizedBox(width: 120.0)
                    ],
                  ),
                  SizedBox(height: 10.0),
                  SizedBox(
                    width: 210.0,
                    height: 30.0,
                    child: TextField(
                        obscureText: true,
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0)),
                            hintText: "XXXXXXX",
                            filled: true,
                            fillColor: Color.fromARGB(51, 5, 20, 110)),
                        onChanged: (value){
                          password = value;
                        },
                        style: TextStyle(fontFamily: 'test', fontSize: 17.0)),
                  ),
                  SizedBox(height: 15.0),

                  SizedBox(
                    height: 90.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 120.0,
                          height: 40.0,
                          child: ElevatedButton(
                            child: Text("Cancle",
                                style: TextStyle(
                                    fontFamily: 'test', fontSize: 16.0)),
                            onPressed: () {
                              if (main.isLoggedIn) {
                                Navigator.pushNamed(context, '/setting');
                              } else {
                                Navigator.pushNamed(context, '/login');
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.orange,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          )),
                      SizedBox(width: 10.0),
                      SizedBox(
                        width: 120.0,
                        height: 40.0,
                        child: ElevatedButton(
                            child: Text("Complete",
                                style: TextStyle(
                                    fontFamily: 'test', fontSize: 16.0)),
                            onPressed: () {
                              register();

                              },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                      )
                    ],
                  ),
                ],
              ),
            )));
  }
  void register() async {
    if (username == "" || password == "" || email == "") {
      Fluttertoast.showToast(
          msg: "Do not leave fields blank, Please Try Again!",
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          webBgColor: "linear-gradient(to right, #ff0000, #ff0000)");
      return;
    }
    String registerURL = 'http://13.54.165.206:8010/calmpet/user/addUser';
    Dio dio = new Dio();

    var response = await dio.post(
        registerURL,
        data: {'username' : username,'password' : password , 'email' : email});

    if (response.statusCode == 200) {
      // register success
      Navigator.pushNamed(context, '/login');
    }  else {
      // failed
      Fluttertoast.showToast(
          msg: "register failed, Please Try Again!",
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          webBgColor: "linear-gradient(to right, #ff0000, #ff0000)");
    }
    // reset
     username = "";
     password = "";
     email = "";
  }
}
