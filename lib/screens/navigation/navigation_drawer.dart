import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Hostafe/screens/pages/aboutus.dart';
import 'package:Hostafe/screens/pages/contactus.dart';
import 'package:Hostafe/screens/pages/myacccount.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../model/user_model.dart';
import '../login_screen.dart';

import '../pages/settings.dart';
import 'drawer_item.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                headerWidget(),
                const SizedBox(
                  height: 30,
                ),
                const Divider(
                  thickness: 1,
                  height: 5,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 25,
                ),
                DrawerItem(
                  name: 'My Account',
                  icon: Icons.account_box_rounded,
                  onPressed: () => onItemPressed(context, index: 0),
                ),
                const SizedBox(
                  height: 25,
                ),
                DrawerItem(
                    name: 'Settings',
                    icon: Icons.settings,
                    onPressed: () => onItemPressed(context, index: 1)),
                const SizedBox(
                  height: 25,
                ),
                DrawerItem(
                    name: 'Contact Us',
                    icon: Icons.contact_mail,
                    onPressed: () => onItemPressed(context, index: 2)),
                const SizedBox(
                  height: 25,
                ),
                DrawerItem(
                    name: 'About Us',
                    icon: Icons.info,
                    onPressed: () => onItemPressed(context, index: 3)),
                const SizedBox(
                  height: 30,
                ),
                // const Divider(
                //   thickness: 1,
                //   height: 5,
                //   color: Colors.grey,
                // ),
                // const SizedBox(
                //   height: 30,
                // ),
                // DrawerItem(
                //     name: 'Feedback',
                //     icon: Icons.feedback,
                //     onPressed: () => onItemPressed(context, index: 4)),
                // const SizedBox(
                //   height: 25,
                // ),
                DrawerItem(
                    name: 'Log out',
                    icon: Icons.logout,
                    onPressed: () => onItemPressed(context, index: 4)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);

    switch (index) {
      case 0:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const MyAccount()));
        break;
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Settings1()));
        break;
      case 2:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const contactus()));
        break;
      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const aboutus()));
        break;
      case 4:
        logout(context);
        break;
    }
  }

  Widget headerWidget() {
    const url =
        'https://media.istockphoto.com/photos/learn-to-love-yourself-first-picture-id1291208214?b=1&k=20&m=1291208214&s=170667a&w=0&h=sAq9SonSuefj3d4WKy4KzJvUiLERXge9VgZO-oqKUOo=';
    return Row(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(url),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${loggedInUser.firstName} ${loggedInUser.secondName}",
                style: TextStyle(fontSize: 17, color: Colors.black)),
            SizedBox(
              height: 10,
            ),
            Text("${loggedInUser.email}",
                style: TextStyle(fontSize: 17, color: Colors.black))
          ],
        )
      ],
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
