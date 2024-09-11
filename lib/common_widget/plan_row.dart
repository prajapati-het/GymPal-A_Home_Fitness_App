import 'package:flutter/material.dart';
import '../common/Color.dart';

class PlanRow extends StatelessWidget {
  final Map mObj;
  final bool isSelect;
  final VoidCallback onPressed;
  const PlanRow({super.key, required this.mObj, this.isSelect = false, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            Image.asset(
              isSelect ? "assets/img/active.png" : mObj["icon"],
              width: 20,
              height: 20,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                mObj["name"],
                style: TextStyle(
                    color: isSelect  ? AppColor.primary : AppColor.secondaryText,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),

            if(mObj["right_icon"] != "" )
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Image.asset(
                  mObj["right_icon"],
                  width: 25,
                  height: 25,
                ),
              ),

          ],
        ),
      ),
    );
  }
}