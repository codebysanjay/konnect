import 'package:flutter/gestures.dart';
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
  Stream messageStream;
  Widget chatMessageList() {
    return StreamBuilder(
        stream: messageStream,
        builder: (
          context,
          snapshot,
        ) {
          return Padding(
            padding: EdgeInsets.only(bottom: 65),
            child: ListView.builder(
              reverse: true,
              dragStartBehavior: DragStartBehavior.start,
              itemBuilder: (context, index) {
                return MessageTile(
                    snapshot.data.documents[index].data["message"],
                    snapshot.data.documents[index].data["sendby"] ==
                        Constants.myName);
              },
              itemCount: snapshot.data.documents.length,
            ),
          );
        });
  }

  sendMessage() {
    if (messageController.text.isNotEmpty) {
      Map<String, dynamic> messageMap = {
        "message": messageController.text,
        "sendby": Constants.myName,
        "time": DateTime.now(),
      };
      dataBaseMethod.addConversationMessgaes(widget.chatRoomId, messageMap);
      messageController.clear();
    }
  }

  @override
  void initState() {
    dataBaseMethod.getConversationMessgaes(widget.chatRoomId).then((value) {
      setState(() {
        messageStream = value;
      });
    });
    super.initState();
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
        child: Stack(
          children: [
            chatMessageList(),
            Container(
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
          ],
        ),
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  final String message;
  final bool isSendByMe;

  // final bool isSendByMe;

  const MessageTile(this.message, this.isSendByMe);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: isSendByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: isSendByMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
            color: isSendByMe ? Color(0xff0c243b) : Color(0xff281e4f)),
        child: Text(
          message,
          style: GoogleFonts.poppins(fontSize: 18),
        ),
      ),
    );
  }
}
