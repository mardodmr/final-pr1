// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import '../Utils/constant.dart';
import 'HomeScreen.dart';
import 'SignInScreen.dart';
import 'TextFieldWidget.dart';
import 'VerifyCodeScreen.dart';

class CreateProfileScreen extends StatefulWidget {
  //const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

enum SingingCharacter { male, female }

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  String dropdownValue = "Elementary";
  final TextEditingController _phoneController = TextEditingController();
  String countryCode = "+1";
  SingingCharacter? _character = SingingCharacter.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              TextField(
                keyboardType: TextInputType.text,
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
              TextField(
                keyboardType: TextInputType.text,
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
              TextField(
                keyboardType: TextInputType.text,
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
              TextField(
                keyboardType: TextInputType.text,
                onChanged: (val) {},
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
              TextField(
                keyboardType: TextInputType.text,
                onChanged: (val) {},
                decoration: kTextFieldDecoration.copyWith(
                  hintText: "Address",
                ),
              ),
              SizedBox(
                height: 8,
              ),Text(
                "Education",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: DropdownButton(dropdownColor: Colors.blueAccent,
                    hint: Text("sssssssssss"),
                    value: dropdownValue,alignment: AlignmentDirectional.topCenter,
                   iconSize: 35,
                    items: <String>[

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
              TextField_SignUp(
                prefix: SizedBox(
                  width: 150,
                  child: Row(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 10),
                      //   child: Icon(
                      //     Icons.phone,
                      //     color: Color(0xff9676FF),
                      //   ),
                      // ),
                      CountryCodePicker(
                        initialSelection: 'SY',
                        onChanged: (value) {
                          countryCode = value.toString();
                        },
                      ),
                    ],
                  ),
                ),
                hideInput: false,
                keyboardType: TextInputType.phone,
                con: _phoneController,
                hintText: 'ex: 933111222',
                //LocaleKeys.B03signUpScreen_number.tr(),
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
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (val) {},
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
                        groupValue: _character,activeColor: Colors.yellow,
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
                        groupValue: _character,activeColor: Colors.red,
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
                    //


                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  }, //onPressed
                ),
              ),
              SizedBox(
                height: 8,
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(
              //       "Already have an Account?   ",
              //       textAlign: TextAlign.center,
              //       style: TextStyle(color: Colors.grey),
              //     ),
              //     TextButton(
              //       onPressed: () {
              //         Navigator.pushReplacement(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => SignInScreen(),
              //           ),
              //         );
              //       },
              //       child: Text(
              //         "Sign In",
              //         textAlign: TextAlign.center,
              //         style: TextStyle(color: Colors.black),
              //       ),
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
