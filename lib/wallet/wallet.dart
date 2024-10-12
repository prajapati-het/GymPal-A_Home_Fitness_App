import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

import '../common/Color.dart';
import '../common/app_constant.dart';
import '../services/database.dart';
import '../services/shared_pref.dart';
import '../widget/widget_support.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  String? wallet = '0', name;
  String? id;
  int? add;
  TextEditingController amountcontroller = TextEditingController();

  getthesharedpref() async {
    id = await DatabaseMethods().getUserId();
    if (id != null) {
      wallet = await DatabaseMethods().getUserWallet(id!);
      name = await DatabaseMethods().getUserName(id!);
      print("ID ==> $id");
      print(wallet);
    }

    setState(() {});
  }

  ontheload() async {
    await getthesharedpref();
    setState(() {});
  }

  @override
  void initState() {
    ontheload();
    Stripe.publishableKey = publishableKey;
    super.initState();
  }



  Map<String, dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: wallet == null
          ? Container(
          padding: EdgeInsets.only(
            top: 350,
            left: 200,
          ),
          child: Row(children: [
            Text("Wallet-> $wallet"),
            CircularProgressIndicator(),
          ]))
          : Container(
          margin: EdgeInsets.only(top: 60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                  elevation: 2.0,
                  child: Container(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Center(
                          child: Text(
                            "Wallet",
                            style: AppWidget.HeadlineTextFieldStyle(),
                          )))),
              SizedBox(
                height: 30.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Color(0xFFF2F2F2)),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/img/wallet.png",
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 40.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your Wallet",
                          style: AppWidget.LightTextFieldStyle(),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "\$" + wallet!,
                          style: AppWidget.boldTextFieldStyle(),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Add money",
                  style: AppWidget.SemiBoldTextFieldStyle(),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      makePayment('100');
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFE9E2E2)),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "\$" + "100",
                        style: AppWidget.SemiBoldTextFieldStyle(),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      makePayment('500');
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFE9E2E2)),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "\$" + "500",
                        style: AppWidget.SemiBoldTextFieldStyle(),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      makePayment('1000');
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFE9E2E2)),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "\$" + "1000",
                        style: AppWidget.SemiBoldTextFieldStyle(),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      makePayment('2000');
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFE9E2E2)),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "\$" + "2000",
                        style: AppWidget.SemiBoldTextFieldStyle(),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              GestureDetector(
                onTap: () {
                  openEdit();
                },
                child: Center(
                  child: Container(
                    height: 40.0,
                    width: 300,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color(0xFFE9E2E2),
                    ),
                    child: Center(
                      child: Text(
                        "Enter Custom Amount",
                        style: AppWidget.SemiBoldTextFieldStyle(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }



  Future<void> makePayment(String amount) async {
    try {
      paymentIntent = await createPaymentIntent(amount, 'INR');
      //Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent!['client_secret'],
              // applePay: const PaymentSheetApplePay(merchantCountryCode: '+92',),
              // googlePay: const PaymentSheetGooglePay(testEnv: true, currencyCode: "US", merchantCountryCode: "+92"),
              style: ThemeMode.dark,
              merchantDisplayName: 'Adnan'))
          .then((value) {});

      ///now finally display payment sheeet
      displayPaymentSheet(amount);
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet(String amount) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) async {
        add = int.parse(wallet!) + int.parse(amount);
        await SharedPreferenceHelper().saveUserWallet(add.toString());
        await DatabaseMethods().updateUserwallet(id!, add.toString());
        // ignore: use_build_context_synchronously
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                      Text("Payment Successfull"),
                    ],
                  ),
                ],
              ),
            ));
        await getthesharedpref();
        // ignore: use_build_context_synchronously

        paymentIntent = null;
      }).onError((error, stackTrace) {
        print('Error is:--->$error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
            content: Text("Cancelled "),
          ));
    } catch (e) {
      print('$e');
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $secretKey',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      // ignore: avoid_print
      print('Payment Intent Body->>> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      // ignore: avoid_print
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final calculatedAmount = (int.parse(amount)) * 100;

    return calculatedAmount.toString();
  }

  Future openEdit() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.cancel)),
                    SizedBox(
                      width: 60.0,
                    ),
                    Center(
                      child: Text(
                        "Add Money",
                        style: TextStyle(
                          color: Color(0xFF008080),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text("Amount"),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38, width: 2.0),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: amountcontroller,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Enter Amount'),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                      makePayment(amountcontroller.text);
                    },
                    child: Container(
                      width: 100,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color(0xFF008080),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text(
                            "Pay",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ));
}