import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konnect/screens/signup.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // ignore: unused_field
  String _email;
  // ignore: unused_field
  String _password;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              'SIGN IN\nPAGE',
              style: GoogleFonts.poppins(
                color: Colors.deepOrange,
                fontSize: 50,
                fontWeight: FontWeight.w500,
                height: 1,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Email", border: OutlineInputBorder()),
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "PassWord", border: OutlineInputBorder()),
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
            ),
            FlatButton(
              color: Colors.blue,
              onPressed: () {},
              child: Text(
                "SIGN IN",
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            FlatButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignUp()));
              },
              child: Text(
                "SIGN UP",
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
