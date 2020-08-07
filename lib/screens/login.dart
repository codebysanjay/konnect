import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          color: Color(0xff121726),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10, top: 20),
                child: Icon(
                  FontAwesomeIcons.circleNotch,
                  size: 60,
                ),
              ),
              Text(
                'konnect',
                style: GoogleFonts.ubuntu(
                  fontSize: 35,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    gapPadding: 2,
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.amber,
                      width: 2,
                    ),
                  ),
                  hintText: 'E-mail',
                  labelText: 'E-Mail',
                  prefixIcon: Icon(FontAwesomeIcons.envelope),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    gapPadding: 2,
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.amber,
                      width: 2,
                    ),
                  ),
                  prefixIcon: Icon(FontAwesomeIcons.lock),
                  hintText: 'Password',
                  labelText: 'Password',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {},
                    child: Text(
                      'Forgot password ?',
                      style: GoogleFonts.poppins(
                        color: Color(0xff33b3d6),
                      ),
                    ),
                  ),
                ],
              ),
              FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xff33b3d6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 3,
                    horizontal: 20,
                  ),
                  child: Text(
                    'LOGIN',
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      color: Color(0xff121726),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xff33b3d6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 15,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        FontAwesomeIcons.google,
                        size: 20,
                        color: Color(0xff121726),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'SignIn with Google',
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          color: Color(0xff121726),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Do not have an account',
                      style: GoogleFonts.poppins(
                        color: Color(0xff33b3d6),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'SignUp?',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Color(0xff33b3d6),
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
