import 'package:flutter/material.dart';
import 'package:gympal/common/Color.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      bottomNavigationBar: BottomAppBar(
        child: SafeArea(
          child: Container(
            height: kToolbarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    // Add your onTap functionality here
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Image.asset(
                      "assets/img/home_tab_select.png",
                      width: 25.0,
                      height: 25.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                // Add more widgets here if needed
              ],

            ),
          ),

        ),
      ),
    );
  }
}
