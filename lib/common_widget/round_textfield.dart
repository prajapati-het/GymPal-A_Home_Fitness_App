import 'package:flutter/material.dart';

import '../common/Color.dart';

class RoundTextfield extends StatelessWidget {

  final TextEditingController? controller;
  final String hitText;
  final String icon;
  final EdgeInsets? margin;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? rightIcon;

  const RoundTextfield({super.key, required this.hitText, required this.icon, this.controller, this.margin, this.keyboardType, this.obscureText=false, this.rightIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: AppColor.lightGray,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obscureText,

        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                vertical: 15.0, horizontal: 15.0
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: hitText,
            suffixIcon: rightIcon,
            prefixIcon: Container(
              alignment: Alignment.center,
              width: 15.0,
              height: 15.0,
              child: Image.asset(
                icon,
                width: 15.0,
                height: 15.0,
                fit: BoxFit.contain,
                color: AppColor.gray,
              ),
            ),
            hintStyle: TextStyle(
                color: AppColor.gray,
                fontSize: 12.0
            )
        ),
      ),
    );
  }
}
