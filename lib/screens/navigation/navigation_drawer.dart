import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../login_screen.dart';
import '../pages/people.dart';
import '../pages/settings.dart';
import 'drawer_item.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.black,
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
                  color: Colors.grey,
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
                    name: 'Need help?',
                    icon: Icons.settings,
                    onPressed: () => onItemPressed(context, index: 2)),
                const SizedBox(
                  height: 25,
                ),
                DrawerItem(
                    name: 'About Us',
                    icon: Icons.favorite_outline,
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
                DrawerItem(
                    name: 'Feedback',
                    icon: Icons.settings,
                    onPressed: () => onItemPressed(context, index: 4)),
                const SizedBox(
                  height: 25,
                ),
                DrawerItem(
                    name: 'Log out',
                    icon: Icons.logout,
                    onPressed: () => onItemPressed(context, index: 5)),
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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const People()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Settings()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Settings()));
        break;
      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Settings()));
        break;
      case 4:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Settings()));
        break;
      case 5:
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
          children: const [
            Text('Person name',
                style: TextStyle(fontSize: 14, color: Colors.white)),
            SizedBox(
              height: 10,
            ),
            Text('person@email.com',
                style: TextStyle(fontSize: 14, color: Colors.white))
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
