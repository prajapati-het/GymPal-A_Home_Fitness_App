import 'package:flutter/material.dart';
import '../../common/Color.dart';
import '../../common_widget/round_button.dart';
import 'on_boarding_view.dart';

class StartedView extends StatefulWidget {
  const StartedView({super.key});

  @override
  State<StartedView> createState() => _StartedViewState();
}

class _StartedViewState extends State<StartedView> {
  bool isChangeColor = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.white,
      body: Container(
          width: media.width,
          decoration: BoxDecoration(
            gradient: isChangeColor
                ? LinearGradient(
                colors: AppColor.primaryG,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)
                : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                "GymPal",
                style: TextStyle(
                    color: AppColor.black,
                    fontSize: 36,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "Your Home Training Machine",
                style: TextStyle(
                  color: AppColor.gray,
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 40.0),
                  child: RoundButton(
                    title: "Get Started",
                    type:RoundButtonType.bgGradient,
                    onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OnBoardingView()));
                    },
                  ),
                ),
              )
            ],
          )),
    );
  }
}