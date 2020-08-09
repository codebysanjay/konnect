import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  static String userloginKey = "ISLOGGEDIN";
  static String userNameKey = "USERNAMEKEY";
  static String userEmail = "USEREMAILKEY";
  // Saving data to shared preference
  static Future<void> saveUserData(bool isUserLogedIn) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(userloginKey, isUserLogedIn);
  }

  static Future<void> saveUserName(String isUserName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(userNameKey, isUserName);
  }

  static Future<void> saveUserEmail(String isUserEmail) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(userEmail, isUserEmail);
  }

  // Getting data from shared preference
  static Future<bool> getUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(userloginKey);
  }

  static Future<void> getsaveUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(userNameKey);
  }

  static Future<void> getsaveUserEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(userEmail);
  }
}
