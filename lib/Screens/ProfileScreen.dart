// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:regexed_validator/regexed_validator.dart';
import '../Utils/ThemeConstants.dart';
import '../Utils/constant.dart';
import 'HomeScreen.dart';
import 'TextFieldWidget.dart';

class ProfileScreen extends StatefulWidget {
  //const ProfileScreen({Key? key}) : super(key: key);

  late String userId;
  String Name;
  ProfileScreen({ this.userId = "", required this.Name});
  
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

enum SingingCharacter { male, female }

class _ProfileScreenState extends State<ProfileScreen> {
  final formKey = GlobalKey<FormState>();
  var db = FirebaseFirestore.instance.collection('users');
  String _myemail = "";
  String _myphone = "";
  String _myaddress = "";

  TextEditingController _address = TextEditingController();
  TextEditingController _email = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  _valueSetter(String a, b, c){

    a=_myemail;
    b= _myaddress;
    c=_myphone;
  }

  Future _fetchUserData() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(widget.userId)
        .get()
        .then(
          (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        _valueSetter(
            '${data['email']}',
            '${data['address']}',
            '${data['phone']}'
        );
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }


  _updateUserData() async {
    //final firebaseUser = FirebaseAuth.instance.currentUser!;
    await db.doc(widget.userId).update(
        {"address": _address.text, "email": _email.text, "phone": _phoneController.text});
  }

  @override
  void initState() {

    super.initState();
    _fetchUserData();
    print("=========================================");
    print(_myemail);
    print(_myphone);
    print(_myaddress);
    print("=========================================");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
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
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "I Profile",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: 130,
                    height: 33,
                    child: RawMaterialButton(
                      //padding: EdgeInsets.symmetric(horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      fillColor: Theme.of(context).primaryColor,
                      onPressed: () {
                        _updateUserData();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Done  ",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12),
                          ),
                          Icon(Icons.done),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  title: Text(
                    widget.Name,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                color: Colors.white,
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Address",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter a valid address";
                          }
                        },
                        controller: _address,
                        onChanged: (val) {},
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: _myaddress,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Phone Number",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter a valid phone number";
                          }
                        },
                        controller: _phoneController,
                        onChanged: (val) {},
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: "+963 933 111 222",
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (!validator.email(value!)) {
                            return "Please enter a valid email";
                          }
                        },
                        onChanged: (val) {},
                        controller: _email,
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: _myemail,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
