import 'package:flutter/material.dart';
import 'package:gympal/common/Color.dart';

class OnBoardingView extends StatefulWidget {
  OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/img/on_1.png',
            width: media.width,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(
            height: media.height * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              "Track Your Goal",
              style: TextStyle(
                color: AppColor.black,
                fontSize: 24,
                fontWeight: FontWeight.w700
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              "Don't worry if you have trouble determining your goals.\nWe can help you determining your goals and track your goals",
              style: TextStyle(
                  color: AppColor.gray,
                  fontSize: 14,
              ),
            ),
          )
        ],
      ),
    );
  }
}
