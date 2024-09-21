import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/Color.dart';

class LanguageRow extends StatelessWidget {
  final Map tObj;
  final VoidCallback onPressed;
  final bool isActive;
  const LanguageRow({super.key, required this.tObj, required this.onPressed, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 27.58),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tObj["name"],
              style:TextStyle(
                  color: isActive ? AppColor.primary : AppColor.secondaryText,
                  fontSize: 18,
                  fontWeight: FontWeight.w700
              ),
            ),

            if(isActive)
            Image.asset("assets/img/tick.png",width: 30,height: 30,color: isActive ? AppColor.primary : AppColor.secondaryText,)
          ],
        ),
      ),
    );;
  }
}
