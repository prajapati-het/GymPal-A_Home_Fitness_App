import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gympal/view/login/on_boarding_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseOptions(
      apiKey: 'AIzaSyCxR45Lq16QVm2ZnlU746VtH8DLb_JaJ38',
      appId: '1:117394719485:android:40f90d83fdf07275907494',
      messagingSenderId: '117394719485',
      projectId: 'gympal-3420f',
      storageBucket: 'gympal-3420f.appspot.com'
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GymPal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins"
      ),
      home: OnBoardingView()
    );
  }
}
