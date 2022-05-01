import 'package:flutter/material.dart';
import 'package:dropdownfield2/dropdownfield2.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade50,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(30, 70, 30, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  DropDownField(
                    controller: collegeSelected,
                    hintText: "Select College",
                    itemsVisibleInDropdown: 5,
                    items: colleges,
                    onValueChanged: (value) {
                      setState(() {
                        selectedCollege = value;
                      });
                    },
                    enabled: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    selectedCollege,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
        // child:
      ),
    );
  }
}

String selectedCollege = "";
final collegeSelected = TextEditingController();

List<String> colleges = [
  "National Institute of Warangal",
  "National Institute of Surathkal",
  "Indian Institute of Kanpur",
  "BITS GOA",
  "Vishwakarma Institute of Technology",
  "Pimpri Chinchwad College Of Engineering",
  "Thadomal Sahani College of Engineering",
  "Pune Institute Of Computer Technology",
];
