import 'package:flutter/material.dart';
import 'package:restaruant_manager/apis.dart';
import 'package:restaruant_manager/connection.dart';
import 'package:restaruant_manager/extra/add.dart';
import 'package:restaruant_manager/extra/roster.dart';
import 'package:restaruant_manager/member/view.dart';
import 'package:restaruant_manager/login.dart';
import 'package:restaruant_manager/member/view_details.dart';
import 'package:restaruant_manager/model/salary_model.dart';

import 'constants.dart';
import 'member/view_salary.dart';

class HomeMember extends StatelessWidget {
  const HomeMember({Key? key, required this.dbID, required this.roosterID})
      : super(key: key);
  final String dbID;
  final String roosterID;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: GestureDetector(
            child: const Text("Member"),
            onTap: () {
              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeAdmin()));
            },
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await AuthProvider().logOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            icon: Icon(Icons.login),
          ),
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(),
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    width: size.width * 0.25,
                  ),
                  Expanded(
                    child: GridView.extent(
                        maxCrossAxisExtent: 240.0,
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0,
                        children: elements2
                            .map(
                              (el) => GestureDetector(
                                onTap: () async {
                                  if (el.toLowerCase() == "view details") {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MyHomePage(key: key)));
                                  } else if (el.toLowerCase() ==
                                      "view salary") {
                                    var response = await showSalary(dbID);
                                    List<SalaryModel> _sal =
                                        salaryModelFromJson(response);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ViewSalary(_sal)));
                                  } else if (el.toLowerCase() ==
                                      "shift roaster") {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ShowRooster(
                                                  rooster: roosterID,
                                                )));
                                  }
                                },
                                child: Card(
                                  elevation: 4.0,
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        el.toUpperCase(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList()),
                  ),
                  SizedBox(
                    width: size.width * 0.18,
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
