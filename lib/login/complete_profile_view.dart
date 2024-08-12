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
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: [
                Image.asset(
                  "assets/img/complete_profile.png",
                  width: media.width,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(height: media.width * 0.05),
                Text(
                  "Let's complete your profile",
                  style: TextStyle(
                    color: AppColor.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "It will help us to know more about you!",
                  style: TextStyle(
                    color: AppColor.gray,
                    fontSize: 12.0,
                  ),
                ),
                SizedBox(height: media.width * 0.05),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      GenderDropdown(
                        value: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value;
                          });
                        },
                      ),
                      SizedBox(height: media.width * 0.04),
                      RoundTextfield(
                        controller: txtDate,
                        hitText: "Date of Birth",
                        icon: "assets/img/date.png",
                      ),
                      SizedBox(height: media.width * 0.04),
                      Row(
                        children: [
                          Expanded(
                            child: RoundTextfield(
                              hitText: "Your Weight",
                              controller: txtDate,
                              icon: "assets/img/weight_4.png",
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Container(
                            width: 45.0,
                            height: 45.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: AppColor.secondaryG,
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Text(
                              "KG",
                              style: TextStyle(
                                color: AppColor.white,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: Column(
                          children: [
                            SizedBox(height: media.width * 0.04),
                            Row(
                              children: [
                                Expanded(
                                  child: RoundTextfield(
                                    hitText: "Your Height",
                                    controller: txtDate,
                                    icon: "assets/img/height.png",
                                  ),
                                ),
                                SizedBox(width: media.width * 0.04),
                                Container(
                                  width: 45.0,
                                  height: 45.0,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: AppColor.secondaryG,
                                    ),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Text(
                                    "CM",
                                    style: TextStyle(
                                      color: AppColor.white,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: media.width * 0.2),
                            RoundButton(
                              title: "Next >",
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const CompleteProfileView(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GenderDropdown extends StatelessWidget {
  final String? value;
  final ValueChanged<String?> onChanged;

  const GenderDropdown({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.lightGray,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: 50.0,
            height: 50.0,
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Image.asset(
              "assets/img/gender.png",
              width: 20.0,
              height: 20.0,
              fit: BoxFit.contain,
              color: AppColor.gray,
            ),
          ) ,
          Expanded(
            child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: value,
                  onChanged: onChanged,
                  isExpanded: true,

                  hint: Text(
                    "Choose Gender",
                    style: TextStyle(
                      color: AppColor.gray,
                      fontSize: 12.0,
                    ),
                  ),
                  items: ["Male", "Female"].map((name) {
                    return DropdownMenuItem<String>(
                      value: name,
                      child: Text(
                          name,
                          style: TextStyle(
                            color: AppColor.gray,
                            fontSize: 14.0,
                          ),
                        ),

                    );
                  }).toList(),
                ),
            ),
          ),
          SizedBox(
            width: 8.0,
          ),
        ],
      ),
    );
  }
}
