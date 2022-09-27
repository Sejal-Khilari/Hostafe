// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class Call extends StatefulWidget {
//   const Call({@required this.data});
//   final QueryDocumentSnapshot<Object?>? data;
//
//   @override
//   State<Call> createState() => _CallState();
// }
//
// class _CallState extends State<Call> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Information"),
//       ),
//       body: SafeArea(
//         child: Expanded(
//           child: SingleChildScrollView(
//             child: Container(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     height: 100.0,
//                     decoration: BoxDecoration(
//                         color: Colors.blueGrey.shade100,
//                         shape: BoxShape.rectangle,
//                         borderRadius: BorderRadius.circular(10)),
//                     padding: const EdgeInsets.all(15.0),
//                     child: Text(
//                       "Hostel Name :" + widget.data!.get('hostel_name'),
//                       style: TextStyle(
//                         fontSize: 20.0,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   Container(
//                     width: double.infinity,
//                     height: 100.0,
//                     decoration: BoxDecoration(
//                         color: Colors.blueGrey.shade100,
//                         shape: BoxShape.rectangle,
//                         borderRadius: BorderRadius.circular(10)),
//                     padding: const EdgeInsets.all(15.0),
//                     child: Text(
//                       "Contact numbers : " + widget.data!.get('contact_no'),
//                       style: TextStyle(
//                         fontSize: 20.0,
//                       ),
//                       textAlign: TextAlign.justify,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   Container(
//                     width: double.infinity,
//                     height: 100.0,
//                     decoration: BoxDecoration(
//                         color: Colors.blueGrey.shade100,
//                         shape: BoxShape.rectangle,
//                         borderRadius: BorderRadius.circular(10)),
//                     child: Text(
//                       "Distance From College : " + widget.data!.get('distance'),
//                       style: TextStyle(
//                         fontSize: 20.0,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   Container(
//                     width: double.infinity,
//                     height: 100.0,
//                     decoration: BoxDecoration(
//                         color: Colors.blueGrey.shade100,
//                         shape: BoxShape.rectangle,
//                         borderRadius: BorderRadius.circular(10)),
//                     child: Text(
//                       "Hostel Adress: " + widget.data!.get('hostel_address'),
//                       style: TextStyle(
//                         fontSize: 20.0,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   Container(
//                     width: double.infinity,
//                     height: 100.0,
//                     decoration: BoxDecoration(
//                         color: Colors.blueGrey.shade100,
//                         shape: BoxShape.rectangle,
//                         borderRadius: BorderRadius.circular(10)),
//                     child: Text(
//                       "Location:  " + widget.data!.get('location'),
//                       style: TextStyle(
//                         fontSize: 20.0,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class hosteldat extends StatefulWidget {
  const hosteldat({@required this.data});
  final QueryDocumentSnapshot<Object?>? data;

  @override
  _hosteldatState createState() => _hosteldatState();
}

class _hosteldatState extends State<hosteldat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD1C4E9),
      appBar: AppBar(
        backgroundColor: Color(0xFF700bef),
        title: Text('Hostel Details '),
      ),
      body: Container(
        // padding: EdgeInsets.all(20),
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 10,
                color: Colors.yellow.shade50,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'College Name : ' +
                            widget.data!
                                .get('clg_name')
                                .toString()
                                .toUpperCase(),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                  // child:
                ),
              ),
              // SizedBox(
              //   height: 0,
              // ),
              Card(
                elevation: 10,
                color: Colors.yellow.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Hostel Name : ' + widget.data!.get('hostel_name'),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 0.2,
              // ),
              Card(
                elevation: 10,
                color: Colors.yellow.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Address : ' + widget.data!.get('hostel_address'),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 5,
              // ),
              Card(
                elevation: 10,
                color: Colors.yellow.shade50,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Contact No : ' + widget.data!.get('contact_no'),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                  // child:
                ),
              ),
              // SizedBox(
              //   height: 5,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Card(
                        elevation: 10,
                        color: Colors.yellow.shade50,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Price : ' + widget.data!.get('price'),
                              style: TextStyle(
                                fontSize: 20,
                              )),
                        ),
                      ),
                    ],
                    // child:
                  ),
                  Card(
                    color: Colors.yellow.shade50,
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Distance : ' + widget.data!.get('distance'),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   height: 5,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Card(
                        elevation: 10,
                        color: Colors.yellow.shade50,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Mess : ' + widget.data!.get('mess'),
                              style: TextStyle(
                                fontSize: 20,
                              )),
                        ),
                      ),
                    ],
                    // child:
                  ),
                  Card(
                    color: Colors.yellow.shade50,
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Gender : ' + widget.data!.get('gender'),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   height: 5,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    margin: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.yellow.shade50,
                    elevation: 10,
                    child: TextButton(
                      child: const Text(
                        'Click Here to view on maps ',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        launch(widget.data!.get('location'));
                        // 'https://www.google.com/intl/en-GB/gmail/about/');
                      },
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   height: 5,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
