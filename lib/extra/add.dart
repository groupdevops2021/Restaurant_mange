import 'package:flutter/material.dart';
import 'package:restaruant_manager/constants.dart';

class Add extends StatelessWidget {
  const Add({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TextEditingController _usrController = TextEditingController();
    // TextEditingController _pwdController = TextEditingController();
    TextEditingController _phnController = TextEditingController();
    TextEditingController _nameController = TextEditingController();
    TextEditingController _dobController = TextEditingController();
    TextEditingController _emlController = TextEditingController();
    TextEditingController _salController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Add Member")),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          tff("Name", _nameController),
          tff("Salary", _salController),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Submit".toUpperCase()),
            ),
          )
        ],
      ),
    );
  }
}
