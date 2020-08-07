import 'package:flutter/material.dart';
import 'package:konnect/screens/login.dart';
import 'package:konnect/screens/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: SignUp(),
    );
  }
}
