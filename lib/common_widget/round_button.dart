import 'package:flutter/material.dart';
import '../common/Color.dart';

enum RoundButtonType { primary, primaryText }

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double fontSize;
  final FontWeight fontWeight;
  final RoundButtonType type;

  const RoundButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.fontSize = 20,
      this.fontWeight = FontWeight.w700,
      this.type = RoundButtonType.primary});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      textColor:
          type == RoundButtonType.primary ? AppColor.white : AppColor.primary,
      color:
          type == RoundButtonType.primary ? AppColor.primary : AppColor.white,
      height: 50,
      minWidth: double.maxFinite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Text(
        title,
        style: TextStyle(
            color: type == RoundButtonType.primary
                ? AppColor.white
                : AppColor.primary,
            fontSize: fontSize,
            fontWeight: fontWeight),
      ),
    );
  }
}
