import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../common/Color.dart';
import '../../common_widget/response_row.dart';

class TipsDetailView extends StatefulWidget {
  final Map tObj;
  const TipsDetailView({super.key, required this.tObj});

  @override
  State<TipsDetailView> createState() => _TipsDetailViewState();
}

class _TipsDetailViewState extends State<TipsDetailView> {




  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        centerTitle: true,
        elevation: 0.1,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              "assets/img/black_white.png",
              width: 25,
              height: 25,
            )),
        title: Text(
          "Tips",
          style: TextStyle(
              color: AppColor.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),

      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/img/1.png",
              width: media.width,
              height: media.width * 0.55,
              fit: BoxFit.cover,
            ),
           const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.tObj["name"],
                    style: TextStyle(
                        color: AppColor.secondaryText,
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
              child: Text(
                "Drink water",
                style: TextStyle(
                    color: AppColor.secondaryText,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Drinking water is essential for maintaining good health and hydration. It helps regulate body temperature, supports digestion, and keeps your organs functioning properly. Water also aids in nutrient absorption and helps flush out toxins from the body. Staying hydrated can improve energy levels, boost concentration, and promote healthy skin.",
                style: TextStyle(
                    color: AppColor.secondaryText,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
              child: Text(
                "Calories",
                style: TextStyle(
                    color: AppColor.secondaryText,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Calories are units of energy that fuel the body’s daily functions and physical activities. They come from the food and drinks we consume, primarily from carbohydrates, proteins, and fats. Managing calorie intake is crucial for maintaining a healthy weight—consuming more calories than the body needs leads to weight gain, while consuming fewer results in weight loss.",
                style: TextStyle(
                    color: AppColor.secondaryText,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {},
                child: Image.asset("assets/img/menu_running.png",
                    width: 25, height: 25),
              ),
              InkWell(
                onTap: () {},
                child: Image.asset("assets/img/menu_meal_plan.png",
                    width: 25, height: 25),
              ),
              InkWell(
                onTap: () {},
                child: Image.asset("assets/img/menu_home.png",
                    width: 25, height: 25),
              ),
              InkWell(
                onTap: () {},
                child: Image.asset("assets/img/menu_weight.png",
                    width: 25, height: 25),
              ),
              InkWell(
                onTap: () {},
                child:
                Image.asset("assets/img/more.png", width: 25, height: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
