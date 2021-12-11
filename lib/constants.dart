import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String email = "";
String id = "";
String roosterId = "";

const String eli = "groupdevops2021@gmail.com";
final List<String> elements = ["Add", "View", "Shift roaster", "requests"];
final List<String> elements2 = ["View Details", "View Salary", "Shift roaster"];
final List<String> name = ["sumith", "Shreejith", "kripa", "janit", "ankit"];
final List<String> section = [
  "Kitchen",
  "Floor Staff",
  "Front Office",
  "Security",
  "Kitchen"
];
final List<String> month = [
  "jan-feb",
  "feb-march",
  "march-april",
  "april-may",
  "may-jun",
  "jun-jul",
  "jul-aug",
  "aug-sept"
];
final List<int> sal = [1200, 1500, 1250, 1330, 0, 1250, 1300, 1200];
Padding tff(String hint, TextEditingController _controller) {
  return Padding(
    padding:
        const EdgeInsets.only(left: 32.0, right: 32.0, top: 10.0, bottom: 10.0),
    child: TextFormField(
      controller: _controller,
      decoration: InputDecoration(border: OutlineInputBorder(), hintText: hint),
    ),
  );
}
