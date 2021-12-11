import 'package:flutter/material.dart';
import 'package:restaruant_manager/apis.dart';
import 'package:restaruant_manager/extra/view_shift.dart';

import 'constants.dart';
import 'extra/add.dart';
import 'extra/request.dart';
import 'extra/roster.dart';
import 'member/view.dart';
import 'login.dart';
import 'model/request_model.dart';

class HomeAdmin extends StatelessWidget {
  const HomeAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: GestureDetector(
            child: const Text("Manager"),
            onTap: () {
              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeAdmin()));
            },
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
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
                    width: size.width * 0.18,
                  ),
                  Expanded(
                    child: GridView.extent(
                        maxCrossAxisExtent: 240.0,
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0,
                        children: elements
                            .map(
                              (el) => GestureDetector(
                                onTap: () async {
                                  if (el.toLowerCase() == "add") {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Add()));
                                  } else if (el.toLowerCase() == "view") {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ViewDatabase()));
                                  } else if (el.toLowerCase() ==
                                      "shift roaster") {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RoosterAdmin()));
                                  } else if (el.toLowerCase() == "requests") {
                                    var _response = await showRequests();
                                    List<RequestModel> _requestModel =
                                        requestModelFromJson(_response);

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RequestPage(_requestModel)));
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
