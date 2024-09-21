
import 'package:flutter/material.dart';
import '../../common/Color.dart';
import '../../common_widget/connect_row.dart';


class ConnectView extends StatefulWidget {
  final Function(Map) didSelect;

  const ConnectView({super.key, required this.didSelect});

  @override
  State<ConnectView> createState() => _ConnectViewState();
}

class _ConnectViewState extends State<ConnectView> {

  int selectIndex = 0;

  List connectArr = [
    {
      "name":"Connect To Facebook",
      "icon":"assets/img/facebook2.png",
      "color":AppColor.primary,
    },
    {
      "name":"Connect To Twitter",
      "icon":"assets/img/twitter2.png",
      "color":AppColor.primary,
    },
    {
      "name":"Connect To LinkedIn",
      "icon":"assets/img/linkedin2.png",
      "color":AppColor.primary,
    },

  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        centerTitle: true,
        elevation: 0.1,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              "assets/img/black_white.png",
              width: 25,
              height: 25,
            )),
        title: Text(
          "Connected",
          style: TextStyle(
              color: AppColor.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          itemBuilder: (context,index){
            var tObj = connectArr[index] as Map? ?? {};

            return ConnectRow(
              tObj: tObj,
              isActive: selectIndex == index,
              onPressed: () {
                setState(() {
                  selectIndex = index;
                });

              },);
          } ,
          itemCount: connectArr.length),

    );
  }
}