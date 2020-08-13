import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethod {
  getUserByUserName(String username) async {
    return await Firestore.instance
        .collection("username")
        .where("name", isEqualTo: username)
        .getDocuments();
  }

  getUserByUserEmail(String useremail) async {
    return await Firestore.instance
        .collection("username")
        .where("email", isEqualTo: useremail)
        .getDocuments();
  }

  uploadUserInfo(userMap) {
    Firestore.instance.collection("username").add(userMap);
  }

  createChatRoom(String chatRoomId, chatRoomMap) {
    Firestore.instance
        .collection("chatroom")
        .document(chatRoomId)
        .setData(chatRoomMap);
  }

  addConversationMessgaes(String chatRoomId, messageMap) {
    Firestore.instance
        .collection("chatroom")
        .document(chatRoomId)
        .collection("chats")
        .add(messageMap);
  }

  getConversationMessgaes(String chatRoomId) async {
    return Firestore.instance
        .collection("chatroom")
        .document(chatRoomId)
        .collection("chats")
        .orderBy("time", descending: true)
        .snapshots();
  }

  getChatRooms(String userName) async {
    return await Firestore.instance
        .collection("chatroom")
        .where("users", arrayContains: userName)
        .snapshots();
  }
}
