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
  TextEditingController searchEditingController = TextEditingController();
  DataBaseMethod dataBaseMethod = DataBaseMethod();
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

  Widget searchList() {
    return searchSnapshot != null
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: searchSnapshot.documents.length,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                child: SearchTile(
                  useremail: searchSnapshot.documents[index].data["email"],
                  username: searchSnapshot.documents[index].data["name"],
                ),
              );
            },
          )
        : Text("No Data Found");
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
                searchList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SearchTile extends StatelessWidget {
  final String username;
  final String useremail;

  SearchTile({Key key, this.username, this.useremail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username,
                style: GoogleFonts.roboto(color: Colors.white, fontSize: 25),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                useremail,
                style: GoogleFonts.roboto(color: Colors.white, fontSize: 18),
              )
            ],
          ),
          GestureDetector(
              onTap: () {
                chatRoom(context, username);
              },
              child: Container(
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(0),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  FontAwesomeIcons.telegram,
                  color: Color(0xff101421),
                  size: 40,
                ),
              )),
        ],
      ),
    );
  }
}

getRoomId(String user1, String user2) {
  if (user1.substring(0, 1).codeUnitAt(0) >
      user2.substring(0, 1).codeUnitAt(0)) {
    return "$user2\_$user1";
  } else {
    return "$user1\_$user2";
  }
}

chatRoom(BuildContext context, String userName) {
  if (userName == Constants.myName) {
    String roomId = getRoomId(userName, Constants.myName);
    List<String> users = [userName, Constants.myName];
    Map<String, dynamic> chatRoomMap = {
      "users": users,
      "chatroomid": roomId,
    };
    DataBaseMethod().createChatRoom(roomId, chatRoomMap);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ConversationScreen()));
  } else {
    print("Sorry ");
  }
}
