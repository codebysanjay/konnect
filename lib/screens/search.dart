import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konnect/models/conversation.dart';
import 'package:konnect/sevices/constants.dart';
import 'package:konnect/sevices/database.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  DataBaseMethod dataBaseMethod = DataBaseMethod();
  TextEditingController searchEditingController = TextEditingController();
  QuerySnapshot searchSnapshot;
  initiateSearch() {
    dataBaseMethod
        .getUserByUserName(searchEditingController.text)
        .then((value) {
      setState(() {
        searchSnapshot = value;
      });
    });
  }

  createChatRoomAndStartConversation(
    String userName,
  ) {
    if (userName != Constants.myName) {
      String roomId = getChatRoomId(userName, Constants.myName);

      List<String> users = [userName, Constants.myName];
      Map<String, dynamic> chatRoomMap = {
        "users": users,
        "chatroomid": roomId,
      };
      dataBaseMethod.createChatRoom(roomId, chatRoomMap);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ConversationScreen(
                    chatRoomId: roomId,
                  )));
    } else {
      print('nomessage');
    }
  }

  getChatRoomId(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  Widget searchList() {
    return searchSnapshot != null
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: searchSnapshot.documents.length,
            itemBuilder: (context, index) {
              return searchTile(
                userEmail: searchSnapshot.documents[index].data["email"],
                userName: searchSnapshot.documents[index].data["name"],
              );
            },
          )
        : Container();
  }

  Widget searchTile({String userName, String userEmail}) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: GoogleFonts.roboto(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                userEmail,
                style: GoogleFonts.roboto(fontSize: 20),
              ),
            ],
          ),
          IconButton(
              icon: Icon(
                FontAwesomeIcons.telegram,
                size: 35,
              ),
              onPressed: () {
                createChatRoomAndStartConversation(userName);
              })
        ],
      ),
    );
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 15,
              left: 15,
              top: 20,
            ),
            child: Column(
              children: [
                TextField(
                  controller: searchEditingController,
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
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.03),
                      ),
                    ),

                    hintText: "Search User",
                    // labelText: "Search User",
                    suffixIcon: IconButton(
                      onPressed: () {
                        initiateSearch();
                      },
                      icon: Icon(
                        FontAwesomeIcons.search,
                        color: Colors.white.withOpacity(0.2),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: searchList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
