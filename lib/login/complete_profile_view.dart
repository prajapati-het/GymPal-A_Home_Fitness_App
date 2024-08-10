import 'package:flutter/material.dart';
import 'package:gympal/common/Color.dart';

import '../common_widget/round_button.dart';
import '../common_widget/round_textfield.dart';

class CompleteProfileView extends StatefulWidget {
  const CompleteProfileView({super.key});

  @override
  State<CompleteProfileView> createState() => _CompleteProfileViewState();
}

class _CompleteProfileViewState extends State<CompleteProfileView> {
  TextEditingController txtDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(children: [
              Image.asset(
                "assets/img/complete_profile.png",
                width: media.width,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                height: media.width * 0.05,
              ),
              Text(
                "Let's complete your profile",
                style: TextStyle(
                    color: AppColor.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "It will help us to know more about you!",
                style: TextStyle(
                  color: AppColor.gray,
                  fontSize: 12.0,
                ),
              ),
              SizedBox(
                height: media.width * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    RoundTextfield(
                      controller: txtDate,
                      hitText: "Date of Birth",
                      icon: "assets/img/date.png",
                    ),
                    SizedBox(
                      height: media.width * 0.04,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: RoundTextfield(
                                hitText: "Your Weight",
                                controller: txtDate,
                                icon: "assets/img/weight_4.png")),
                        SizedBox(
                          width: 8.0,
                        ),
                        Container(
                          width: 45.0,
                          height: 45.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              gradient:
                                  LinearGradient(colors: AppColor.secondaryG),
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Text(
                            "KG",
                            style: TextStyle(
                                color: AppColor.white, fontSize: 12.0),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: media.width * 0.04,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: RoundTextfield(
                                      hitText: "Your Height",
                                      controller: txtDate,
                                      icon: "assets/img/height.png")),
                              SizedBox(
                                height: media.width * 0.04,
                              ),
                              Container(
                                width: 45.0,
                                height: 45.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: AppColor.secondaryG),
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: Text(
                                  "CM",
                                  style: TextStyle(
                                      color: AppColor.white, fontSize: 12.0),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: media.width * 0.2,
                          ),
                          RoundButton(title: "Next >", onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const CompleteProfileView()  ));
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
