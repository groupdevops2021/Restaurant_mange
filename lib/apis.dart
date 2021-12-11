import 'dart:convert';

import 'package:http/http.dart' as https;

/* Generate output for available blood group */
requestUser(String email) async {
  try {
    print("___connection established___");
    var response = await https.post(
        Uri.parse("http://localhost:3000/api/v1/userDatas/log-emp"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"email": email}));
    var _jsonString = response.body;
    print("_jsonString_");

    return (_jsonString);
  } catch (err) {
    print("Error in establishing connection 101");
  }
}

/* Generate output for available blood group */
adduser(
  String _email,
  String _name,
  String _roosterId,
) async {
  try {
    print("___connection established___");
    var response =
        await https.post(Uri.parse("http://localhost:3000/api/v1/userDatas"),
            headers: {"Content-Type": "application/json"},
            body: json.encode({
              "email": _email,
              "name": _name,
              "roosterId": _roosterId,
            }));
    var _jsonString = response.body;
    print("_jsonString_");

    return (_jsonString);
  } catch (err) {
    print("Error in establishing connection 101");
  }
}

/* Generate output for available blood group */
viewUser() async {
  try {
    print("___connection established___12");
    var response = await https.get(
      Uri.parse("http://localhost:3000/api/v1/userDatas"),
      headers: {"Content-Type": "application/json"},
    );
    var _jsonString = response.body;
    print("_jsonString_");
    return (_jsonString);
  } catch (err) {
    print("Error in establishing connection 101");
  }
}

/* Generate output for available blood group */
addSalary(String name, String id, String salary, String month) async {
  try {
    print("___connection established___");
    var response =
        await https.post(Uri.parse("http://localhost:3000/api/v1/new-salary"),
            headers: {"Content-Type": "application/json"},
            body: json.encode({
              "name": name,
              "emplid": id,
              "salary": salary,
              "month": month,
            }));
    var _jsonString = response.body;
    print("_jsonString_");

    return (_jsonString);
  } catch (err) {
    print("Error in establishing connection 101");
  }
}

/* Generate output for available blood group */
showSalary(String id) async {
  try {
    print("___connection established___");
    var response = await https.post(
        Uri.parse("http://localhost:3000/api/v1/new-salary/search-emp"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "emplid": id,
        }));
    var _jsonString = response.body;
    print("_jsonString_");

    return (_jsonString);
  } catch (err) {
    print("Error in establishing connection 101");
  }
}

/* Generate output for available blood group */
addrooster(List<String> addList) async {
  try {
    print("___connection established___");
    var response =
        await https.post(Uri.parse("http://localhost:3000/api/v1/new-rooster"),
            headers: {"Content-Type": "application/json"},
            body: json.encode({
              "mm": addList[0],
              "mt": addList[1],
              "mw": addList[2],
              "mth": addList[3],
              "mf": addList[4],
              "nm": addList[5],
              "nt": addList[6],
              "nw": addList[7],
              "nth": addList[8],
              "nf": addList[9],
            }));
    var _jsonString = response.body;
    print("_jsonString_");

    print(_jsonString);
  } catch (err) {
    print("Error in establishing connection 101");
  }
}

showRoosters() async {
  try {
    print("___connection established___");
    var response = await https.get(
      Uri.parse("http://localhost:3000/api/v1/new-rooster"),
      headers: {"Content-Type": "application/json"},
    );
    var _jsonString = response.body;
    print("_jsonString_");
    return _jsonString;
    // print(_jsonString);
  } catch (err) {
    print("Error in establishing connection 101");
  }
}

/* Generate output for available blood group */
addRequest(
  String id,
  String category,
  String msg,
) async {
  try {
    print("___connection established___");
    var response =
        await https.post(Uri.parse("http://localhost:3000/api/v1/new-request"),
            headers: {"Content-Type": "application/json"},
            body: json.encode({
              "cat": category,
              "emplid": id,
              "msg": msg,
            }));
    var _jsonString = response.body;
    print("_jsonString_");

    return (_jsonString);
  } catch (err) {
    print("Error in establishing connection 101");
  }
}

showRequests() async {
  try {
    print("___connection established___");
    var response = await https.get(
      Uri.parse("http://localhost:3000/api/v1/new-request"),
      headers: {"Content-Type": "application/json"},
    );
    var _jsonString = response.body;
    print("_jsonString_");
    return _jsonString;
    // print(_jsonString);
  } catch (err) {
    print("Error in establishing connection 101");
  }
}
