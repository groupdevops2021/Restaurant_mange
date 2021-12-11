import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaruant_manager/apis.dart';

class RoosterAdmin extends StatefulWidget {
  const RoosterAdmin({Key? key}) : super(key: key);

  @override
  _RoosterAdminState createState() => _RoosterAdminState();
}

class _RoosterAdminState extends State<RoosterAdmin> {
  TextEditingController mm = new TextEditingController();
  TextEditingController mt = new TextEditingController();
  TextEditingController mw = new TextEditingController();
  TextEditingController mth = new TextEditingController();
  TextEditingController mf = new TextEditingController();
  TextEditingController nm = new TextEditingController();
  TextEditingController nt = new TextEditingController();
  TextEditingController nw = new TextEditingController();
  TextEditingController nth = new TextEditingController();
  TextEditingController nf = new TextEditingController();
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
                  TextFormField(
                    controller: mm,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    maxLines: 1,
                  ),
                  TextFormField(
                    controller: mt,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    maxLines: 1,
                  ),
                  TextFormField(
                    controller: mw,
                    // Only numbers can be entered
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered

                    keyboardType: TextInputType.number,
                    maxLength: 1,
                  ),
                  TextFormField(
                    controller: mth,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered

                    keyboardType: TextInputType.number,
                    maxLength: 1,
                  ),
                  TextFormField(
                    controller: mf,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    maxLines: 1,
                  ),
                ]),
                TableRow(children: [
                  Center(
                    child: Text(
                      "N".toUpperCase(),
                      textScaleFactor: 1.5,
                    ),
                  ),
                  TextFormField(
                    controller: nm,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    maxLines: 1,
                  ),
                  TextFormField(
                    controller: nt,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    maxLines: 1,
                  ),
                  TextFormField(
                    controller: nw,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    maxLines: 1,
                  ),
                  TextFormField(
                    controller: nth,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    maxLines: 1,
                  ),
                  TextFormField(
                    controller: nf,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    maxLines: 1,
                  ),
                ]),
              ],
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            List<String> _myList = [
              mm.text,
              mt.text,
              mw.text,
              mth.text,
              mf.text,
              nm.text,
              nt.text,
              nw.text,
              nth.text,
              nf.text
            ];
            print(_myList);
            var response = await addrooster(_myList);
            print(response);
          },
          child: Text("Submit"),
        ),
      ]),
    );
  }
}
