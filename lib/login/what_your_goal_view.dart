import 'package:flutter/material.dart';
import 'package:gympal/common/Color.dart';
import '../common_widget/round_button.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WhatYourGoalView extends StatefulWidget {
  const WhatYourGoalView({super.key});

  @override
  State<WhatYourGoalView> createState() => _WhatYourGoalViewState();
}

class _WhatYourGoalViewState extends State<WhatYourGoalView> {

  CarouselSliderController buttonCarouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
          child: Stack(
            children: [
              Center(
                child: CarouselSlider(
                  items: ["assets/img/goal_1.png,assets/img/goal_2.png,assets/img/goal_3.png"].map((gObj)=> Container(color: Colors.red,)).toList(),
                  carouselController: buttonCarouselController,
                  options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    viewportFraction: 0.75,
                    aspectRatio: 0.8,
                    initialPage: 0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                width: media.width,
                child: Column(
                  children: [
                    SizedBox(height: media.width * 0.05),
                    Text(
                      "What is your goal ?",
                      style: TextStyle(
                        color: AppColor.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "It will help us to choose a best\nprogram for you!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColor.gray,
                        fontSize: 12.0,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(height: media.width * 0.05),

                    RoundButton(
                      title: "Confirm",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WhatYourGoalView(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: media.width * 0.05),

                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}
