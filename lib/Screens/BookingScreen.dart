// ignore_for_file: curly_braces_in_flow_control_structures, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, duplicate_ignore, unused_local_variable, use_key_in_widget_constructors, non_constant_identifier_names

import 'package:final_pr1/Screens/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Modules/Module.dart';

class upComingScreen extends StatefulWidget {
  //const BookingScreen({Key? key}) : super(key: key);

  @override
  State<upComingScreen> createState() => _upComingScreenState();
}

class _upComingScreenState extends State<upComingScreen> {
  // int selectedIndex = 0;
  final List<String> categories = [

    'Upcoming',
    'Completed',
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            "I   Bookings",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(26, 27, 45, 1),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(8),
                //     color: Theme.of(context).primaryColor,
                //   ),
                //   child: Container(
                //     //color: Colors.white,
                //     height: 90.0,
                //     width: width,
                //     child: ListView.builder(
                //         physics: NeverScrollableScrollPhysics(),
                //         scrollDirection: Axis.horizontal,
                //         itemCount: categories.length,
                //         itemBuilder: (BuildContext context, int index) {
                //           return Padding(
                //             padding: EdgeInsets.symmetric(
                //                 horizontal: 50.0, vertical: 20.0),
                //             child: Container(
                //               width: 90,
                //               height: 50,
                //               child: RawMaterialButton(
                //                 elevation: selectedIndex == index ? 2 : 0,
                //                 shape: RoundedRectangleBorder(
                //                   borderRadius: BorderRadius.circular(8),
                //                 ),
                //                 fillColor: selectedIndex == index
                //                     ? Color.fromRGBO(230, 230, 232, 1)
                //                     : Theme.of(context).primaryColor,
                //                 onPressed: () {
                //                   setState(() {
                //                     selectedIndex = index;
                //                   });
                //                 },
                //                 child: Text(
                //                   categories[index],
                //                   style: TextStyle(
                //                     fontSize: 15,
                //                     fontWeight: FontWeight.w600,
                //                     color: selectedIndex == index
                //                         ? Color.fromRGBO(26, 27, 45, 1)
                //                         : Color.fromRGBO(83, 87, 99, 1),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           );
                //         }),
                //   ),
                // ),
                // SizedBox(
                //   height: 5,
                // ),
                Container(
                  width: double.infinity,
                  height: 600,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).primaryColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        child: Image.asset(
                          "assets/images/Upcoming.png",
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "No Upcoming Course",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(26, 29, 31, 1)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Currently you don’t have any upcoming classes. Participate in a course from here.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(83, 87, 99, 1)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 170,
                        height: 48,
                        child: RawMaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          fillColor: Color.fromRGBO(26, 27, 45, 1),
                          onPressed: () {
                            BottomNavBar(indexLate: 0);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                            );
                          },
                          child: Text(
                            "View all courses",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavBar(indexLate: 1),
      );
    ///  ===================
    // if (selectedIndex == 1)
    //   return Scaffold(
    //     appBar: AppBar(
    //       elevation: 0,
    //       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    //       title: Text(
    //         "I   Bookings",
    //         style: TextStyle(
    //           fontSize: 24,
    //           fontWeight: FontWeight.w700,
    //           color: Color.fromRGBO(26, 27, 45, 1),
    //         ),
    //       ),
    //     ),
    //     body: SingleChildScrollView(
    //       child: Padding(
    //         padding: const EdgeInsets.all(20),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: [
    //             Container(
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(8),
    //                 color: Theme.of(context).primaryColor,
    //               ),
    //               child: Container(
    //                 //color: Colors.white,
    //                 height: 90.0,
    //                 width: width,
    //                 child: ListView.builder(
    //                     physics: NeverScrollableScrollPhysics(),
    //                     scrollDirection: Axis.horizontal,
    //                     itemCount: categories.length,
    //                     itemBuilder: (BuildContext context, int index) {
    //                       return Padding(
    //                         padding: EdgeInsets.symmetric(
    //                             horizontal: 50.0, vertical: 20.0),
    //                         child: Container(
    //                           width: 90,
    //                           height: 50,
    //                           child: RawMaterialButton(
    //                             elevation: selectedIndex == index ? 2 : 0,
    //                             shape: RoundedRectangleBorder(
    //                               borderRadius: BorderRadius.circular(8),
    //                             ),
    //                             fillColor: selectedIndex == index
    //                                 ? Color.fromRGBO(230, 230, 232, 1)
    //                                 : Theme.of(context).primaryColor,
    //                             onPressed: () {
    //                               setState(() {
    //                                 selectedIndex = index;
    //                               });
    //                             },
    //                             child: Text(
    //                               categories[index],
    //                               style: TextStyle(
    //                                 fontSize: 15,
    //                                 fontWeight: FontWeight.w600,
    //                                 color: selectedIndex == index
    //                                     ? Color.fromRGBO(26, 27, 45, 1)
    //                                     : Color.fromRGBO(83, 87, 99, 1),
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                       );
    //                     }),
    //               ),
    //             ),
    //             SizedBox(
    //               height: 5,
    //             ),
    //             SubWidgetBooking(
    //               Img1: "assets/images/AC.png",
    //               Title1: "AC Installation",
    //               SubTitle1: "Reference Code: #D-571224",
    //               Date: "8:00-9:00 AM,  09 Dec",
    //               Status: "Confirmed",
    //               Title2: "Westinghouse",
    //               SubTitle2: "Service provider",
    //               Img2: "assets/images/Westinghouse.png",
    //               FillColor: Color.fromRGBO(236, 248, 241, 1),
    //               TextColor: Color.fromRGBO(127, 192, 156, 1),
    //               FillColorImg: Color.fromRGBO(255, 188, 153, 1),
    //             ),
    //             SizedBox(
    //               height: 5,
    //             ),
    //             SubWidgetBooking(
    //               Img1: "assets/images/Beauty.png",
    //               Title1: "Multi Mask Facial",
    //               SubTitle1: "Reference Code: #D-571224",
    //               Date: "8:00-9:00 AM,  09 Dec",
    //               Status: "Pending",
    //               Title2: "Sindenayu",
    //               SubTitle2: "Service provider",
    //               Img2: "assets/images/Sindenayu.png",
    //               FillColor: Color.fromRGBO(231, 183, 151, 1.0),
    //               TextColor: Color.fromRGBO(235, 131, 60, 1),
    //               FillColorImg: Color.fromRGBO(202, 189, 255, 1),
    //             ),
    //             SizedBox(
    //               height: 5,
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //     bottomNavigationBar: BottomNavBar(indexLate: 1,),
    //   );
    ///============================
    // else
    //   return Scaffold(
    //     appBar: AppBar(
    //       elevation: 0,
    //       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    //       title: Text(
    //         "I   Bookings",
    //         style: TextStyle(
    //           fontSize: 24,
    //           fontWeight: FontWeight.w700,
    //           color: Color.fromRGBO(26, 27, 45, 1),
    //         ),
    //       ),
    //     ),
    //     body: SingleChildScrollView(
    //       child: Padding(
    //         padding: const EdgeInsets.all(20),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: [
    //             Container(
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(8),
    //                 color: Theme.of(context).primaryColor,
    //               ),
    //               child: Container(
    //                 //color: Colors.white,
    //                 height: 90.0,
    //                 width: width,
    //                 child: ListView.builder(
    //                     physics: NeverScrollableScrollPhysics(),
    //                     scrollDirection: Axis.horizontal,
    //                     itemCount: categories.length,
    //                     itemBuilder: (BuildContext context, int index) {
    //                       return Padding(
    //                         padding: EdgeInsets.symmetric(
    //                             horizontal: 50.0, vertical: 20.0),
    //                         child: Container(
    //                           width: 90,
    //                           height: 50,
    //                           child: RawMaterialButton(
    //                             elevation: selectedIndex == index ? 2 : 0,
    //                             shape: RoundedRectangleBorder(
    //                               borderRadius: BorderRadius.circular(8),
    //                             ),
    //                             fillColor: selectedIndex == index
    //                                 ? Color.fromRGBO(230, 230, 232, 1)
    //                                 : Theme.of(context).primaryColor,
    //                             onPressed: () {
    //                               setState(() {
    //                                 selectedIndex = index;
    //                               });
    //                             },
    //                             child: Text(
    //                               categories[index],
    //                               style: TextStyle(
    //                                 fontSize: 15,
    //                                 fontWeight: FontWeight.w600,
    //                                 color: selectedIndex == index
    //                                     ? Color.fromRGBO(26, 27, 45, 1)
    //                                     : Color.fromRGBO(83, 87, 99, 1),
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                       );
    //                     }),
    //               ),
    //             ),
    //             SizedBox(
    //               height: 5,
    //             ),
    //             Container(
    //               width: double.infinity,
    //               height: 600,
    //               padding: EdgeInsets.all(20),
    //               decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(8),
    //                   color: Theme.of(context).primaryColor),
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Container(
    //                     height: 100,
    //                     child: Image.asset(
    //                       "assets/images/Upcoming.png",
    //                       fit: BoxFit.fitHeight,
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     height: 40,
    //                   ),
    //                   Text(
    //                     "No Upcoming Course",
    //                     style: TextStyle(
    //                         fontSize: 20,
    //                         fontWeight: FontWeight.w700,
    //                         color: Color.fromRGBO(26, 29, 31, 1)),
    //                   ),
    //                   SizedBox(
    //                     height: 20,
    //                   ),
    //                   Text(
    //                     "Currently you don’t have any upcoming classes. Participate in a course from here.",
    //                     textAlign: TextAlign.center,
    //                     style: TextStyle(
    //                         fontSize: 14,
    //                         fontWeight: FontWeight.w500,
    //                         color: Color.fromRGBO(83, 87, 99, 1)),
    //                   ),
    //                   SizedBox(
    //                     height: 20,
    //                   ),
    //                   Container(
    //                     width: 170,
    //                     height: 48,
    //                     child: RawMaterialButton(
    //                       shape: RoundedRectangleBorder(
    //                           borderRadius: BorderRadius.circular(10)),
    //                       fillColor: Color.fromRGBO(26, 27, 45, 1),
    //                       onPressed: () {
    //                         Navigator.pushReplacement(
    //                           context,
    //                           MaterialPageRoute(
    //                               builder: (context) => HomeScreen()),
    //                         );
    //                       },
    //                       child: Text(
    //                         "View all courses",
    //                         style: TextStyle(
    //                           fontSize: 15,
    //                           fontWeight: FontWeight.w700,
    //                           color: Colors.white,
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             SizedBox(
    //               height: 5,
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //     bottomNavigationBar: BottomNavBar(indexLate: 1,),
    //   );
    ///====================
    // else
    //   return Scaffold(
    //     appBar: AppBar(
    //       elevation: 0,
    //       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    //       title: Text(
    //         "I   Bookings",
    //         style: TextStyle(
    //           fontSize: 24,
    //           fontWeight: FontWeight.w700,
    //           color: Color.fromRGBO(26, 27, 45, 1),
    //         ),
    //       ),
    //     ),
    //     body: SingleChildScrollView(
    //       child: Padding(
    //         padding: const EdgeInsets.all(20),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: [
    //             Container(
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(8),
    //                 color: Theme.of(context).primaryColor,
    //               ),
    //               child: Container(
    //                 //color: Colors.white,
    //                 height: 90.0,
    //                 width: width,
    //                 child: ListView.builder(
    //                     physics: NeverScrollableScrollPhysics(),
    //                     scrollDirection: Axis.horizontal,
    //                     itemCount: categories.length,
    //                     itemBuilder: (BuildContext context, int index) {
    //                       return Padding(
    //                         padding: EdgeInsets.symmetric(
    //                             horizontal: 20.0, vertical: 20.0),
    //                         child: Container(
    //                           width: 90,
    //                           height: 50,
    //                           child: RawMaterialButton(
    //                             elevation: selectedIndex == index ? 2 : 0,
    //                             shape: RoundedRectangleBorder(
    //                               borderRadius: BorderRadius.circular(8),
    //                             ),
    //                             fillColor: selectedIndex == index
    //                                 ? Color.fromRGBO(230, 230, 232, 1)
    //                                 : Theme.of(context).primaryColor,
    //                             onPressed: () {
    //                               setState(() {
    //                                 selectedIndex = index;
    //                               });
    //                             },
    //                             child: Text(
    //                               categories[index],
    //                               style: TextStyle(
    //                                 fontSize: 15,
    //                                 fontWeight: FontWeight.w600,
    //                                 color: selectedIndex == index
    //                                     ? Color.fromRGBO(26, 27, 45, 1)
    //                                     : Color.fromRGBO(83, 87, 99, 1),
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                       );
    //                     }),
    //               ),
    //             ),
    //             SizedBox(
    //               height: 5,
    //             ),
    //             SubWidgetBooking(
    //               Img1: "assets/images/AC.png",
    //               Title1: "AC Installation",
    //               SubTitle1: "Reference Code: #D-571224",
    //               Date: "8:00-9:00 AM,  09 Dec",
    //               Status: "Confirmed",
    //               Title2: "Westinghouse",
    //               SubTitle2: "Service provider",
    //               Img2: "assets/images/Westinghouse.png",
    //               FillColor: Color.fromRGBO(236, 248, 241, 1),
    //               TextColor: Color.fromRGBO(127, 192, 156, 1),
    //               FillColorImg: Color.fromRGBO(255, 188, 153, 1),
    //             ),
    //             SizedBox(
    //               height: 5,
    //             ),
    //             SubWidgetBooking(
    //               Img1: "assets/images/Beauty.png",
    //               Title1: "Multi Mask Facial",
    //               SubTitle1: "Reference Code: #D-571224",
    //               Date: "8:00-9:00 AM,  09 Dec",
    //               Status: "Pending",
    //               Title2: "Sindenayu",
    //               SubTitle2: "Service provider",
    //               Img2: "assets/images/Sindenayu.png",
    //               FillColor: Color.fromRGBO(231, 183, 151, 1.0),
    //               TextColor: Color.fromRGBO(235, 131, 60, 1),
    //               FillColorImg: Color.fromRGBO(202, 189, 255, 1),
    //             ),
    //             SizedBox(
    //               height: 5,
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //     bottomNavigationBar: BottomNavBar(),
    //   );
  }
}

