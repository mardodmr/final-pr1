// ignore_for_file: sized_box_for_whitespace

import 'dart:io';

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
  /// TODO onpressed function

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
              ),const SizedBox(
                height: 20,
              ),
              const Text("* Course Name:"),
              TextFormField(
                keyboardType: TextInputType.text,
                onChanged: (val) {},
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Course Name',
                ),
              ),
              const SizedBox(
                height: 20,
              ),const Text("* Instructor Name:"),
              TextFormField(
                keyboardType: TextInputType.text,
                onChanged: (val) {},
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Instructor Name',
                ),
              ),
              const SizedBox(
                height: 20,
              ),const Text("* Course Cost:"),
              TextFormField(
                keyboardType: TextInputType.text,
                onChanged: (val) {},
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Course Cost',
                ),
              ),
              const SizedBox(
                height: 20,
              ),const Text("* Center Name:"),
              TextFormField(
                keyboardType: TextInputType.text,
                onChanged: (val) {},
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
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Course Duration',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(style: ElevatedButton.styleFrom(
                maximumSize: Size.fromHeight(56),
                primary: Colors.white,
                onPrimary: Colors.black,
                textStyle: TextStyle(fontSize: 20,),),
                  onPressed: ()=> pickImage(),
                  child: Row(children: [
                    Icon(Icons.photo, size: 28, color: Colors.black,),
                    SizedBox(width: 16,),
                    Text("Pick Image")
                  ],),),

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
            ],
          ),
        ),
      ),
    );
  }
}
