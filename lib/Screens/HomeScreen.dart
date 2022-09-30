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
  String _userName = "";

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
  ];

  // course ids
  List<String> courseIDs = [];


  _valueSetter(String a) {
    a = _userName;
  }

  Future<void> _getUserName() async {
    print("i;m in user name");
    await FirebaseFirestore.instance
        .collection("users")
        .doc(widget.userId)
        .get()
        .then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        _valueSetter('${data['first name']}');
        print("done value setting");
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

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

  @override
  void initState() {
    super.initState();
    print("i'm in init state");
    print(widget.userId);
    _getUserName();
    getCourseIDs();
    print(_userName);
    print("done init state");
    //ServiceDetailsScreen(userId: widget.userId);
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
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => ServiceDetailsScreen(),
                    //   ),
                    // );
                  },
                ),
              )
              .toList()),
    );

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
                    "$_userName",
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
            ],
          ),
        ),
      ),
      appBar: AppBar(
        actions: [
          //TODO
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
                          "Hello $_userName 👋",
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
                                    documentId: courseIDs[index]);
                              });
                        }),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
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
            builder: (context) =>
                ProfileScreen(userId: widget.userId, Name: _userName),
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
