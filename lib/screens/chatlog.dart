import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konnect/screens/search.dart';
import 'package:konnect/screens/signout.dart';
import 'package:konnect/sevices/auth.dart';
import 'package:konnect/sevices/constants.dart';
import 'package:konnect/sevices/helper.dart';

// ignore: must_be_immutable
class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  AuthMethods authMethods = AuthMethods();
  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  getUserInfo() async {
    Constants.myName = await HelperFunctions.getUserName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff101421),
        leading: Icon(FontAwesomeIcons.circleNotch),
        title: Text(
          'konnect',
          style: GoogleFonts.ubuntu(fontSize: 25),
        ),
        actions: [
          IconButton(
              tooltip: "SignOut",
              padding: EdgeInsets.all(0),
              icon: Icon(FontAwesomeIcons.windowClose),
              onPressed: () {
                authMethods.SignOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SignedOut()));
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchScreen()));
        },
        child: Icon(
          Icons.add,
          size: 35,
          color: Color(0xff121726),
        ),
      ),
      body: Center(
        child: Text(Constants.myName),
      ),
    );
  }
}
