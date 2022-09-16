// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Utils/constant.dart';
import 'HomeScreen.dart';
import 'package:regexed_validator/regexed_validator.dart';

class CreateProfileScreen extends StatefulWidget {
  //const SignUpScreen({Key? key}) : super(key: key);
  late String userId;
  late String userPhone;

  CreateProfileScreen({ this.userId = "", this.userPhone = ""});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

enum SingingCharacter { male, female }

class _CreateProfileScreenState extends State<CreateProfileScreen> {

  final formKey= GlobalKey<FormState>();
  var db = FirebaseFirestore.instance.collection('users');
  String dropdownValue = "Education Level";
  final TextEditingController _phoneController = TextEditingController();
  SingingCharacter? _character = SingingCharacter.male;
  TextEditingController _nationality = TextEditingController(text: 'Syrian');
  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _fathername = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _education = TextEditingController();

  //dropdownvalue to db
  //_charachter to db

  TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   color: Colors.black,
        //   onPressed: () {
        //
        //   }, //go back to sign in
        // ),
      ),
      body: SingleChildScrollView(
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
                Container(
                  height: 106,
                  width: 215,
                  child: Image.asset(
                    "assets/images/logo course mate.PNG",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Complete your profile!",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  "First Name",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  validator: (value){
                    if(value!.isEmpty /*|| RegExp(r'^[a-z A-Z]+$').hasMatch(value)*/){
                      return "Enter a valid name";
                    }
                  },
                  controller: _firstname,
                  onChanged: (val) {},
                  decoration: kTextFieldDecoration.copyWith(
                    //  TODO: prefix: DropD,
                    hintText: 'First Name',
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Last Name",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  validator: (value){
                    if(value!.isEmpty /*|| RegExp(r'^[a-z A-Z]+$').hasMatch(value)*/){
                      return "Enter a valid last name";
                    }
                  },
                  controller: _lastname,
                  onChanged: (val) {},
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Last Name',
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Father's Name",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _fathername,
                  validator: (value){
                    if(value!.isEmpty /*|| RegExp(r'^[a-z A-Z]+$').hasMatch(value)*/){
                      return "Enter a valid name";
                    }
                  },
                  onChanged: (val) {},
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: "Father's Name",
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Nationality",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _nationality,
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: "Nationality",
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Address",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  validator: (value){
                    if(value!.isEmpty || RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)){
                      return "Enter a valid address";
                    }
                  },
                  controller: _address,
                  onChanged: (val) {},
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: "Address",
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Education",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: DropdownButton(
                      dropdownColor: Colors.blueAccent,
                      hint: Text("sssssssssss"),
                      value: dropdownValue,
                      alignment: AlignmentDirectional.topCenter,
                      iconSize: 35,
                      items: <String>[
                        'Education Level',
                        'Elementary',
                        'Secondary',
                        'High School',
                        'University',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? NewValue) {
                        setState(() {
                          dropdownValue = NewValue!;
                          print(NewValue);
                        });
                      }),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Phone Number",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  validator: (value){
                    if(value!.isEmpty || RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(value)){
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
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value){
                    if(!validator.email(value!)){
                      return "Please enter a valid email";
                    }
                  },
                  onChanged: (val) {},
                  controller: _email,
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Email',
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Gender",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: const Text('Male'),
                        leading: Radio<SingingCharacter>(
                          value: SingingCharacter.male,
                          groupValue: _character,
                          activeColor: Colors.yellow,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text('Female'),
                        leading: Radio<SingingCharacter>(
                          value: SingingCharacter.female,
                          groupValue: _character,
                          activeColor: Colors.red,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  //height: 30.0,
                  // width: 60.0,
                  color: Colors.white,
                  child: MaterialButton(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    height: 48.0,
                    //minWidth: 15.0,
                    color: Color(0xEFEFEFFF),
                    child: Text(
                      'Done',
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                    onPressed: () {
                      print(_firstname.text);
                      print(_lastname.text);
                      print(_fathername.text);
                      print(_nationality.text);
                      print(_address.text);
                      print(_education.text);
                      print(_phoneController.text);
                      print(_email.text);
                      //print(_gender.text);
                      //set values
                      if(formKey.currentState!.validate()){
                        final snackBar = SnackBar(content: Text('Submitting your data...'));

                        // _scaffoldKey.currentState!.Scaffold.of(context).showSnackBar;
                        _setUserData();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      }


                    }, //onPressed
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _setUserData() async {

    await db.doc(widget.userId).update({
      "first name": _firstname.text,
      "father name": _fathername.text,
      "last name": _lastname.text,
      "nationality": _nationality,
      "address": _address,
      "education": dropdownValue,
      "email": _email,
      "gender": _character,
      "permission": "user",
      "age": /*add a date picker*/"",
      "date": /*add creation date*/ "",
    });
  }
}
