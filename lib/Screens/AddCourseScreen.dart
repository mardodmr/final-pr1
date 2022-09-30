// ignore_for_file: sized_box_for_whitespace

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_pr1/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Utils/constant.dart';
import 'package:image_picker/image_picker.dart';
import 'TextFieldWidget.dart';

class AddCourseScreen extends StatefulWidget {
  const AddCourseScreen({Key? key}) : super(key: key);

  @override
  State<AddCourseScreen> createState() => _AddCourseScreenState();
}

class _AddCourseScreenState extends State<AddCourseScreen> {
  String dropdownValue = "All Categorise";
  File? image;

  TextEditingController _coursename = TextEditingController();
  TextEditingController _teacher = TextEditingController();
  TextEditingController _price = TextEditingController();
  TextEditingController _center = TextEditingController();
  TextEditingController _duration = TextEditingController();
  TextEditingController _class = TextEditingController();
  TextEditingController _startdate = TextEditingController();

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print("Field to pick Image $e");
    }
  }

  /// TODO image picker upload
  Future<void> _setCourseData() async {
    await FirebaseFirestore.instance.collection('courses').add({
      "course name": _coursename.text,
      "teacher": _teacher.text,
      "price": _price.text,
      "duration": _duration.text,
      "category": dropdownValue,
      "center": _center.text,
      "participants": 0,
      "class": _class.text,
      "start_date": _startdate.text,
    });
  }

  ///

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Course",
          style: TextStyle(color: Colors.black),
        ),
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
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              image != null
                  ? Image.file(
                      image!,
                      height: 160,
                      width: 160,
                      fit: BoxFit.cover,
                    )
                  : FlutterLogo(
                      size: 160,
                    ),
              const SizedBox(
                height: 20,
              ),
              const Text("* Course Name:"),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _coursename,
                onChanged: (val) {},
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Course Name',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("* Instructor Name:"),
              TextFormField(
                keyboardType: TextInputType.text,
                onChanged: (val) {},
                controller: _teacher,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Instructor Name',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("* Course Cost:"),
              TextFormField(
                keyboardType: TextInputType.text,
                onChanged: (val) {},
                controller: _price,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Course Cost',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("* Center Name:"),
              TextFormField(
                keyboardType: TextInputType.text,
                onChanged: (val) {},
                controller: _center,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Center Name',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("* Course Duration:"),
              TextFormField(
                keyboardType: TextInputType.text,
                onChanged: (val) {},
                controller: _duration,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Course Duration',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("* Course Class:"),
              TextFormField(
                keyboardType: TextInputType.text,
                onChanged: (val) {},
                controller: _class,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Class',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("* Course Start Date:"),
              TextFormField(
                keyboardType: TextInputType.text,
                onChanged: (val) {},
                controller: _startdate,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Course Date',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  maximumSize: Size.fromHeight(56),
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  textStyle: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: () => pickImage(),
                child: Row(
                  children: [
                    Icon(
                      Icons.photo,
                      size: 28,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text("Pick Image")
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("* Course Category:"),
              DropdownButton(
                  value: dropdownValue,
                  items: <String>[
                    'All Categorise',
                    'Electro Repair',
                    'Beauty',
                    'Languages',
                    'Cellphone Maintenance',
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
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    _setCourseData();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                  child: Text("Save"))
            ],
          ),
        ),
      ),
    );
  }
}
