// ignore_for_file: avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unnecessary_new, use_key_in_widget_constructors, unnecessary_import, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_pr1/Modules/get_course_info.dart';
import 'package:final_pr1/Screens/AddCourseScreen.dart';
import 'package:final_pr1/Screens/ServiceDetailsScreen.dart';
import 'package:final_pr1/Screens/SignInScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Modules/Module.dart';
import '../Utils/constant.dart';
import 'AllCategoriesScreen.dart';
import 'MapScreen.dart';
import 'NotificationEmptyScreen.dart';
import 'ProfileScreen.dart';
import 'ReferFriend.dart';
import 'SubCategoriesScreen.dart';
import 'TextFieldWidget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  // const HomeScreen({Key? key}) : super(key: key);

  late String userId;

  HomeScreen({this.userId = ""});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextEditingController _phoneController = TextEditingController();
  final List<String> name = [
    'U ... UP\nSpecial',
    'Main\nCategory2',
    'Main\nCategory3',
    'Main\nCategory4',
    'Main\nCategory5',
    'Main\nCategory6',
    'Main\nCategory7',
  ];
  final List<String> Categorise = [
    'assets/images/Electronics.jpg',
    'assets/images/Beauty.jpg',
    'assets/images/Painting.jpg',
    'assets/images/Electro Repair.jpg',
    'assets/images/Electronics.jpg',
    'assets/images/Language.jpg',
  ];

  final imageList = [
    'assets/images/level1_interchange.png',
    'assets/images/intro_interchange Cropped.jpg',
    // 'assets/images/Painting.jpg',
    // 'assets/images/Electro Repair.jpg',
    // 'assets/images/Electronics.jpg',
    // 'assets/images/Language.jpg',
  ];

  // course ids
  List<String> courseIDs = [];

  //get ids
  Future getCourseIDs() async {
    await FirebaseFirestore.instance
        .collection('courses')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference);
              print("111111111111114444432353452345");
              courseIDs.add(document.reference.id);
            }));
  }

  /// TODO hello username!

  @override
  void initState() {
//    BottomNavBar(indexLate: 0);
    getCourseIDs();
    print("0987098709870987");
    ServiceDetailsScreen(userId: widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget carouselSlider = new SafeArea(
      child: CarouselSlider(
          options: CarouselOptions(
            height: 250,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(milliseconds: 3500),
            autoPlayAnimationDuration: Duration(milliseconds: 1000),
            autoPlayCurve: Curves.slowMiddle,
            enlargeCenterPage: true,
            //onPageChanged: callbackFunction,
            scrollDirection: Axis.horizontal,
          ),
          items: imageList
              .map(
                (imagePath) => GestureDetector(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [Image.asset(imagePath)],
                    ),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ServiceDetailsScreen(),
                      ),
                    );
                  },
                ),
              )
              .toList()),
    );

    //{
    //
    //         return Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 4),
    //           child: Image.asset(imagePath),
    //         );
    //       }).toList()),
    // );

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          color: Color.fromRGBO(41, 48, 60, 1),
          child: ListView(
            children: [
              GestureDetector(
                // onTap: () {
                //   Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => ProfileScreen(),
                //     ),
                //   );
                // },
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      "assets/images/khaled.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  title: Text(
                    "Ahmad Jalal",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: DrawerListWidgets(),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              // Container(
              //   padding: EdgeInsets.only(
              //     left: 10,
              //   ),
              //   width: double.infinity,
              //   height: 48,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(8),
              //       color: Colors.transparent),
              //   child: Row(
              //     children: [
              //       Icon(Icons.wallet_membership, color: Colors.white),
              //       Text(
              //         "  Payments Methods",
              //         style: TextStyle(
              //             color: Colors.white, //Color.fromRGBO(41, 48, 60, 1),
              //             fontSize: 15,
              //             fontWeight: FontWeight.w600),
              //       )
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.pushReplacement(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => MapScreen(),
              //       ),
              //     );
              //   },
              //   child: Container(
              //     width: double.infinity,
              //     padding: EdgeInsets.only(
              //       left: 10,
              //     ),
              //     height: 48,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(8),
              //     ),
              //     child: Row(
              //       children: [
              //         Icon(
              //           Icons.location_on_outlined,
              //           color: Colors.white,
              //         ),
              //         Text(
              //           "  Address",
              //           style: TextStyle(
              //               color:
              //                   Colors.white, // Color.fromRGBO(41, 48, 60, 1),
              //               fontSize: 15,
              //               fontWeight: FontWeight.w600),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.pushReplacement(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => NotificationEmptyScreen(),
              //       ),
              //     );
              //   },
              //   child: Container(
              //     width: double.infinity,
              //     height: 48,
              //     padding: EdgeInsets.only(
              //       left: 10,
              //     ),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(8),
              //     ),
              //     child: Row(
              //       children: [
              //         Icon(
              //           Icons.notifications,
              //           color: Colors.white,
              //         ),
              //         Text(
              //           "  Notification",
              //           style: TextStyle(
              //               color:
              //                   Colors.white, //Color.fromRGBO(41, 48, 60, 1),
              //               fontSize: 15,
              //               fontWeight: FontWeight.w600),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Container(
              //   width: double.infinity,
              //   height: 48,
              //   padding: EdgeInsets.only(
              //     left: 10,
              //   ),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(8),
              //   ),
              //   child: Row(
              //     children: [
              //       Icon(
              //         Icons.local_offer_outlined,
              //         color: Colors.white,
              //       ),
              //       Text(
              //         "  Offers",
              //         style: TextStyle(
              //             color: Colors.white, // Color.fromRGBO(41, 48, 60, 1),
              //             fontSize: 15,
              //             fontWeight: FontWeight.w600),
              //       )
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReferAFriendScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 48,
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.people_alt_outlined,
                          color: Colors.white, //Color.fromRGBO(41, 48, 60, 1),
                        ),
                        Text(
                          "  Refer a Friend",
                          style: TextStyle(
                              color:
                                  Colors.white, //Color.fromRGBO(41, 48, 60, 1),
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: 48,
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),
                    child: Row(
                      children: [
                        Icon(
                          Icons.call_outlined,
                          color: Color.fromRGBO(41, 48, 60, 1),
                        ),
                        Text(
                          "  Support",
                          style: TextStyle(
                              color: Color.fromRGBO(41, 48, 60, 1),
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 48,
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.login,
                          color: Colors.white, // Color.fromRGBO(41, 48, 60, 1),
                        ),
                        Text(
                          "  Logout",
                          style: TextStyle(
                              color: Colors.white,
                              // Color.fromRGBO(41, 48, 60, 1),
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 200,
              ),
              // SizedBox(
              //   height: 10,
              // ),
              // Container(
              //   width: double.infinity,
              //   height: 48,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(8),
              //       color: Color.fromRGBO(255, 255, 255, 0.15)),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Container(
              //         width: 120,
              //         height: 35,
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(32),
              //             color: Colors
              //                 .white //Color.fromRGBO(255, 255, 255, 0.15),
              //             ),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Icon(
              //               Icons.wb_sunny,
              //               color: Color.fromRGBO(41, 48, 60, 1),
              //             ),
              //             Text(
              //               "  Light",
              //               style: TextStyle(
              //                   color: Color.fromRGBO(41, 48, 60, 1),
              //                   fontSize: 15,
              //                   fontWeight: FontWeight.w600),
              //             )
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         width: 10,
              //       ),
              //       Container(
              //         width: 120,
              //         height: 35,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(32),
              //           color: Colors
              //               .transparent, //Color.fromRGBO(255, 255, 255, 0.15),
              //         ),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Icon(
              //               Icons.wb_sunny_outlined,
              //               color:
              //                   Colors.white, //Color.fromRGBO(41, 48, 60, 1),
              //             ),
              //             Text(
              //               "  Dark",
              //               style: TextStyle(
              //                   color: Colors
              //                       .white, //Color.fromRGBO(41, 48, 60, 1),
              //                   fontSize: 15,
              //                   fontWeight: FontWeight.w600),
              //             )
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        actions: [
          //Todo: mardo al عرص
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddCourseScreen()));
            },
            child: Icon(
              Icons.add,
              color: Colors.red,
              size: 36,
            ),
          ),
        ],
        elevation: 0,
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        // title: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Text(
        //           "CURRENT LOCATION",
        //           style: TextStyle(
        //               color: Color.fromRGBO(99, 106, 117, 1), fontSize: 9),
        //         ),
        //         Text(
        //           "15A, James Streat",
        //           style: TextStyle(
        //               color: Color.fromRGBO(23, 43, 77, 1), fontSize: 13),
        //         ),
        //       ],
        //     ),
        //     Row(
        //       children: [
        //         Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Text(
        //               "BRONZE",
        //               style: TextStyle(
        //                   color: Color.fromRGBO(244, 191, 75, 1), fontSize: 12),
        //             ),
        //             Text(
        //               "0 POINTS",
        //               style: TextStyle(
        //                   color: Color.fromRGBO(99, 106, 117, 1), fontSize: 10),
        //             ),
        //           ],
        //         ),
        //         Container(
        //           height: 33,
        //           child: Image.asset(
        //             'assets/images/Badge.png',
        //             fit: BoxFit.fitHeight,
        //           ),
        //         )
        //       ],
        //     ),
        //   ],
        // ),
        leading: IconButton(
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            icon: Icon(
              Icons.density_medium,
              color: Color.fromRGBO(37, 40, 60, 1),
            )),
        title: TextField(
          keyboardType: TextInputType.text,
          onChanged: (val) {
            _phoneController.text = val;
          },
          decoration: kTextFieldDecoration.copyWith(
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
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                // Greeting Box
                Container(
                  width: double.infinity,
                  height: 100,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: AutoSizeText(
                          ///get() the user name form database
                          "Hello " + /*user.firstname*/ " 👋",
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(23, 43, 77, 1)),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: double.infinity,
                  height: 266,
                  child: ListView(
                    children: [carouselSlider],
                  ),
                ),

                // Expanded(
                //   child: FutureBuilder(
                //     future: getCourseIDs(),
                //     builder: (context, snapshot) {
                //       return ListView.builder(
                //         itemCount: courseIDs.length,
                //         itemBuilder: (context, index) {
                //           return Padding(
                //             padding: const EdgeInsets.all(8.0),
                //             child: ListTile(
                //               title: GetCourseNames(documentId: courseIDs[index],),
                //               tileColor: Colors.deepOrangeAccent,
                //             ),
                //           );
                //         },
                //       );
                //     },
                //   ),
                // ),

                /// Available Categories Courses
                // Container(
                //   padding: EdgeInsets.only(left: 16, right: 16, top: 20),
                //   width: double.infinity,
                //   height: 295,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(8),
                //     color: Colors.white,
                //   ),
                //   child: Column(
                //     children: [
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           //headline bar
                //           Text(
                //             "I",
                //             style: TextStyle(
                //               fontSize: 20,
                //               fontWeight: FontWeight.w700,
                //               color: Color.fromRGBO(202, 189, 255, 1),
                //             ),
                //           ),
                //           //headline text
                //           Text(
                //             "Available Courses",
                //             textAlign: TextAlign.right,
                //             style: TextStyle(
                //               fontSize: 18,
                //               fontWeight: FontWeight.w600,
                //               color: Color.fromRGBO(23, 43, 77, 1),
                //             ),
                //           ),
                //
                //           /// walaa Edit see all Active
                //           Container(
                //             width: 106,
                //             height: 33,
                //             child: RawMaterialButton(
                //               shape: RoundedRectangleBorder(
                //                   borderRadius: BorderRadius.circular(100)),
                //               fillColor: Color.fromRGBO(255, 255, 255, 1),
                //               onPressed: () {},
                //               child: Row(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: [
                //                   Text(
                //                     "See All ",
                //                     style: TextStyle(
                //                       fontSize: 15,
                //                       color: Color.fromRGBO(111, 118, 126, 1),
                //                     ),
                //                   ),
                //                   Icon(
                //                     Icons.keyboard_arrow_right,
                //                     color: Color.fromRGBO(111, 118, 126, 1),
                //                     size: 20,
                //                   )
                //                 ],
                //               ),
                //             ),
                //           )
                //         ],
                //       ),
                //       SizedBox(
                //         height: 20,
                //       ),
                //
                //       ///walaa Edit All Categories Photos
                //
                //       // Container(
                //       //   height: 220,
                //       //   child: ListView.builder(
                //       //       scrollDirection: Axis.horizontal,
                //       //       itemCount: Categorise.length,
                //       //       itemBuilder: (BuildContext context, int index) {
                //       //         return Container(
                //       //           padding: EdgeInsets.all(5),
                //       //           height: 200,
                //       //           child: Column(
                //       //             children: [
                //       //               Container(
                //       //                 decoration: BoxDecoration(
                //       //                   borderRadius: BorderRadius.circular(14),
                //       //                   color: Colors.red,//Color.fromRGBO(236, 234, 246, 1),
                //       //                 ),
                //       //                 width: 170,
                //       //                 height: 180,
                //       //                 child: ClipRRect(
                //       //                   borderRadius: BorderRadius.circular(14),
                //       //                   child: Image.asset(
                //       //                     Categorise[index],
                //       //                     fit: BoxFit.fill,
                //       //                   ),
                //       //                 ),
                //       //               ),
                //       //               SizedBox(
                //       //                 height: 10,
                //       //               ),
                //       //               Text(
                //       //                 Categorise[index],
                //       //                 style: TextStyle(
                //       //                     fontSize: 14,
                //       //                     fontWeight: FontWeight.w600),
                //       //               ),
                //       //             ],
                //       //           ),
                //       //         );
                //       //       }),
                //       // ),
                //     ],
                //   ),
                // ),

                /// All Categories
                // Container(
                //   width: double.infinity,
                //   height: 150,
                //   padding: EdgeInsets.all(16),
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(8),
                //       color: Colors.white),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       Column(
                //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //         children: [
                //           GestureDetector(
                //             onTap: () {
                //               Navigator.pushReplacement(
                //                   context,
                //                   MaterialPageRoute(
                //                       builder: (context) =>
                //                           SubCategoriesScreen()));
                //             },
                //             child: Container(
                //               width: 70,
                //               height: 70,
                //               padding: EdgeInsets.all(14),
                //               decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(100),
                //                   color: Color.fromRGBO(255, 188, 153, 1)),
                //               child: Image.asset(
                //                 "assets/images/AC.png",
                //                 fit: BoxFit.fitWidth,
                //               ),
                //             ),
                //           ),
                //           Text(
                //             "AC Repair",
                //             style: TextStyle(
                //                 fontSize: 15,
                //                 color: Color.fromRGBO(65, 64, 93, 1)),
                //           )
                //         ],
                //       ),
                //       Column(
                //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //         children: [
                //           GestureDetector(
                //             onTap: () {},
                //             child: Container(
                //               width: 70,
                //               height: 70,
                //               padding: EdgeInsets.all(14),
                //               decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(100),
                //                   color: Color.fromRGBO(202, 189, 255, 1)),
                //               child: Image.asset(
                //                 "assets/images/Beauty.png",
                //                 fit: BoxFit.fitWidth,
                //               ),
                //             ),
                //           ),
                //           Text(
                //             "Beauty",
                //             style: TextStyle(
                //                 fontSize: 15,
                //                 color: Color.fromRGBO(65, 64, 93, 1)),
                //           )
                //         ],
                //       ),
                //       Column(
                //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //         children: [
                //           GestureDetector(
                //             onTap: () {
                //               Navigator.pushReplacement(
                //                   context,
                //                   MaterialPageRoute(
                //                       builder: (context) =>
                //                           SubCategoriesScreen()));
                //             },
                //             child: Container(
                //               width: 70,
                //               height: 70,
                //               padding: EdgeInsets.all(14),
                //               decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(100),
                //                   color: Color.fromRGBO(177, 229, 252, 1)),
                //               child: Image.asset(
                //                 "assets/images/Appliance.png",
                //                 fit: BoxFit.fitWidth,
                //               ),
                //             ),
                //           ),
                //           Text(
                //             "Appliance",
                //             style: TextStyle(
                //                 fontSize: 15,
                //                 color: Color.fromRGBO(65, 64, 93, 1)),
                //           )
                //         ],
                //       ),
                //       Column(
                //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //         children: [
                //           GestureDetector(
                //             onTap: () {
                //               print("222222654684");
                //               Navigator.pushReplacement(
                //                   context,
                //                   MaterialPageRoute(
                //                       builder: (context) => CategoriesScreen()));
                //             },
                //             child: Container(
                //               width: 70,
                //               height: 70,
                //               padding: EdgeInsets.all(14),
                //               decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(100),
                //                   color: Color.fromRGBO(250, 250, 250, 1)),
                //               child: Icon(
                //                 Icons.arrow_forward,
                //                 size: 30,
                //               ),
                //             ),
                //           ),
                //           Text(
                //             "See All",
                //             style: TextStyle(
                //                 fontSize: 15,
                //                 color: Color.fromRGBO(65, 64, 93, 1)),
                //           )
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 16,
                // ),

                /// Get 25% AC Service
                Container(
                  width: double.infinity,
                  height: 500,
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  child: Container(
                    height: 300,
                    //TODO
                    child: FutureBuilder(
                        future: getCourseIDs(),
                        builder: (context, snapshot) {
                          return ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: courseIDs.length,
                              itemBuilder: (BuildContext context, int index) {
                                // String textTest = GetCourseNames(
                                //   documentId: courseIDs[index]
                                // );
                                //getter =courseIDs[index];
                                return GetCourseNames(
                                  documentId: courseIDs[index],
                                  neededValue: "course name",
                                );
                              });
                        }),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),

                /// Get 25% Appliance Repair
                // Container(
                //   width: double.infinity,
                //   height: 250,
                //   padding: EdgeInsets.all(16),
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(8),
                //       color: Colors.white),
                //   child: Container(
                //     height: 250,
                //     child: ListView.builder(
                //         scrollDirection: Axis.horizontal,
                //         itemCount: name.length,
                //         itemBuilder: (BuildContext context, int index) {
                //           return Padding(
                //             padding: const EdgeInsets.all(8.0),
                //             child: Container(
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(14),
                //                 color: Color.fromRGBO(236, 234, 246, 1),
                //               ),
                //               width: 300,
                //               child: Stack(
                //                 children: [
                //                   Positioned(
                //                     right: 0,
                //                     bottom: 0,
                //                     child: Container(
                //                       width: 160,
                //                       height: 180,
                //                       child: Image.asset(
                //                         "assets/images/Washer.png",
                //                         fit: BoxFit.fitHeight,
                //                       ),
                //                     ),
                //                   ),
                //                   Positioned(
                //                     top: 30,
                //                     left: 20,
                //                     child: Row(
                //                       children: [
                //                         Text(
                //                           "Offer AC Service ",
                //                           style: TextStyle(
                //                             fontSize: 15,
                //                             color: Color.fromRGBO(51, 56, 63, 1),
                //                           ),
                //                         ),
                //                         Icon(
                //                           Icons.error,
                //                           color: Color.fromRGBO(51, 56, 63, 1),
                //                           size: 20,
                //                         )
                //                       ],
                //                     ),
                //                   ),
                //                   Positioned(
                //                     top: 55,
                //                     left: 20,
                //                     child: Text(
                //                       'Get 25%',
                //                       style: TextStyle(
                //                           color: Color.fromRGBO(26, 29, 31, 1),
                //                           fontSize: 48,
                //                           fontWeight: FontWeight.bold),
                //                     ),
                //                   ),
                //                   Positioned(
                //                     top: 120,
                //                     left: 20,
                //                     child: Container(
                //                       width: 106,
                //                       height: 33,
                //                       child: RawMaterialButton(
                //                         shape: RoundedRectangleBorder(
                //                             borderRadius:
                //                                 BorderRadius.circular(100)),
                //                         fillColor:
                //                             Color.fromRGBO(255, 255, 255, 1),
                //                         onPressed: () {},
                //                         child: Row(
                //                           mainAxisAlignment:
                //                               MainAxisAlignment.center,
                //                           children: [
                //                             Text(
                //                               "Grab Offer ",
                //                               style: TextStyle(
                //                                 fontSize: 15,
                //                                 color: Color.fromRGBO(
                //                                     164, 146, 235, 1),
                //                               ),
                //                             ),
                //                             Icon(
                //                               Icons.keyboard_arrow_right,
                //                               color:
                //                                   Color.fromRGBO(51, 56, 63, 1),
                //                               size: 20,
                //                             )
                //                           ],
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           );
                //         }),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        indexLate: 0,
      ),
    );
  }

  GestureDetector DrawerListWidgets() {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileScreen(
              userId: widget.userId,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(
          left: 10,
        ),
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        child: Row(
          children: [
            Icon(Icons.event),
            Text(
              "  Edit Profile",
              style: TextStyle(
                  color: Color.fromRGBO(41, 48, 60, 1),
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
