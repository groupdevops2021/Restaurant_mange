import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:restaruant_manager/connection.dart';
import 'package:restaruant_manager/login.dart';

import '../apis.dart';
import '../model/user_model.dart';

class NewRecord extends StatelessWidget {
  const NewRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController roosterIDs = new TextEditingController();
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: TextFormField(
                controller: roosterIDs,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                var _response = await adduser(AuthProvider.userEmail!,
                    AuthProvider.name!, roosterIDs.text);

                UserModel userModel =
                    UserModel.fromJson(json.decode(_response));
                print("x1");
                if (userModel.name == null) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                } else {
                  print("x22");
                  //  check if admin
                  //
                }
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
