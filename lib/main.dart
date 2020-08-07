import 'package:flutter/material.dart';
import 'package:konnect/screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff121726),
        accentColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
