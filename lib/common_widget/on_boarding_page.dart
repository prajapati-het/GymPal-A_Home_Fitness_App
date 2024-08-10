import 'package:flutter/material.dart';
import '../common/Color.dart';

class OnBoardingPage extends StatelessWidget {
  final Map pObj;
  const OnBoardingPage({super.key, required this.pObj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(pObj["image"].toString(),
            width: media.width,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(
            height: media.height * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              pObj["title"].toString(),
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
              pObj["subtitle"].toString(),
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
