import 'dart:convert';

import 'package:http/http.dart' as https;

requestUser(String email) async {
  try {
    print("___connection established___");
    var response = await https.post(
        Uri.parse("https://hotel-api123.herokuapp.com/api/v1/userDatas/log-emp"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"email": email}));
    var _jsonString = response.body;
    print("_jsonString_");

    return (_jsonString);
  } catch (err) {
    print("Error in establishing connection 101");
  }
}

/*function adding to user to db*/
adduser(
  String _email,
  String _name,
  String _roosterId,
) async {
  try {
    print("___connection established___");
    var response =
        await https.post(Uri.parse("https://hotel-api123.herokuapp.com/api/v1/userDatas"),
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

/*function to view members*/
viewUser() async {
  try {
    print("___connection established___12");
    var response = await https.get(
      Uri.parse("https://hotel-api123.herokuapp.com/api/v1/userDatas"),
      headers: {"Content-Type": "application/json"},
    );
    var _jsonString = response.body;
    print("_jsonString_");
    return (_jsonString);
  } catch (err) {
    print("Error in establishing connection 101");
  }
}

/*function for manager to add salary*/
addSalary(String name, String id, String salary, String month) async {
  try {
    print("___connection established___");
    var response =
        await https.post(Uri.parse("https://hotel-api123.herokuapp.com/api/v1/new-salary"),
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

/*function to display salary to members*/
showSalary(String id) async {
  try {
    print("___connection established___");
    var response = await https.post(
        Uri.parse("https://hotel-api123.herokuapp.com/api/v1/new-salary/search-emp"),
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

/*function to add roster by manager*/
addrooster(List<String> addList) async {
  try {
    print("___connection established___");
    var response =
        await https.post(Uri.parse("https://hotel-api123.herokuapp.com/api/v1/new-rooster"),
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
/*function to display roster to members*/
showRoosters() async {
  try {
    print("___connection established___");
    var response = await https.get(
      Uri.parse("https://hotel-api123.herokuapp.com/api/v1/new-rooster"),
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


/*function for adding request by members to manager*/
addRequest(
  String id,
  String category,
  String msg,
) async {
  try {
    print("___connection established___");
    var response =
        await https.post(Uri.parse("https://hotel-api123.herokuapp.com/api/v1/new-request"),
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

/*function for showing request to manager by members to */
showRequests() async {
  try {
    print("___connection established___");
    var response = await https.get(
      Uri.parse("https://hotel-api123.herokuapp.com/api/v1/new-request"),
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
