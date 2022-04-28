import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_password/constants.dart';
import 'navigation/navigation_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: const Text('Hostafe'),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}
