import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethod {
  getUserByUserName(String username) async {
    return await Firestore.instance
        .collection("username")
        .where("name", isEqualTo: username)
        .getDocuments();
  }

  uploadUserInfo(userMap) {
    Firestore.instance.collection("username").add(userMap);
  }

  createChatRoom(String chatroomId, chatRoomMap) {
    Firestore.instance
        .collection("chatroom")
        .document(chatroomId)
        .setData(chatRoomMap);
  }
}
