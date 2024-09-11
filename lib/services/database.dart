import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gympal/services/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseMethods {

  Future addUserDetail(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .set(userInfoMap);
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

      // Query Firestore to find the user document with the matching email
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: mail)
          .limit(1)
          .get();

      print("Query :  ${querySnapshot.docs.first}");

      // Check if any documents match the query
      if (querySnapshot.docs.isNotEmpty) {
        var doc = querySnapshot.docs.first;
        String userId = doc.id;
        String userName = doc.get('name');

        // Return a map containing both the user ID and name
        return {'id': userId, 'name': userName};
      } else {
        // No user found with the provided email
        print('No user found with email: $mail');
        return null;
      }
    } catch (e) {
      print('Error getting user info: $e');
      return null;
    }
  }

  Future<String?> getUserNameFromMail(String? mail) async {
    try {
      if (mail == null) return null;

      // Query Firestore to find the user document with the matching email
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: mail)
          .limit(1)
          .get();

      // Check if any documents match the query
      if (querySnapshot.docs.isNotEmpty) {
        // Extract the 'name' field from the document
        return querySnapshot.docs.first.get('name');
      } else {
        // No user found with the provided email
        print('No user found with email: $mail');
        return null;
      }
    } catch (e) {
      print('Error getting user name: $e');
      return null;
    }
  }

}
