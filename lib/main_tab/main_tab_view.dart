import 'package:flutter/material.dart';
import 'package:gympal/common/Color.dart';

import '../common_widget/tab_button.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {

  int selectTab = 0;
  //Widget currentTab = const HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      bottomNavigationBar: BottomAppBar(
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TabButton(
                        icon: "assets/img/activity_tab.png",
                        selectIcon: "assets/img/activity_tab_select.png",
                        isActive: selectTab == 1,
                        onTap: () {
                          selectTab = 0;
                          if (mounted) {
                            setState(() {});
                          }
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
