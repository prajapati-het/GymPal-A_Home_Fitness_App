import 'package:flutter/material.dart';
import 'package:gympal/wallet/wallet.dart';
import '../../common/Color.dart';
import '../../common_widget/round_button.dart';
import '../services/database.dart';
import '../services/shared_pref.dart';

class MentorView extends StatefulWidget {
  const MentorView({super.key});

  @override
  State<MentorView> createState() => _MentorViewState();
}

class _MentorViewState extends State<MentorView> {
  List mentorArr = [
    {
      "name": "Amit Kakkar",
      "image": "assets/img/mentor1.jpg",
      "price": "₹6000 / month",
    },
    {
      "name": "Kunal Rajput",
      "image": "assets/img/mentor2.jpg",
      "price": "₹5000 / month",
    },
    {
      "name": "Neha Dhupia",
      "image": "assets/img/mentor3.jpg",
      "price": "₹6500 / month",
    },
    {
      "name": "Anshuka Parwani",
      "image": "assets/img/mentor4.jpg",
      "price": "₹8500 / month",
    },
  ];

  getthesharedpref() async {
    id = await SharedPreferenceHelper().getUserId();
    wallet = await SharedPreferenceHelper().getUserWallet();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    // Fetch wallet balance when the widget is initialized
    getthesharedpref();
    fetchWalletBalance();
  }

  String? wallet;
  String? id;

  Future<void> fetchWalletBalance() async {
    String? fetchedWallet = await SharedPreferenceHelper().getUserWallet();

    if (fetchedWallet == null || fetchedWallet.isEmpty) {
      wallet = '0'; // Default value or handle accordingly
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Wallet is initialized to zero.'),
        ),
      );
    } else {
      wallet = fetchedWallet; // Set the fetched wallet value
    }

    // Log the wallet value
    print('Fetched wallet balance: $wallet');
    setState(() {});
  }

  Future<void> handleSubscription(int amount2) async {
    // Check if wallet and id are initialized
    if (wallet == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Wallet not initialized. Please try again.'),
        ),
      );
      return;
    }

    if (id == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User ID not set.'),
        ),
      );
      return;
    }

    int walletAmount = int.tryParse(wallet!) ?? 0; // Safe parsing
    print('Wallet amount before subscription: $walletAmount');

    if (walletAmount >= amount2) {
      int amount = walletAmount - amount2;

      await DatabaseMethods().updateUserwallet(id!, amount.toString());
      await SharedPreferenceHelper().saveUserWallet(amount.toString());

      // Show a snackbar indicating successful checkout
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Subscribed'),
      ));
    } else {
      // Show a snackbar indicating not enough money
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Not Enough Money in Wallet'),
      ));
    }
  }


  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        centerTitle: true,
        elevation: 0.1,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            "assets/img/back.png",
            width: 25,
            height: 25,
          ),
        ),
        title: Text(
          "Mentors",
          style: TextStyle(
            color: AppColor.primaryText,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        itemCount: mentorArr.length,
        itemBuilder: (context, index) {
          var mObj = mentorArr[index] as Map? ?? {};
          int mentorPrice = int.parse(mObj["price"].toString().replaceAll('₹', '').replaceAll('/ month', '').trim());
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: media.width * 0.5,
            decoration: BoxDecoration(
              color: AppColor.gray,
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                Image.asset(
                  mObj["image"].toString(),
                  width: media.width,
                  height: media.width * 0.5,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: media.width,
                  height: media.width * 0.5,
                  decoration: BoxDecoration(
                    color: index % 2 == 0
                        ? Colors.black.withOpacity(0.7)
                        : AppColor.gray.withOpacity(0.35),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 25,
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mObj["name"],
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        mObj["price"],
                        style: TextStyle(
                          color: AppColor.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 120,
                            height: 50,
                            child: RoundButton(
                              title: "Subscribe",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              onPressed: () async {
                                await handleSubscription(mentorPrice);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {},
                child: Image.asset(
                  "assets/img/menu_running.png",
                  width: 25,
                  height: 25,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Image.asset(
                  "assets/img/menu_meal_plan.png",
                  width: 25,
                  height: 25,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Image.asset(
                  "assets/img/menu_home.png",
                  width: 25,
                  height: 25,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Wallet()));
                },
                child: Image.asset(
                  "assets/img/wallet_icon.png",
                  width: 25,
                  height: 25,
                ),
              ),
              InkWell(
                onTap: () {
                },
                child: Image.asset(
                  "assets/img/more.png",
                  width: 25,
                  height: 25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
