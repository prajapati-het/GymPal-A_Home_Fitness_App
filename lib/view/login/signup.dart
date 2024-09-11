import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gympal/view/menu/menu_view.dart';
import 'package:random_string/random_string.dart';
import '../../services/database.dart';
import '../../services/shared_pref.dart';
import '../../widget/widget_support.dart';

import 'login_view.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = "", password = "", name = "";

  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController mailcontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  registration() async {
    if (password.isNotEmpty) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Registered Successfully",
              style: TextStyle(fontSize: 20.0),
            )));

        String? Id = randomAlphaNumeric(10);
        Map<String, dynamic> addUserInfo = {
          "Name": namecontroller.text,
          "Email": mailcontroller.text,
          "Id": Id,
        };

        // Use await for async methods
        await DatabaseMethods().addUserDetail(addUserInfo, Id);
        await SharedPreferenceHelper().saveUserName(namecontroller.text);
        await SharedPreferenceHelper().saveUserEmail(mailcontroller.text);
        await SharedPreferenceHelper().saveUserId(Id);

        if (mounted) { // Check if widget is still mounted
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MenuView()));
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Password Provided is too Weak",
                style: TextStyle(fontSize: 18.0),
              )));
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Account Already exists",
                style: TextStyle(fontSize: 18.0),
              )));
        }
      } catch (e) {
        // Handle other potential errors
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "An error occurred: ${e.toString()}",
              style: TextStyle(fontSize: 18.0),
            )));
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.5,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFff5c30),
                            Color(0xFFe74b1a),
                          ])),
                ),
                Container(
                  margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: Text(""),
                ),
                Container(
                  margin: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: [
                      Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.only(left: 20.0, right: 20.0),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Form(
                            key: _formkey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 30.0,
                                ),
                                Text(
                                  "Sign up",
                                  style: AppWidget.HeadlineTextFieldStyle(),
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                TextFormField(
                                  controller: namecontroller,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Name';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      hintText: 'Name',
                                      hintStyle: AppWidget.SemiBoldTextFieldStyle(),
                                      prefixIcon: Icon(Icons.person_outlined)),
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                TextFormField(
                                  controller: mailcontroller,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter E-mail';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      hintText: 'Email',
                                      hintStyle: AppWidget.SemiBoldTextFieldStyle(),
                                      prefixIcon: Icon(Icons.email_outlined)),
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                TextFormField(
                                  controller: passwordcontroller,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Password';
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      hintText: 'Password',
                                      hintStyle: AppWidget.SemiBoldTextFieldStyle(),
                                      prefixIcon: Icon(Icons.password_outlined)),
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    if (_formkey.currentState!.validate()) {
                                      setState(() {
                                        email = mailcontroller.text;
                                        name = namecontroller.text;
                                        password = passwordcontroller.text;
                                      });
                                      registration();
                                    }
                                  },
                                  child: Material(
                                    elevation: 5.0,
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 8.0),
                                      width: 200,
                                      decoration: BoxDecoration(
                                          color: Color(0Xffff5722),
                                          borderRadius: BorderRadius.circular(20)),
                                      child: Center(
                                          child: Text(
                                            "SIGN UP",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.0,
                                                fontFamily: 'Poppins1',
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => LogIn()));
                          },
                          child: Text(
                            "Already have an account? Login",
                            style: AppWidget.SemiBoldTextFieldStyle(),
                          )),
                      SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
