import 'package:flutter/material.dart';

class UnbordingContent {
  String image;
  String title;

  UnbordingContent({required this.image, required this.title});
}

List<UnbordingContent> contents = [
  UnbordingContent(
    title: "Easy Registration",
    image: 'assets/images/easyRegstration.png',
  ),
  UnbordingContent(
    title: 'Scour through different courses',
    image: 'assets/images/scourCourses.jpg',
  ),
  UnbordingContent(
    title: 'Book a course with one click',
    image: 'assets/images/icon_two-apps.b28140c4.gif',
  ),
];
