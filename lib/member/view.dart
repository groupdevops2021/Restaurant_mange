import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restaruant_manager/constants.dart';
import 'package:restaruant_manager/model/default_model.dart';

import '../apis.dart';
import '../model/user_model.dart';

class ViewDatabase extends StatefulWidget {
  const ViewDatabase({Key? key}) : super(key: key);

  @override
  _ViewDatabaseState createState() => _ViewDatabaseState();
}

class _ViewDatabaseState extends State<ViewDatabase> {
  List<UserModel> _user = [];
  DefaultModel _bool = new DefaultModel();
  int _len = 0;

  getUser() async {
    var response = await viewUser();
    _user = userModelFromJson(response);
    _len = _user.length;
    print("sdfsf0${_len}");
  }

  TextEditingController salary = new TextEditingController();
  TextEditingController month = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Add Member")),
      ),
      body: FutureBuilder(
          future: getUser(),
          builder: (context, snapshot) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => ListTile(
                        tileColor: index % 2 == 0
                            ? Colors.grey.shade200
                            : Colors.grey.shade400,
                        leading: Text("${index + 1}."),
                        title: Text(_user[index].name!.toUpperCase()),
                        subtitle: Text("ID: ${_user[index].email!}"),
                        trailing: Container(
                          width: 400,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: month,
                                  maxLength: 8,
                                  decoration: InputDecoration(
                                      hintText: "Enter month",
                                      contentPadding: const EdgeInsets.all(4.0),
                                      border: OutlineInputBorder()),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: salary,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ], // Only numbers can be entered
                                  keyboardType: TextInputType.number,
                                  maxLength: 8,
                                  decoration: InputDecoration(
                                      hintText: "Enter Salary",
                                      contentPadding: const EdgeInsets.all(4.0),
                                      border: OutlineInputBorder()),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: IconButton(
                                  onPressed: () async {
                                    var response = await addSalary(
                                      _user[index].name!,
                                      _user[index].id!,
                                      salary.text,
                                      month.text,
                                    );
                                    _bool = defaultModelFromJson(response);
                                    if (_bool.success!) {
                                      Fluttertoast.showToast(
                                          msg: "Salary Added",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.green,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: "Salary Failed To Added",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    }
                                  },
                                  icon: Icon(Icons.edit),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                      itemCount: _len,
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
