import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konnect/screens/login.dart';

class SignedOut extends StatefulWidget {
  @override
  _SignedOutState createState() => _SignedOutState();
}

class _SignedOutState extends State<SignedOut> {
  @override
  void initState() {
    _throwMeOut(context).then((value) => Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login())));
    super.initState();
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "SIGN OUT",
              style: GoogleFonts.poppins(fontSize: 25),
              textAlign: TextAlign.center,
            ),
            Text(
              "SUCCESFUL",
              style: GoogleFonts.poppins(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3.0),
              ),
              child: Icon(
                FontAwesomeIcons.check,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future _throwMeOut(BuildContext context) async {
  await Future.delayed(Duration(milliseconds: 1500));
}
