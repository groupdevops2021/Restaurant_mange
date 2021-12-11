import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restaruant_manager/constants.dart';
import 'package:restaruant_manager/model/default_model.dart';
import 'package:restaruant_manager/model/salary_model.dart';

import '../apis.dart';

class ViewSalary extends StatelessWidget {
  const ViewSalary(this.sal, {Key? key}) : super(key: key);

  final List<SalaryModel> sal;
  @override
  Widget build(BuildContext context) {
    DefaultModel _bool = new DefaultModel();

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("View Salary")),
      ),
      body: Padding(
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
                  title: Text("\$.${sal[index].salary}"),
                  subtitle: Text("${sal[index].month!.toUpperCase()}"),
                  trailing: ElevatedButton(
                      onPressed: () async {
                        var response = await addRequest(
                          sal[index].id!,
                          "salary",
                          "${sal[index].month} update required",
                        );
                        _bool = defaultModelFromJson(response);
                        if (_bool.success!) {
                          Fluttertoast.showToast(
                              msg: "Update Request Send",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else {
                          Fluttertoast.showToast(
                              msg: "Request Error",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      },
                      child: Text("Update Request")),
                ),
                itemCount: sal.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
