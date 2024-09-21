
import 'package:flutter/material.dart';

import 'package:gympal/common_widget/setting_select_row.dart';
import 'package:gympal/common_widget/setting_switch_row.dart';
import 'package:gympal/view/settings/connect_view.dart';
import 'package:gympal/view/settings/select_language_view.dart';
import '../../common/Color.dart';


class SettingView extends StatefulWidget {
 const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  List settingArr = [
    {"name":"Reminders","type":"switch", "value":"false"},
    {"name":"Language", "type":"select", "value":"ENGLISH"},
    {"name":"Connected", "type":"select", "value":"Facebook"},
    {"name":"Apple Health", "type":"switch", "value":"true"},
    {"name":"Warm-Up", "type":"switch", "value":"false"},
    {"name":"Cool-Down", "type":"switch", "value":"false"},
    {"name":"Auto Push", "type":"switch", "value":"false"},
    {"name":"Pause For Running", "type":"switch", "value":"false"},
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
          "Settings",
          style: TextStyle(
              color: AppColor.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          itemBuilder: (context,index){
            var tObj = settingArr[index] as Map? ?? {};

            if(tObj["type"] == "switch"){
               return SettingSwitchRow(tObj: tObj, onChanged: (newVal){
                 tObj["value"] = newVal ? "true" : "false";
                 settingArr[index]["value"] = newVal ? "true" : "false";
                 setState(() {

                 });
               });

            }else if(tObj["type"] == "select"){
              return SettingSelectRow(tObj: tObj, onPressed: (){
                     if(tObj["name"]=="Language")
                       {
                         Navigator.push(context,
                             MaterialPageRoute(builder: (context)=>
                             SelectLanguageView(didSelect: (newVal){}
                         )));
                       }
                     else{
                       Navigator.push(context,
                           MaterialPageRoute(
                               builder:(context)=>
                                   ConnectView(didSelect: (newVal){})
                           ));
                     }
              });
            }



          } ,
          separatorBuilder: (context,index){return const Divider(color: Colors.black26,height:1,);}, itemCount: settingArr.length),
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {},
                child: Image.asset("assets/img/menu_running.png",
                    width: 25, height: 25),
              ),
              InkWell(
                onTap: () {},
                child: Image.asset("assets/img/menu_meal_plan.png",
                    width: 25, height: 25),
              ),
              InkWell(
                onTap: () {},
                child: Image.asset("assets/img/menu_home.png",
                    width: 25, height: 25),
              ),
              InkWell(
                onTap: () {},
                child: Image.asset("assets/img/menu_weight.png",
                    width: 25, height: 25),
              ),
              InkWell(
                onTap: () {},
                child:
                Image.asset("assets/img/more.png", width: 25, height: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}