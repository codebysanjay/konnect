import 'package:flutter/material.dart';
import 'package:konnect/screens/chatlog.dart';
import 'package:konnect/screens/login.dart';
import 'package:konnect/sevices/helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool userlogged = false;
  @override
  void initState() {
    getLoginState();
    super.initState();
  }

  getLoginState() async {
    await HelperFunctions.getUserLoggedInSharedPreference().then((value) {
      setState(() {
        userlogged = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff121726),
        applyElevationOverlayColor: true,
        accentColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: userlogged ? ChatRoom() : Login(),
    );
  }
}
