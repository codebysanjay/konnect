import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konnect/models/conversation.dart';
import 'package:konnect/screens/search.dart';
import 'package:konnect/screens/signout.dart';
import 'package:konnect/sevices/auth.dart';
import 'package:konnect/sevices/constants.dart';
import 'package:konnect/sevices/database.dart';
import 'package:konnect/sevices/helper.dart';

// ignore: must_be_immutable
class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  AuthMethods authMethods = AuthMethods();
  DataBaseMethod dataBaseMethod = DataBaseMethod();
  Stream chatRoomStream;
  Widget chatRoomList() {
    return StreamBuilder(
      stream: chatRoomStream,
      builder: (context, snapshot) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return ChatRoomTile(
              snapshot.data.documents[index].data["chatroomid"]
                  .toString()
                  .replaceAll(Constants.myName, "")
                  .replaceAll("_", ""),
              snapshot.data.documents[index].data["chatroomid"],
            );
          },
          itemCount: snapshot.data.documents.length,
        );
      },
    );
  }

  @override
  void initState() {
    getUserInfo();

    super.initState();
  }

  getUserInfo() async {
    Constants.myName = await HelperFunctions.getUserNameSharedPreference();
    dataBaseMethod.getChatRooms(Constants.myName).then((value) {
      setState(() {
        chatRoomStream = value;
      });
    });
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
                  authMethods.signOut();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignedOut()));
                }),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 10,
          backgroundColor: Colors.blueAccent,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SearchScreen()));
          },
          child: Icon(
            Icons.add,
            size: 35,
            color: Color(0xff121726),
          ),
        ),
        body: chatRoomList());
  }
}

class ChatRoomTile extends StatelessWidget {
  final String userName;
  final String chatRoom;

  const ChatRoomTile(this.userName, this.chatRoom);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ConversationScreen(
                      chatRoomId: chatRoom,
                    )));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              alignment: Alignment.center,
              height: 40,
              width: 40,
              child: Text("${userName.substring(0, 1).toUpperCase()}",
                  style: GoogleFonts.ubuntu(
                    fontSize: 20,
                    color: Colors.white,
                  )),
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(20)),
            ),
            SizedBox(
              width: 10,
            ),
            Text(userName, style: GoogleFonts.roboto(fontSize: 25)),
          ],
        ),
      ),
    );
  }
}
