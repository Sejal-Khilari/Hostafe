// import 'package:flutter/material.dart';
// import 'package:dropdownfield2/dropdownfield2.dart';
//
// class SearchScreen extends StatefulWidget {
//   const SearchScreen({Key? key}) : super(key: key);
//
//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.cyan.shade50,
//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.fromLTRB(30, 70, 30, 10),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   DropDownField(
//                     controller: collegeSelected,
//                     hintText: "Select College",
//                     itemsVisibleInDropdown: 5,
//                     items: colleges,
//                     onValueChanged: (value) {
//                       setState(() {
//                         selectedCollege = value;
//                       });
//                     },
//                     enabled: true,
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Text(
//                     selectedCollege,
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.black87,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//         // child:
//       ),
//     );
//   }
// }
//
// String selectedCollege = "";
// final collegeSelected = TextEditingController();
//
// List<String> colleges = [
//   "National Institute of Warangal",
//   "National Institute of Surathkal",
//   "Indian Institute of Kanpur",
//   "BITS GOA",
//   "Vishwakarma Institute of Technology",
//   "Pimpri Chinchwad College Of Engineering",
//   "Thadomal Sahani College of Engineering",
//   "Pune Institute Of Computer Technology",
// ];

import 'package:Hostafe/screens/navigation/info.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Hostafe/constants.dart';
// import 'navigation/filter_screen.dart';
import 'filter_screen.dart';

class Hostel extends SearchDelegate {
  CollectionReference _firebaseFirestore =
      FirebaseFirestore.instance.collection("Hostels");

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context));
  }

  @override
  Widget buildResults(BuildContext context) {
    bool valueb = false;

    return StreamBuilder<QuerySnapshot>(
        stream: _firebaseFirestore.snapshots().asBroadcastStream(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.data!.docs
                .where((QueryDocumentSnapshot<Object?> element) =>
                    element['clg_name']
                        .toString()
                        .toLowerCase()
                        .contains(query.toLowerCase()))
                .isEmpty) {
              return Center(
                child: Text("No such query found"),
              );
            } else if (valueb == true) {
              return ListView(
                children: [
                  ...snapshot.data!.docs
                      .where((QueryDocumentSnapshot<Object?> element) =>
                          element['gender']
                              .toString()
                              .toLowerCase()
                              .contains(query.toLowerCase()) ==
                          "boys")
                      .map((QueryDocumentSnapshot<Object?> data) {
                    final String clg_name = data.get('clg_name');
                    final String price = data['price'];
                    final String hostel_name = data['hostel_name'];
                    final String contact_no = data['contact_no'];
                    final String distance = data['distance'];
                    final String hostel_address = data['hostel_address'];
                    final String location = data['location'];
                    final String mess = data['mess'];
                    final String gender = data['gender'];

                    return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => hosteldat(data: data),
                            ));
                      },
                      title: Text(
                        hostel_name,
                        style: TextStyle(fontSize: 20.0),
                      ),
                      //subtitle: Text(price + hostel_name),
                    );
                  })
                ],
              );
            } else {
              return ListView(
                children: [
                  ...snapshot.data!.docs
                      .where((QueryDocumentSnapshot<Object?> element) =>
                          element['clg_name']
                              .toString()
                              .toLowerCase()
                              .contains(query.toLowerCase()))
                      .map((QueryDocumentSnapshot<Object?> data) {
                    final String clg_name = data.get('clg_name');
                    final String price = data['price'];
                    final String hostel_name = data['hostel_name'];
                    final String contact_no = data['contact_no'];
                    final String distance = data['distance'];
                    final String hostel_address = data['hostel_address'];
                    final String location = data['location'];
                    final String mess = data['mess'];
                    final String gender = data['gender'];

                    return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => hosteldat(data: data),
                            ));
                      },
                      title: Text(
                        hostel_name,
                        style: TextStyle(fontSize: 20.0),
                      ),
                      //subtitle: Text(price + hostel_name),
                    );
                  })
                ],
              );
            }
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    bool valueb = false;
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // Text("Search anything here"),
                SizedBox(
                  height: 5,
                ),
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(5),
                  color: kPrimaryColor,
                  child: MaterialButton(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    minWidth: MediaQuery.of(context).size.aspectRatio,
                    // minWidth: MediaQuery.of(context).size.width,
                    onPressed: () {
                      // signIn(emailController.text, passwordController.text);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FilterScreen()));
                    },
                    child: Text(
                      "Filters",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                // Checkbox(
                //   value: valueb,
                //   onChanged: (bool valueb) {
                //     setState(() {
                //       value = valueb;
                //     });
                //   },
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
