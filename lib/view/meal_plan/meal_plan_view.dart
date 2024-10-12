import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../common/Color.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/tab_button.dart';
import '../../services/database.dart';
import '../workout/workout_detail_view.dart';

class MealPlanView extends StatefulWidget {
  const MealPlanView({super.key});

  @override
  State<MealPlanView> createState() => _MealPlanViewState();
}

class _MealPlanViewState extends State<MealPlanView> {
  int isActiveTab = 0;
  Stream<QuerySnapshot>? fooditemStream;

  List planArr = [
    {
      "name": "Breafast",
      "image": "assets/img/f1.png",
      "title": "Meal Plan",
      "subtitle": "Personalized workouts will help\nyou gain strength"
    },
    {
      "name": "Snack",
      "image": "assets/img/f2.png",
      "title": "Meal Plan",
      "subtitle": "Personalized workouts will help\nyou gain strength"
    },
    {
      "name": "Breafast",
      "image": "assets/img/f3.png",
      "title": "Meal Plan",
      "subtitle": "Personalized workouts will help\nyou gain strength"
    },
    {
      "name": "Snack",
      "image": "assets/img/f4.png",
      "title": "Meal Plan",
      "subtitle": "Personalized workouts will help\nyou gain strength"
    },
  ];

  ontheload() async {
    try {
      fooditemStream = await DatabaseMethods().getFoodItem('DietPlan');
      setState(() {});
    } catch (e) {
      print("Error loading food items: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    ontheload();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              "assets/img/back.png",
              width: 25,
              height: 25,
            )),
        title: Text(
          "Meal Plan",
          style: TextStyle(
              color: AppColor.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: AppColor.white, boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 4, offset: Offset(0, 2))
            ]),
            child: Row(
              children: [
                Expanded(
                  child: TabButton(
                    title: "Water",
                    isActive: isActiveTab == 0,
                    onPressed: () {
                      setState(() {
                        isActiveTab = 0;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: TabButton(
                    title: "Food",
                    isActive: isActiveTab == 1,
                    onPressed: () {
                      setState(() {
                        isActiveTab = 1;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/img/black_fo.png",
                    width: 20,
                    height: 20,
                  ),
                ),
                Expanded(
                  child: Text(
                    "Sunday, AUG 26",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColor.secondaryText,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/img/next_go.png",
                    width: 20,
                    height: 20,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: planArr.length + 1, // Adding 1 for StreamBuilder section
              itemBuilder: (context, index) {
                if (index < planArr.length) {
                  var plan = planArr[index];
                  String imageUrl = plan["image"];
                  String name = plan["name"];
                  String title = plan["title"];
                  String subtitle = plan["subtitle"];

                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: media.width * 0.5,
                    decoration: BoxDecoration(
                      color: AppColor.gray,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      children: [
                        Image.asset(
                          imageUrl,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          width: media.width,
                          height: media.width * 0.5,
                          decoration: BoxDecoration(
                            color: index % 2 == 0
                                ? Colors.black.withOpacity(0.7)
                                : AppColor.gray.withOpacity(0.35),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                  color: AppColor.primary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                name,
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                subtitle,
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: 100,
                                    height: 25,
                                    child: RoundButton(
                                      title: "see more",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const WorkoutDetailView(),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return StreamBuilder(
                    stream: fooditemStream,
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return Center(child: Text("No data available"));
                      }

                      if (snapshot.hasError) {
                        return Center(child: Text("An error occurred: ${snapshot.error}"));
                      }

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot ds = snapshot.data!.docs[index];
                          String imageUrl = ds["Image"];
                          String foodName = ds["Name"];
                          String foodDetail = ds["Detail"];

                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            height: media.width * 0.5,
                            decoration: BoxDecoration(
                              color: AppColor.gray,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Stack(
                              children: [
                                Image.network(
                                  imageUrl,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress.expectedTotalBytes != null
                                            ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                            : null,
                                      ),
                                    );
                                  },
                                  errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                                ),
                                Container(
                                  width: media.width,
                                  height: media.width * 0.5,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Diet Plan",
                                        style: TextStyle(
                                          color: AppColor.primary,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        foodName,
                                        style: TextStyle(
                                          color: AppColor.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        foodDetail,
                                        style: TextStyle(
                                          color: AppColor.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const Spacer(),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            height: 25,
                                            child: RoundButton(
                                              title: "see more",
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => const WorkoutDetailView(),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
