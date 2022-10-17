// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

String username = "";

String password = "";

class _LoginState extends State<Login> {
  var checkUserInform = true;

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();

    return Scaffold(
        body: Container(
            //form
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/login.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Username",
                          style: TextStyle(
                              fontFamily: 'test',
                              fontSize: 18.0,
                              color: Color.fromARGB(255, 253, 230, 230))),
                      SizedBox(width: 120.0)
                    ],
                  ),
                  SizedBox(height: 5.0),
                  SizedBox(
                    width: 210.0,
                    height: 35.0,
                    child: TextField(
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: usernameController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0)),
                            hintText: 'First Name',
                            prefixIcon: Icon(Icons.person),
                            filled: true,
                            fillColor: Color.fromARGB(51, 5, 20, 110)),
                        onChanged: (value) {
                          username = value;
                        },
                        style: TextStyle(fontFamily: 'test', fontSize: 20.0)),
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
                  SizedBox(height: 5.0),
                  SizedBox(
                    width: 210.0,
                    height: 35.0,
                    child: TextField(
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: passwordController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0)),
                            hintText: "123456",
                            prefixIcon: Icon(Icons.lock),
                            filled: true,
                            fillColor: Color.fromARGB(51, 5, 20, 110)),
                        onChanged: (value) {
                          password = value;
                        },
                        style: TextStyle(fontFamily: 'test', fontSize: 20.0)),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 100.0,
                          height: 35.0,
                          child: ElevatedButton(
                            child: Text("Login",
                                style: TextStyle(
                                    fontFamily: 'test', fontSize: 16.0)),
                            onPressed: () {
                              login();
                                },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.orange,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          )),
                      SizedBox(width: 10.0),
                      SizedBox(
                        width: 100.0,
                        height: 35.0,
                        child: ElevatedButton(
                            child: Text("Register",
                                style: TextStyle(
                                    fontFamily: 'test', fontSize: 16.0)),
                            onPressed: () =>
                                Navigator.pushNamed(context, '/register'),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            )));
  }

  void login() async {
    String loginURL =
        'http://13.54.165.206:8010/calmpet/user?username=${username}&password=${password}';
    Dio dio = new Dio();

    var response = await dio.get(loginURL);
    print('Respond ${response.statusCode}');

    // print(response.data);

    Map<String, dynamic> all = response.data;
    Map realData = all["data"];

    bool status = realData["success"];
    if (status == false) {
      Fluttertoast.showToast(msg: "User name or password incorrect, please check",
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
      webBgColor: "linear-gradient(to right, #ff0000, #ff0000)");
    } else {
      Navigator.pushNamed(context, "/tabs");
    }

  }
}
