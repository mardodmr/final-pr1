import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetCourseNames extends StatelessWidget {

  final String documentId;

  GetCourseNames({required this.documentId});

  @override
  Widget build(BuildContext context) {
    //get the collection
    CollectionReference courses = FirebaseFirestore.instance.collection('courses');

    return FutureBuilder<DocumentSnapshot>(
        future: courses.doc(documentId).get(),
        builder: ((context, snapshot){
      if (snapshot.connectionState == ConnectionState.done){
        Map<String, dynamic> data =
          snapshot.data!.data() as Map<String, dynamic>;
          return Text('${data['course name']}');
      }
      return Text('loading..');
    }));
  }
}
