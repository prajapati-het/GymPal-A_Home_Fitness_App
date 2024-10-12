import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gympal/common_widget/tip_row.dart';
import 'package:gympal/view/tips/tips_details_view.dart';
import '../../common/Color.dart';
import '../../common_widget/border_button.dart';

class TipsView extends StatefulWidget {
  const TipsView({super.key});

  @override
  State<TipsView> createState() => _TipsViewState();
}

class _TipsViewState extends State<TipsView> {
List tipsArr = [
  {"name":"About Training"},
  {"name":"How to weight loss?"},
  {"name":"Introducing about meal\n plan"},
  {"name":"Water and food"},
  {"name":"Drink Water"},
  {"name":"How many times a day\n to eat?"},
  {"name":"Become Stronger"},
  {"name":"Shoes To Training"},
  {"name":"Appeal Tips"},



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
          "Tips",
          style: TextStyle(
              color: AppColor.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          itemBuilder: (context,index){
            var tObj = tipsArr[index] as Map? ?? {};
        return TipRow(
            tObj: tObj,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>TipsDetailView(tObj: tObj)));
            },
            isActive: index == 0,
        );
      } ,
          separatorBuilder: (context,index){return Divider(color: Colors.black26,height:1,);}, itemCount: tipsArr.length),
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