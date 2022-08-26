import 'package:flutter/material.dart';

import '../Modules/Module.dart';

class NotificationEmptyScreen extends StatelessWidget {
  const NotificationEmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "I Notification",
              style: TextStyle(color: Colors.black),
            ),
            Container(
              width: 100,
              height: 33,
              child: RawMaterialButton(
                //padding: EdgeInsets.symmetric(horizontal: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                fillColor: Theme.of(context).primaryColor,
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Recent ",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ],
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
              Container(
                  width: 100,
                  height: 100,
                  child: Image.asset("assets/images/Notification.png")),
              SizedBox(
                height: 40,
              ),
              Text(
                "No Notifications!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "You don't have any notification yet. Please place order",
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(176, 176, 176, 1),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: 239,
                height: 48,
                child: RawMaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  fillColor: Color.fromRGBO(41, 48, 60, 1),
                  onPressed: () {},
                  child: Text("View all courses",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
