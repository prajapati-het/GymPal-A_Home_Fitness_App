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
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color : tObj["color"],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(

          children: [
            Image.asset(tObj["icon"],width: 30,height: 30),

            const SizedBox(width: 15),
            Expanded(
              child: Text(
                tObj["name"],
                style:TextStyle(
                    color: AppColor.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700
                ),
              ),
            ),

            const SizedBox(width: 15),
              Image.asset("assets/img/tick.png",
                            width: 30,
                            height: 30,
                            color: isActive ? Colors.green : Colors.white)
          ],
        ),
      ),
    );
  }
}
