import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Welcome extends StatelessWidget {
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
                print('pressed');
              }),
        ],
      ),
      body: Center(
        child: Text("Welcome"),
      ),
    );
  }
}
