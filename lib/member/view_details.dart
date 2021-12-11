import 'package:flutter/material.dart';
import 'package:restaruant_manager/connection.dart';

class ViewDetails extends StatelessWidget {
  const ViewDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: const Text("Profile")),
        ),
        body:
            profileView() // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget profileView() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 50),
          child: Stack(
            children: const [
              CircleAvatar(
                radius: 70,
                child: ClipOval(
                    child: Icon(
                  Icons.person,
                  size: 36,
                  color: Colors.white,
                )),
              ),
            ],
          ),
        ),
        Expanded(
            child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.black38, Colors.black45])),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                child: Container(
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Name ${AuthProvider.name}',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1.0, color: Colors.white70)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                child: Container(
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Email:  ${AuthProvider.userEmail}',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1.0, color: Colors.white70)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                child: Container(
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'ID: ${AuthProvider.uid}',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1.0, color: Colors.white70)),
                ),
              ),
            ],
          ),
        ))
      ],
    );
  }
}
