import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Screens/SubCategoriesScreen.dart';

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
          return //Text('${data['course name']}');
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 170,
                padding: EdgeInsets.symmetric(
                    horizontal: 12, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors
                      .red, //Color.fromRGBO(234, 246, 239, 1),
                ),
                width: 300,
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('${data['course name']}',style: TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(
                          51, 56, 63, 1),
                    ),),
                        // Text(
                        //   textTest,
                        //   style: TextStyle(
                        //     fontSize: 15,
                        //     color: Color.fromRGBO(
                        //         51, 56, 63, 1),
                        //   ),
                        // ),
                        Icon(
                          Icons.error,
                          color:
                          Color.fromRGBO(51, 56, 63, 1),
                          size: 20,
                        )
                      ],
                    ),
                    Text(
                      'Get 25%',
                      style: TextStyle(
                          color:
                          Color.fromRGBO(26, 29, 31, 1),
                          fontSize: 48,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 106,
                      height: 33,
                      child: RawMaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(100)),
                        fillColor: Color.fromRGBO(
                            255, 255, 255, 1),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SubCategoriesScreen()));
                        },
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            Text(
                              "Book now! ",
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromRGBO(
                                    51, 56, 63, 1),
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: Color.fromRGBO(
                                  51, 56, 63, 1),
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            );
      }
      return Text('loading..');
    }));
  }
}
