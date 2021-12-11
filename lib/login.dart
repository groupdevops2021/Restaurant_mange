import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restaruant_manager/member/new_user.dart';
import 'package:restaruant_manager/model/user_model.dart';

import 'apis.dart';
import 'connection.dart';
import 'constants.dart';
import 'home_admin.dart';
import 'home_member.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static String dbId = "";
  static String roosterId = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 100.0),
              const Text(
                "Login",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                child: Text("Login with Google"),
                onPressed: () async {
                  bool res = await AuthProvider().loginWithGoogle();
                  if (!res) {
                    Fluttertoast.showToast(
                        msg: "Error logging in with google",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else {
                    var response = await requestUser(AuthProvider.userEmail!);
                    print(response);
                    print("userModel.id__");
                    UserModel userModel =
                        UserModel.fromJson(json.decode(response));
                    print("userModel.id");
                    if (userModel.name == null) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => NewRecord()));
                    } else {
                      print("er2");
                      //  check if admin
                      if (AuthProvider.userEmail == eli) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeAdmin()));
                      } else {
                        dbId = userModel.id!;
                        roosterId = userModel.roosterId!;
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeMember(
                                      dbID: userModel.id!,
                                      roosterID: userModel.roosterId!,
                                    )));
                      }
                      //
                    }
                    // print(AuthProvider.name);

                  }
                  Fluttertoast.showToast(
                      msg: "${AuthProvider.userEmail}",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
