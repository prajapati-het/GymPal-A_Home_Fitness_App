import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:gympal/services/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseMethods {

  Future addUserDetail(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .set(userInfoMap);
  }

  Future updateUserwallet(String id, String amount) async {
    await SharedPreferenceHelper().saveUserWallet(amount);
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .update({"Wallet": amount});
  }

  Future addFoodItem(Map<String, dynamic> userInfoMap) async {
    return await FirebaseFirestore.instance
        .collection('DietPlan')
        .add(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getFoodItem(String name) async {
    return FirebaseFirestore.instance.collection(name).snapshots();
  }

  Future<Stream<QuerySnapshot>> getFoodCart(String id) async {
    return FirebaseFirestore.instance.collection("users").doc(id).collection("Cart").snapshots();
  }

  Future<String?> getUserName(String id) async {
    try {
      /*DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(id)
          .get();

      if (userDoc.exists) {
        return userDoc['Name']?.toString();
      } else {
        print('User does not exist. in getusername');
        return null;
      }*/
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(SharedPreferenceHelper.userNameKey);
    } catch (e) {
      print('Error getting user name: $e');
      return null;
    }
  }

  Future<String?> getUserId() async {
    try {
      /*DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc().
          .get();



      if (userDoc.exists) {
        return userDoc['Id']?.toString();
      } else {
        print('User does not exist. in getuserid');
        return null;
      }*/
      /*DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(
          await FirebaseFirestore.instance.collection('users').path
      ).get(GetOptions(
        source: Source.serverAndCache
      ));
      print(userDoc);
      print(await FirebaseFirestore.instance.collection('users').count().toString())*/;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print(prefs.getString(SharedPreferenceHelper.userIdKey));
      /*if (userDoc.exists) {
        print("Error in if");
        return userDoc['Id']?.toString();
      } else {
        print('User does not exist. in getuserid');
        return null;
      }*/
      return prefs.getString(SharedPreferenceHelper.userIdKey);
    } catch (e) {
      print('Error getting user id: $e');
      return null;
    }
  }


  Future<Map<String, String>?> getUserInfoFromMail(String? mail) async {
    try {
      if (mail == null) return null;

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('Email', isEqualTo: mail)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var doc = querySnapshot.docs.first;
        String userId = doc.get('Id');
        String userName = doc.get('Name');

        return {'id': userId, 'name': userName};
      } else {

        debugPrint('No user found with email: $mail');
        return null;
      }
    } catch (e) {
      debugPrint('Error getting user info: $e');
      return null;
    }
  }


  Future<String?> getUserNameFromMail(String? mail) async {
    try {
      if (mail == null) return null;

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: mail)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first.get('name');
      } else {
        print('No user found with email: $mail');
        return null;
      }
    } catch (e) {
      print('Error getting user name: $e');
      return null;
    }
  }

  Future<String?> getUserWallet(String id) async {
    try {
      /*DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(id)
          .get();

      if (userDoc.exists) {
        return userDoc['Wallet']?.toString();
      } else {
        print('User does not exist. in getuserwallet');
        return null;
      }*/
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(SharedPreferenceHelper.userWalletKey);
    } catch (e) {
      print('Error getting user wallet: $e');
      return null;
    }
  }

}
