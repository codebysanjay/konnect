import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konnect/screens/chatlog.dart';
import 'package:konnect/screens/signup.dart';
import 'package:konnect/sevices/auth.dart';
import 'package:konnect/sevices/database.dart';
import 'package:konnect/sevices/helper.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  AuthMethods authMethods = AuthMethods();
  final formKeys = GlobalKey<FormState>();
  DataBaseMethod dataBaseMethod = DataBaseMethod();
  QuerySnapshot usernamesnap;
  bool isLoading = false;
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passWordTextEditingController = TextEditingController();
  loginMe() {
    if (formKeys.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      HelperFunctions.saveUserData(true);
      HelperFunctions.saveUserEmail(emailTextEditingController.text);
      HelperFunctions.saveUserName(usernamesnap.documents[0].data["name"]);
      authMethods
          .signInWithEmailAndPassword(
        emailTextEditingController.text,
        passWordTextEditingController.text,
      )
          .then((value) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Welcome()));
      });
    }
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
      body: isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              ),
            )
          : SingleChildScrollView(
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
                    Form(
                      key: formKeys,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) =>
                                RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value)
                                    ? null
                                    : "Enter a valid email",
                            controller: emailTextEditingController,
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
                          TextFormField(
                            obscureText: true,
                            validator: (value) => value.length > 5
                                ? null
                                : "Password must be atleast 6 charachers",
                            controller: passWordTextEditingController,
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
                        ],
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
                      onPressed: () {
                        loginMe();
                      },
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
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
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
