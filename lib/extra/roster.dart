import 'dart:convert';

import 'package:flutter/material.dart';

import '../apis.dart';
import '../model/rooster_model.dart';

class ShowRooster extends StatefulWidget {
  const ShowRooster({Key? key, required this.rooster}) : super(key: key);
  final String rooster;

  @override
  _ShowRoosterState createState() => _ShowRoosterState();
}

class _ShowRoosterState extends State<ShowRooster> {
  List<RoosterModel> _list = [];
  int len = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Roster"),
        backgroundColor: Colors.green,
      ),
      body: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Roster Table",
            textScaleFactor: 2,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            var response = await showRoosters();

            try {
              _list = roosterModelFromJson(response);
              len = _list.length - 1;
              print(roosterModelFromJson(response)[len - 1]);
              setState(() {});
            } catch (err) {
              print(err);
            }
          },
          child: Text("load"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Table(
              border: TableBorder.all(),
              columnWidths: const <int, TableColumnWidth>{
                0: FixedColumnWidth(80),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              // textDirection: TextDirection.rtl,
              // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
              // border:TableBorder.all(width: 2.0,color: Colors.red),
              children: [
                TableRow(children: [
                  Text(
                    "Shift".toUpperCase(),
                    textScaleFactor: 1.5,
                  ),
                  Text("Monday", textScaleFactor: 1.5),
                  Text("Tuesday", textScaleFactor: 1.5),
                  Text("Wednesday", textScaleFactor: 1.5),
                  Text("Thrusday", textScaleFactor: 1.5),
                  Text("Friday", textScaleFactor: 1.5),
                ]),
                TableRow(children: [
                  Center(
                    child: Text(
                      "M".toUpperCase(),
                      textScaleFactor: 1.5,
                    ),
                  ),
                  Text(
                      (_list).length == 0 || _list[len].mm != widget.rooster
                          ? " -- "
                          : " ${_list[len].mm!}",
                      textScaleFactor: 1.5),
                  Text(
                      (_list).length == 0 || _list[len].mt != widget.rooster
                          ? " -- "
                          : " ${_list[len].mt!}",
                      textScaleFactor: 1.5),
                  Text(
                      (_list).length == 0 || _list[len].mw != widget.rooster
                          ? " -- "
                          : " ${_list[len].mw!}",
                      textScaleFactor: 1.5),
                  Text(
                      (_list).length == 0 || _list[len].mth != widget.rooster
                          ? " -- "
                          : " ${_list[len].mth!}",
                      textScaleFactor: 1.5),
                  Text(
                      (_list).length == 0 || _list[len].mf != widget.rooster
                          ? " -- "
                          : " ${_list[len].mf!}",
                      textScaleFactor: 1.5),
                ]),
                TableRow(children: [
                  Center(
                    child: Text(
                      "N".toUpperCase(),
                      textScaleFactor: 1.5,
                    ),
                  ),
                  Text(
                      (_list).length == 0 || _list[len].nm != widget.rooster
                          ? " -- "
                          : " ${_list[len].nm!}",
                      textScaleFactor: 1.5),
                  Text(
                      (_list).length == 0 || _list[len].nt != widget.rooster
                          ? " -- "
                          : " ${_list[len].nt!}",
                      textScaleFactor: 1.5),
                  Text(
                      (_list).length == 0 || _list[len].nw != widget.rooster
                          ? " -- "
                          : " ${_list[len].nw!}",
                      textScaleFactor: 1.5),
                  Text(
                      (_list).length == 0 || _list[len].nth != widget.rooster
                          ? " -- "
                          : " ${_list[len].nth!}",
                      textScaleFactor: 1.5),
                  Text(
                      (_list).length == 0 || _list[len].nf != widget.rooster
                          ? " -- "
                          : " ${_list[len].nf!}",
                      textScaleFactor: 1.5),
                ]),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
