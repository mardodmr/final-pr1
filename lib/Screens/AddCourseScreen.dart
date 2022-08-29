// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import '../Utils/constant.dart';
import 'TextFieldWidget.dart';

class AddCourseScreen extends StatefulWidget {
  const AddCourseScreen({Key? key}) : super(key: key);

  @override
  State<AddCourseScreen> createState() => _AddCourseScreenState();
}

class _AddCourseScreenState extends State<AddCourseScreen> {
  String dropdownValue = "All Categorise";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Course"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("* Course Name:"),
            TextField(
              keyboardType: TextInputType.text,
              onChanged: (val) {},
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Course Name',
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
                })
          ],
        ),
      ),
    );
  }
}
