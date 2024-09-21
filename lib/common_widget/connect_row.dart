import 'package:flutter/material.dart';

import '../common/Color.dart';

class ConnectRow extends StatelessWidget {
  final Map tObj;
  final VoidCallback onPressed;
  final bool isActive;
  const ConnectRow({super.key, required this.tObj, required this.onPressed, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15), // Added horizontal padding for better alignment
        decoration: BoxDecoration(
          color: tObj["color"],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            ClipOval(
              child: Container(
                color: Colors.white, // Background color of the circle
                padding: const EdgeInsets.all(5.0), // Padding around the icon
                child: Image.asset(
                  tObj["icon"],
                  width: 50, // Increased size for better visibility
                  height: 50,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                tObj["name"],
                style: TextStyle(
                  color: AppColor.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Padding(
              padding: const EdgeInsets.only(right: 5.0), // Padding around the tick icon
              child: Image.asset(
                "assets/img/tick.png",
                width: 30, // Slightly increased tick icon size
                height: 30,
                color: isActive ? Colors.black : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
