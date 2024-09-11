import 'package:flutter/material.dart';
import 'package:gympal/view/workout/workout_detail_view.dart';
import '../../common/Color.dart';

class WorkoutView2 extends StatefulWidget {
  const WorkoutView2({super.key});

  @override
  State<WorkoutView2> createState() => _WorkoutView2State();
}

class _WorkoutView2State extends State<WorkoutView2> {
  List workArr = [
    {"name": "Push-Up", "image": "assets/img/1.png"},
    {"name": "Leg extenstion", "image": "assets/img/2.png"},
    {
      "name": "Push-Up",
      "image": "assets/img/5.png",
    },
    {
      "name": "Climber",
      "image": "assets/img/3.png",
    },
  ];

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
          "Workout",
          style: TextStyle(
              color: AppColor.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: workArr.length,
          itemBuilder: (context, index) {
            var wObj = workArr[index] as Map? ?? {};
            return Container(
              decoration: BoxDecoration(color: AppColor.white),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        wObj["image"].toString(),
                        width: media.width,
                        height: media.width * 0.55,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: media.width,
                        height: media.width * 0.55,
                        decoration:
                        BoxDecoration(color: Colors.black.withOpacity(0.5)),
                      ),
                      Image.asset(
                        "assets/img/play.png",
                        width: 60,
                        height: 60,
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          wObj["name"],
                          style: TextStyle(
                              color: AppColor.secondaryText,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const WorkoutDetailView()));
                            },
                            icon: Image.asset("assets/img/more.png",
                                width: 25, height: 25))
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
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