import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {

  static String userIdKey = "USERKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userProfileKey = "USERPROFILEKEY";

  Future<bool> saveUserId(String getUserId) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.setString(userIdKey, getUserId);
    } catch (e) {
      SharedPreferences.setMockInitialValues({});
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.setString(userIdKey, getUserId);
    }
  }

  Future<bool> saveUserName(String getUserName) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.setString(userNameKey, getUserName);
    } catch (e) {
      SharedPreferences.setMockInitialValues({});
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.setString(userNameKey, getUserName);
    }
  }

  Future<bool> saveUserEmail(String getUserEmail) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.setString(userEmailKey, getUserEmail);
    } catch (e) {
      SharedPreferences.setMockInitialValues({});
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.setString(userEmailKey, getUserEmail);
    }
  }

  Future<bool> saveUserProfile(String getUserProfile) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.setString(userProfileKey, getUserProfile);
    } catch (e) {
      SharedPreferences.setMockInitialValues({});
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.setString(userProfileKey, getUserProfile);
    }
  }

  Future<String?> getUserId() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(userIdKey);
    } catch (e) {
      SharedPreferences.setMockInitialValues({});
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(userIdKey);
    }
  }

  Future<String?> getUserName() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(userNameKey);
    } catch (e) {
      SharedPreferences.setMockInitialValues({});
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(userNameKey);
    }
  }

  Future<String?> getUserEmail() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(userEmailKey);
    } catch (e) {
      SharedPreferences.setMockInitialValues({});
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(userEmailKey);
    }
  }

  Future<String?> getUserProfile() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(userProfileKey);
    } catch (e) {
      SharedPreferences.setMockInitialValues({});
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(userProfileKey);
    }
  }

}
