// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_pr1/Screens/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ServiceDetailsScreen extends StatefulWidget {

  String thisCourseId;
  late String userId;
  ServiceDetailsScreen({ required this.thisCourseId, this.userId=""});

  @override
  _ServiceDetailsScreenState createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
  int Units = 0;
  int Bedrooms = 0;
  String _currentCourseName = "";
  String _currentCourseTeacher = "";
  String _currentCourseCenter ="";
  String _currentCourseClass ="";
  String _currentCourseDuratoin="";
  String _currentCoursePrice ="";

  // _valueSetter(String a, b, c, d, e, f){
  //
  //   a=_currentCourseName;
  //   b= _currentCourseTeacher;
  //   c=_currentCourseCenter;
  //   d=_currentCourseClass;
  //   e=_currentCourseDuratoin;
  //   f=_currentCoursePrice;
  //   print("done setiing values");
  // }

  Future _getCourseData() async {
    print ("im in get course data");
    await FirebaseFirestore.instance
        .collection("courses")
        .doc(widget.thisCourseId)
        .get()
        .then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        print ('${data['course name']}');
        //_currentCourseCenter= '${data['course name']}';

        _currentCourseName='${data['course name']}';
        _currentCourseTeacher='${data['teacher']}';
        _currentCourseCenter='${data['center']}';
        _currentCourseClass='${data['class']}';
        _currentCourseDuratoin='${data['duration']}';
        _currentCoursePrice='${data['price']}';

        print ("done query");
        print(_currentCourseCenter);
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  _enrollUser() async {
    await FirebaseFirestore.instance
        .collection("courses")
        .doc(widget.thisCourseId)
        .update({"participants": FieldValue.increment(1)});
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .update({
      "registered": FieldValue.arrayUnion([widget.thisCourseId])
    });
  }

  @override
  void initState() {
    super.initState();
    // print("im here service deatial init");
    // print(widget.thisCourseId);
    _getCourseData();
    // print(_currentCourseCenter);
    // print(_currentCourseClass);
    // print("out of init state");
  }

  bool click = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(

        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Stack(
            children: [
              Container(
                height: 250,
                child: Image(
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                  image: AssetImage('assets/images/interchange intro.PNG'),
                ),
              ),
              Positioned(
                top: 125,
                left: 0,
                right: 0,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 40, bottom: 20, right: 20),
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(30, 166, 166, 166),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                      ),
                    ),
                    child: Text('Interchange\nIntro B',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w700)),
                  ),
                ),
              ),

              Positioned(
                top: 80,
                left: 40,
                child: Container(
                  width: 70,
                  height: 35,
                ),
              ),
              Positioned(
                top: 15,
                left: 40,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreen()));
                  },
                ),
              ),
              Positioned(
                top: 215,
                left: 20,
                right: 20,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    width: width,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Column(
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
                              '$_currentCourseName',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(26, 29, 31, 1),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  padding: EdgeInsets.all(14),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color: Color.fromRGBO(209, 211, 212, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(18),
                                      color: Colors.white),
                                  child: Icon(
                                    Icons.person_outline,
                                    color: Color.fromRGBO(209, 211, 212, 1),
                                    size: 30,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  _currentCourseTeacher,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromRGBO(39, 43, 48, 1),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  padding: EdgeInsets.all(14),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color: Color.fromRGBO(41, 48, 60, 1),
                                  ),
                                  child: Icon(
                                    Icons.villa_outlined,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  _currentCourseCenter,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromRGBO(39, 43, 48, 1),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  padding: EdgeInsets.all(14),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color: Color.fromRGBO(209, 211, 212, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(18),
                                      color: Colors.white),
                                  child: Icon(
                                    Icons.class_outlined,
                                    size: 30,
                                    color: Color.fromRGBO(209, 211, 212, 1),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  '$_currentCourseClass',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromRGBO(39, 43, 48, 1),
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    )),
              ),
              Positioned(
                top: 425,
                left: 20,
                right: 20,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    width: width,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Number of Units",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(26, 27, 45, 1),
                              ),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (Units > 0) {
                                        Units--;
                                      }
                                    });
                                  },
                                  child: Container(
                                    width: 36,
                                    height: 36,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color:
                                          Color.fromRGBO(209, 211, 212, 1),
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.white),
                                    child: Icon(
                                      Icons.remove,
                                      color: Color.fromRGBO(209, 211, 212, 1),
                                      size: 15,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "$Units",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(26, 29, 31, 1),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (Units < 50) {
                                        Units++;
                                      }
                                    });
                                  },
                                  child: Container(
                                    width: 36,
                                    height: 36,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Color.fromRGBO(3, 2, 30, 1)),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Number of Sessions",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(26, 27, 45, 1),
                              ),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (Bedrooms > 0) {
                                        Bedrooms--;
                                      }
                                    });
                                  },
                                  child: Container(
                                    width: 36,
                                    height: 36,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color:
                                          Color.fromRGBO(209, 211, 212, 1),
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.white),
                                    child: Icon(
                                      Icons.remove,
                                      color: Color.fromRGBO(209, 211, 212, 1),
                                      size: 15,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '$Bedrooms',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(26, 29, 31, 1),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (Bedrooms < 50) {
                                        Bedrooms++;
                                      }
                                    });
                                  },
                                  child: Container(
                                    width: 36,
                                    height: 36,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color: Color.fromRGBO(3, 2, 30, 1),
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.white),
                                    child: Icon(
                                      Icons.add,
                                      color: Color.fromRGBO(3, 2, 30, 1),
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    )),
              ),
              Positioned(
                top: 585,
                left: 20,
                right: 20,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    width: width,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "I",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(44, 43, 70, 1),
                              ),
                            ),
                            Text(
                              "  Description",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(26, 29, 31, 1),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    )),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: 150,
                  padding: EdgeInsets.all(20),
                  color: Theme.of(context).primaryColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Total:  SYL ",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(147, 152, 158, 1),
                                  ),
                                ),
                                Text(
                                  '$_currentCoursePrice',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(26, 29, 31, 1),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Bill Details",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(252, 148, 77, 1),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.keyboard_arrow_up),
                                  color: Color.fromRGBO(252, 148, 77, 1),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Container(
                          //   width: 168,
                          //   height: 48,
                          //   child: RawMaterialButton(
                          //     shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(10)),
                          //     fillColor: Color.fromRGBO(239, 239, 239, 1),
                          //     onPressed: () {},
                          //     child: Text(
                          //       "Save Draft",
                          //       style: TextStyle(
                          //         fontSize: 15,
                          //         fontWeight: FontWeight.w700,
                          //         color: Color.fromRGBO(26, 27, 45, 1),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          Container(
                            width: 250,
                            height: 50,
                            child: RawMaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              fillColor:
                                  Color.alphaBlend(Colors.red, Colors.black),
                              onPressed: () {
                                ///TODO inactivate button
                                _enrollUser();
                                setState(() {
                                  click = !click;
                                });

                                //enroll

                                // Navigator.pushReplacement(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => HomeScreen(),
                                //   ),
                                // );
                              },
                              child: Text((click == false)? "ENROLLED" : "ENROLL",
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
