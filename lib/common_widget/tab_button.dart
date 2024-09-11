import 'package:flutter/material.dart';
import '../common/Color.dart';

class TabButton extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onPressed;
  const TabButton(
      {super.key,
        required this.title,
        required this.isActive,
        required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              title,
              style: TextStyle(
                  color: isActive ? AppColor.primary : AppColor.secondaryText,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            color: isActive ? AppColor.primary : Colors.transparent,
            height: 2,
          )
        ],
      ),
    );
  }
}

class TabButton2 extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onPressed;
  const TabButton2(
      {super.key,
        required this.title,
        required this.isActive,
        required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
        decoration: BoxDecoration(
            color: isActive ? AppColor.primary : Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Text(
            title,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: isActive ? AppColor.white : AppColor.secondaryText,
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}