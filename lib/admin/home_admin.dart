import 'package:flutter/material.dart';
import '../common/Color.dart';
import '../widget/widget_support.dart';
import 'add_item.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: AppColor.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              "assets/img/back.png",
              width: 25,
              height: 25,
            )),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: Column(
          children: [
            Center(child: Text("Home Admin", style: AppWidget.HeadlineTextFieldStyle(),),),
            SizedBox(height: 50.0,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AddFood()));
              },
              child: Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(10),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),

                    ),
                    child: Row(children: [
                      Padding(padding: EdgeInsets.all(6.0),
                        child: Image.asset("assets/img/food.jpg", height: 100, width: 100, fit: BoxFit.cover,),),
                      SizedBox(width: 30.0,) ,
                      Text("Add Food Items", style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                      )
                    ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}