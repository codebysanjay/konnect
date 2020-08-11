import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konnect/sevices/constants.dart';
import 'package:konnect/sevices/database.dart';

class ConversationScreen extends StatefulWidget {
  final String chatRoomId;

  const ConversationScreen({this.chatRoomId});
  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  DataBaseMethod dataBaseMethod = DataBaseMethod();
  TextEditingController messageController = TextEditingController();

  Widget chatMessageList() {
    return null;
  }

  sendMessage() {
    if (messageController.text.isNotEmpty) {
      Map<String, String> messageMap = {
        "message": messageController.text,
        "sendby": Constants.myName,
      };
      dataBaseMethod.getConversationMessgaes(widget.chatRoomId, messageMap);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff101421),
        title: Row(
          children: [
            Icon(FontAwesomeIcons.circleNotch),
            SizedBox(
              width: 10,
            ),
            Text(
              "konnect",
              style: GoogleFonts.ubuntu(fontSize: 25),
            ),
          ],
        ),
      ),
      body: Container(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.03),
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.white.withOpacity(0.03),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: Colors.white.withOpacity(0.03),
                        ),
                      ),

                      hintText: "Type a message",
                      // labelText: "Search User",
                      suffixIcon: IconButton(
                        onPressed: () {
                          sendMessage();
                        },
                        icon: Icon(
                          FontAwesomeIcons.arrowAltCircleRight,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
