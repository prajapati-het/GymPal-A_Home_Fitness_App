import 'package:flutter/material.dart';
import '../common/Color.dart';

enum RoundButtonType { bgGradient }

class RoundButton extends StatelessWidget {
  final String title;
  final RoundButtonType type;
  final VoidCallback onPressed;
  final double fontSize;
  final double elevation;
  final FontWeight fontWeight;

  const RoundButton({
    super.key,
    required this.title,
    this.type = RoundButtonType.bgGradient,
    this.fontSize = 16,
    this.elevation = 1,
    this.fontWeight = FontWeight.w700,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: type == RoundButtonType.bgGradient
            ? LinearGradient(
          colors: AppColor.primaryG,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )
            : null,
        borderRadius: BorderRadius.circular(25),
        boxShadow: type == RoundButtonType.bgGradient
            ? const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 0.5,
            offset: Offset(0, 0.5),
          ),
        ]
            : null,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        height: 50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        minWidth: double.infinity,
        elevation: type == RoundButtonType.bgGradient ? 0 : elevation,
        color: type == RoundButtonType.bgGradient
            ? Colors.transparent
            : AppColor.white,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: type == RoundButtonType.bgGradient
                  ? AppColor.white
                  : AppColor.primaryColor1,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
