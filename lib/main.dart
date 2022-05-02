import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:Hostafe/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Email and Password Login',
      // theme: ThemeData(
      //   primarySwatch: Colors.red,
      // ),
      home: AnimatedSplashScreen(
        splash: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/1img.jpg",
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Hostafe",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
              ],
            ),
          ),
        ),
        duration: 1500,
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: LoginScreen(),
      ),
    );
  }
}
