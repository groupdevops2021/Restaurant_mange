import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaruant_manager/home_member.dart';
import 'package:restaruant_manager/login.dart';
import 'package:restaruant_manager/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
//
// class MainScreen extends StatelessWidget {
//   const MainScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, AsyncSnapshot<User?> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return LoginPage();
//         }
//         if (!snapshot.hasData || snapshot.data == null) {
//           return LoginPage();
//         }
//         print("snapshot.data.email");
//         print(snapshot.data?.email);
//         return const HomeMember();
//       },
//     );
//   }
// }