class SubWidgetBooking extends StatelessWidget {
  // const SubWidgetBooking({Key? key,}) : super(key: key);
  final String Img1;
  final String Title1;
  final String SubTitle1;
  final String Status;
  final String Date;
  final String Img2;
  final String Title2;
  final String SubTitle2;
  final Color TextColor;
  final Color FillColor;
  final Color FillColorImg;
  const SubWidgetBooking({
    required this.Img1,
    required this.Title1,
    required this.SubTitle1,
    required this.Status,
    required this.Date,
    required this.Img2,
    required this.Title2,
    required this.SubTitle2,
    required this.TextColor,
    required this.FillColor,
    required this.FillColorImg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 320,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).primaryColor),
      child: Column(
        children: [
          ListTile(
            leading: Container(
              width: 60,
              height: 60,
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: FillColorImg,
              ),
              child: Image.asset(
                Img1,
                fit: BoxFit.fitWidth,
              ),
            ),
            title: Text(
              Title1,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            subtitle: Text(
              SubTitle1,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
          Divider(
            height: 1,
            color: Color.fromRGBO(239, 239, 239, 1),
            thickness: 2,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Status",
                style: TextStyle(fontSize: 15),
              ),
              Container(
                width: 90,
                height: 30,
                child: RawMaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  fillColor: FillColor,
                  onPressed: () {},
                  child: Text(
                    Status,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: TextColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Container(
              width: 60,
              height: 60,
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.5,
                  color: Color.fromRGBO(239, 239, 239, 1),
                ),
                borderRadius: BorderRadius.circular(100),
                color: Colors.transparent,
              ),
              child: Image.asset(
                "assets/images/Schedule.png",
                fit: BoxFit.fitWidth,
              ),
            ),
            title: Text(
              Date,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              "Schedule",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 200,
                child: ListTile(
                  leading: Container(
                    width: 60,
                    height: 60,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.5,
                        color: Color.fromRGBO(239, 239, 239, 1),
                      ),
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.transparent,
                    ),
                    child: Image.asset(
                      Img2,
                      fit: BoxFit.contain,
                    ),
                  ),
                  title: Text(
                    Title2,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    SubTitle2,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                width: 80,
                height: 40,
                child: RawMaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  fillColor: Color.fromRGBO(26, 27, 45, 1),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                      Text(
                        "Call",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
