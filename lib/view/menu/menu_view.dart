import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gympal/common/Color.dart';
import 'package:gympal/common_widget/menu_cell.dart';
import 'package:gympal/view/home_view/home_view.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    List menuArr = [
      {"name": "Home", "image": "assets/img/menu_home.png", "tag": "1"},
      {"name": "Weight", "image": "assets/img/menu_weight.png", "tag": "2"},
      {
        "name": "Traning plan",
        "image": "assets/img/menu_traning_plan.png",
        "tag": "3"
      },
      {
        "name": "Training Status",
        "image": "assets/img/menu_traning_status.png",
        "tag": "4"
      },
      {
        "name": "Meal Plan",
        "image": "assets/img/menu_meal_plan.png",
        "tag": "5"
      },
      {"name": "Schedule", "image": "assets/img/menu_schedule.png", "tag": "6"},
      {"name": "Running", "image": "assets/img/menu_running.png", "tag": "7"},
      {
        "name": "Exercises",
        "image": "assets/img/menu_exercises.png",
        "tag": "8"
      },
      {"name": "Tips", "image": "assets/img/menu_tips.png", "tag": "9"},
      {
        "name": "Settings",
        "image": "assets/img/menu_settings.png",
        "tag": "10"
      },
      {"name": "Support", "image": "assets/img/menu_support.png", "tag": "11"},
    ];

    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.black,
                expandedHeight: media.width * 0.6,
                collapsedHeight: kToolbarHeight + 50,
                flexibleSpace: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Image.asset(
                      "assets/img/1.png",
                      width: media.width,
                      height: media.width * 0.8,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: media.width,
                      height: media.width * 0.8,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.transparent, Colors.black],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 30.0),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(27)),
                            width: 54.0,
                            height: 54.0,
                            alignment: Alignment.center,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.asset(
                                "assets/img/u1.png",
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "GymPal",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.white),
                              ),
                              SizedBox(
                                height: 4.0,
                              ),
                              Text(
                                "Profile",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.white),
                              )
                            ],
                          ))
                        ],
                      ),
                    )
                  ],
                ),
              )
            ];
          },
          body: GridView.builder(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1),
              itemCount: menuArr.length,
              itemBuilder: (context, index) {
                var mObj = menuArr[index] as Map? ?? {};
                return MenuCell(
                  mObj: mObj,
                  onPressed: () {
                    switch (mObj["tag"].toString()) {
                      case "1":
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeView()));
                        break;
                      default:
                        break;
                    }
                  },
                );
              })),
    );
  }
}
