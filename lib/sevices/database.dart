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

  getConversationMessgaes(String chatRoomId, messageMap) {
    Firestore.instance
        .collection("chatroom")
        .document(chatRoomId)
        .collection("chats")
        .add(messageMap);
  }
}
