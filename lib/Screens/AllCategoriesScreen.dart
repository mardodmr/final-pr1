// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:flutter/material.dart';


import '../Utils/constant.dart';
import 'HomeScreen.dart';
import 'SubCategoriesScreen.dart';
import 'package:final_pr1/Screens/HomeScreen.dart';

class CategoriesScreen extends StatefulWidget {
  //const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
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
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        height: double.infinity,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).primaryColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "I  ",
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(202, 189, 255, 1),
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    "All Categories",
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(26, 29, 31, 1),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Expanded(
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubCategoriesScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              padding: EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Color.fromRGBO(255, 188, 153, 1)),
                              child: Image.asset(
                                "assets/images/AC.png",
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Text(
                              "Electro Repair",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromRGBO(65, 64, 93, 1)),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            padding: EdgeInsets.all(14),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Color.fromRGBO(202, 189, 255, 1)),
                            child: Image.asset(
                              "assets/images/Beauty.png",
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Text(
                            "Beauty",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromRGBO(65, 64, 93, 1)),
                          )
                        ],
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.pushReplacement(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => SubCategoriesScreen(),
                    //       ),
                    //     );
                    //   },
                    //   child: Container(
                    //     width: 50,
                    //     height: 50,
                    //     child: Column(
                    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //       children: [
                    //         Container(
                    //           width: 70,
                    //           height: 70,
                    //           padding: EdgeInsets.all(14),
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(100),
                    //               color: Color.fromRGBO(177, 229, 252, 1)),
                    //           child: Image.asset(
                    //             "assets/images/Appliance.png",
                    //             fit: BoxFit.fitWidth,
                    //           ),
                    //         ),
                    //         Text(
                    //           "Appliance",
                    //           style: TextStyle(
                    //               fontSize: 15,
                    //               color: Color.fromRGBO(65, 64, 93, 1)),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Container(
                      width: 50,
                      height: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            padding: EdgeInsets.all(14),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Color.fromRGBO(181, 235, 205, 1)),
                            child: Image.asset(
                              "assets/images/Painting.png",
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Text(
                            "Painting",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromRGBO(65, 64, 93, 1)),
                          )
                        ],
                      ),
                    ),
                    // Container(
                    //   width: 50,
                    //   height: 50,
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: [
                    //       Container(
                    //         width: 70,
                    //         height: 70,
                    //         padding: EdgeInsets.all(14),
                    //         decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(100),
                    //             color: Color.fromRGBO(255, 216, 141, 1)),
                    //         child: Image.asset(
                    //           "assets/images/Cleaning.png",
                    //           fit: BoxFit.fitWidth,
                    //         ),
                    //       ),
                    //       Text(
                    //         "Cleaning",
                    //         style: TextStyle(
                    //             fontSize: 15,
                    //             color: Color.fromRGBO(65, 64, 93, 1)),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //   width: 50,
                    //   height: 50,
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: [
                    //       Container(
                    //         width: 70,
                    //         height: 70,
                    //         padding: EdgeInsets.all(14),
                    //         decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(100),
                    //             color: Color.fromRGBO(203, 235, 164, 1)),
                    //         child: Image.asset(
                    //           "assets/images/Plumbing.png",
                    //           fit: BoxFit.fitWidth,
                    //         ),
                    //       ),
                    //       Text(
                    //         "Plumbing",
                    //         style: TextStyle(
                    //             fontSize: 15,
                    //             color: Color.fromRGBO(65, 64, 93, 1)),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    Container(
                      width: 50,
                      height: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            padding: EdgeInsets.all(14),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Color.fromRGBO(251, 155, 155, 1)),
                            child: Image.asset(
                              "assets/images/Electronics.png",
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Text(
                            "Electronics",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromRGBO(65, 64, 93, 1)),
                          )
                        ],
                      ),
                    ),
                    // Container(
                    //   width: 50,
                    //   height: 50,
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: [
                    //       Container(
                    //         width: 70,
                    //         height: 70,
                    //         padding: EdgeInsets.all(14),
                    //         decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(100),
                    //             color: Color.fromRGBO(248, 176, 237, 1)),
                    //         child: Image.asset(
                    //           "assets/images/Shifting.png",
                    //           fit: BoxFit.fitWidth,
                    //         ),
                    //       ),
                    //       Text(
                    //         "Shifting",
                    //         style: TextStyle(
                    //             fontSize: 15,
                    //             color: Color.fromRGBO(65, 64, 93, 1)),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    Container(
                      width: 50,
                      height: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            padding: EdgeInsets.all(14),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Color.fromRGBO(175, 198, 255, 1)),
                            child: Image.asset(
                              "assets/images/Men'sSalon.png",
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Text(
                            "Grooming",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromRGBO(65, 64, 93, 1)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
