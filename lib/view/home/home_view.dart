import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gympal/common/Color.dart';
import 'package:gympal/common_widget/round_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {

    var media = MediaQuery.of(context).size;


    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome Back,",
                          style: TextStyle(color: AppColor.gray, fontSize: 16),
                        ),
                        Text(
                          "Stefani Wong",
                          style: TextStyle(
                              color: AppColor.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: media.width * 0.05,
                        ),
                      ],
                    ),
                    
                    IconButton(
                        onPressed: (){},
                        icon: Image.asset(
                          "assets/img/notification_active.png",
                          width: 25.0,
                          height: 25.0,
                          fit: BoxFit.fitHeight,
                        )
                    )
                    
                  ],
                ),
                
                SizedBox(
                  height: media.width * 0.05,
                ),
                Container(

                  height: media.width * 0.4,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: AppColor.primaryG
                    ),
                    borderRadius: BorderRadius.circular(media.width * 0.075)
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        "assets/img/bg_dots.png",
                        height: media.width * 0.4,
                        width: double.maxFinite,
                        fit:BoxFit.fitHeight,
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "BMI (Body Mass Index)",
                                  style: TextStyle(
                                      color: AppColor.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "You have a normal weight,",
                                  style: TextStyle(
                                      color: AppColor.white.withOpacity(0.7),
                                      fontSize: 12),
                                ),
                                SizedBox(
                                  height: media.width * 0.05,
                                ),

                                SizedBox(
                                  width: 120,
                                  height: 35,
                                  child: RoundButton(
                                      title: "View More",
                                      type: RoundButtonType.bgSGradient,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      onPressed: (){}
                                  ),
                                )

                              ],
                            ),

                            AspectRatio(
                              aspectRatio: 1,
                              child: PieChart(
                                PieChartData(
                                  pieTouchData: PieTouchData(
                                    touchCallback: (FlTouchEvent event, pieTouchResponse) {

                                    },
                                  ),
                                  startDegreeOffset: 250,
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                  sectionsSpace: 1,
                                  centerSpaceRadius: 0,
                                  sections: showingSections(),
                                ),
                              ),
                            ),

                          ],
                        ),
                      )

                    ],
                  ),
                ),

                SizedBox(
                  height: media.width * 0.05,
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(2, (i) {
      var color0 = AppColor.secondaryColor1;

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: color0,
            value: 33,
            title: '',
            radius: 50,
            titlePositionPercentageOffset: 0.55,
            badgeWidget: Text(
              "20.1",
              style: TextStyle(
                  color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w700
              ),
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.white,
            value: 75,
            title: '',
            radius: 45,
            titlePositionPercentageOffset: 0.55,
          );
        default:
          throw Error();
      }
    });
  }
}