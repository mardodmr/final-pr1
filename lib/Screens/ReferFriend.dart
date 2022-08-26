// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class ReferAFriendScreen extends StatefulWidget {
  //const ReferAFriendScreen({Key? key}) : super(key: key);

  @override
  State<ReferAFriendScreen> createState() => _ReferAFriendScreenState();
}

class _ReferAFriendScreenState extends State<ReferAFriendScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  width: double.infinity,
                  child: Image.asset(
                    "assets/images/Friend.png",
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Refer a Friend &\nGet 50% off",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "- Get 50% off upto \$20 after your friend’s 1st order\n- Your friend gets 50% off on their 1st order",
                style: TextStyle(
                  height: 2,
                  fontSize: 14,
                  color: Color.fromRGBO(83, 87, 99, 1),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: 165,
                height: 48,
                child: RawMaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  fillColor: Color.fromRGBO(41, 48, 60, 1),
                  onPressed: () {},
                  child: Text("Refer a friend",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
