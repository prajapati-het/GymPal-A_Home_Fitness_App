import 'package:flutter/material.dart';
import 'package:gympal/view/on_boarding/on_boarding_view.dart';
import 'package:gympal/view/on_boarding/started_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GymPal',
      debugShowCheckedModeBanner: false,
      home: StartedView(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return OnBoardingView();
  }
}
