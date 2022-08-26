// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/constant.dart';
import 'HomeScreen.dart';
import 'ServiceDetailsScreen.dart';

class SubCategoriesScreen extends StatefulWidget {
  //const SubCategoriesScreen({Key? key}) : super(key: key);

  @override
  State<SubCategoriesScreen> createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: TextField(
          obscureText: false,
          keyboardType: TextInputType.text,
          onChanged: (val) {
            _phoneController.text = val;
          },
          decoration: kTextFieldDecoration.copyWith(
              prefixIcon: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Color.fromRGBO(26, 27, 45, 1),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              ),
              suffixIcon: Icon(
                Icons.search_rounded,
                color: Color.fromRGBO(26, 27, 45, 1),
              ),
              hintText: 'Search what you need...',
              hintStyle: TextStyle()),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            width: double.infinity,
            height: 900,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              children: [
                /// Address
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "I",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(202, 189, 255, 1),
                          ),
                        ),
                        Text(
                          "  English Courses",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(26, 29, 31, 1),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          child: RawMaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            fillColor: Color.fromRGBO(255, 255, 255, 1.0),
                            onPressed: () {},
                            child: Icon(Icons.list),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          child: RawMaterialButton(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            fillColor: Color.fromRGBO(247, 247, 247, 1),
                            onPressed: () {},
                            child: Icon(Icons.grid_on),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                ///1
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 160,
                          width: 150,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              "assets/images/Capture.PNG",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          height: 160,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Color.fromRGBO(255, 197, 84, 1),
                                  ),
                                  Text(
                                    "4.8",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(26, 29, 31, 1),
                                    ),
                                  ),
                                  Text(
                                    "(87)",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(111, 118, 126, 1),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Intro A ",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(26, 29, 31, 1),
                                ),
                              ),
                              Text(
                                "Starts From",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(154, 159, 165, 1),
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 30,
                                child: RawMaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  fillColor: Color.fromRGBO(181, 228, 202, 1),
                                  onPressed: () {},
                                  child: Text(
                                    "\$12.99",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(26, 29, 31, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, top: 10),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_vert),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  thickness: 2,
                ),

                ///2
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ServiceDetailsScreen(),
                      ),
                    );
                  },
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 160,
                              width: 150,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  "assets/images/Capture.PNG",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              height: 160,
                              padding: EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Color.fromRGBO(255, 197, 84, 1),
                                      ),
                                      Text(
                                        "4.8",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: Color.fromRGBO(26, 29, 31, 1),
                                        ),
                                      ),
                                      Text(
                                        "(87)",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color:
                                              Color.fromRGBO(111, 118, 126, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Intro B",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(26, 29, 31, 1),
                                    ),
                                  ),
                                  Text(
                                    "Starts From",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(154, 159, 165, 1),
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 30,
                                    child: RawMaterialButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      fillColor:
                                          Color.fromRGBO(181, 228, 202, 1),
                                      onPressed: () {},
                                      child: Text(
                                        "\$12.99",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Color.fromRGBO(26, 29, 31, 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10, top: 10),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.more_vert,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  thickness: 2,
                ),

                ///3
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 160,
                          width: 150,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              "assets/images/level1.PNG",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          height: 160,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Color.fromRGBO(255, 197, 84, 1),
                                  ),
                                  Text(
                                    "4.8",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(26, 29, 31, 1),
                                    ),
                                  ),
                                  Text(
                                    "(87)",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(111, 118, 126, 1),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Level 1 A",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(26, 29, 31, 1),
                                ),
                              ),
                              Text(
                                "Starts From",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(154, 159, 165, 1),
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 30,
                                child: RawMaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  fillColor: Color.fromRGBO(181, 228, 202, 1),
                                  onPressed: () {},
                                  child: Text(
                                    "\$15.99",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(26, 29, 31, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, top: 10),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_vert),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  thickness: 2,
                ),

                ///4
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 160,
                          width: 150,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              "assets/images/level1.PNG",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          height: 160,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Color.fromRGBO(255, 197, 84, 1),
                                  ),
                                  Text(
                                    "4.8",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(26, 29, 31, 1),
                                    ),
                                  ),
                                  Text(
                                    "(87)",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(111, 118, 126, 1),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Level 1 B",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(26, 29, 31, 1),
                                ),
                              ),
                              Text(
                                "Starts From",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(154, 159, 165, 1),
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 30,
                                child: RawMaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  fillColor: Color.fromRGBO(181, 228, 202, 1),
                                  onPressed: () {},
                                  child: Text(
                                    "\$15.99",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(26, 29, 31, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, top: 10),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_vert),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  thickness: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
