// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, sized_box_for_whitespace, avoid_unnecessary_containers

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../Modules/OnBoardingModule.dart';
import 'HomeScreen.dart';
import 'SignInScreen.dart';

class OnBoardingScreen extends StatefulWidget {
//  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  late PageController _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        title: currentIndex == 2
            ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //  Image.asset("assets/images/khaled.png"),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //Image.asset("assets/images/khaled.png"),
                  Container(
                    width: 100,
                    height: 50,
                    child: RawMaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      fillColor: Color.fromRGBO(0, 102, 204, 1),
                      onPressed: () {
                        setState(() {
                          currentIndex = 2;
                        });
                      },
                      child: Text(
                        "Skip",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 615,
                child: PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    allowImplicitScrolling: false,
                    onPageChanged: (int index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemCount: contents.length,
                    itemBuilder: (_, i) {
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            height: 495,
                            width: double.infinity,
                            child: Image.asset(
                              contents[currentIndex].image,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                contents.length,
                                (index) => buildDot(index, context),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            contents[currentIndex].title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                        ],
                      );
                    }),
              ),
              currentIndex == 2
                  ? Container(
                      width: 166,
                      height: 48,
                      child: RawMaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        fillColor: Color.fromRGBO(41, 48, 60, 1),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInScreen()));
                        },
                        child: Text(
                          "Get Started",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  : Container(
                      width: 48,
                      height: 48,
                      child: RawMaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        fillColor: Color.fromRGBO(41, 48, 60, 1),
                        onPressed: () {
                          setState(() {
                            currentIndex++;
                            // _controller.nextPage(
                            //   duration: Duration(milliseconds: 100),
                            //   curve: Curves.bounceIn,
                            // );
                          });
                        },
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.white,
                        ),
                      ),
                    ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: 10, //currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index
            ? Color.fromRGBO(0, 0, 0, 1)
            : Color.fromRGBO(0, 0, 0, 0.2), // Theme.of(context).primaryColor,
      ),
    );
  }
}
