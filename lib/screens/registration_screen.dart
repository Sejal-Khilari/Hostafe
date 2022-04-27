import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_password/model/user_model.dart';
import 'package:email_password/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:email_password/constants.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  //form key
  final _formKey = GlobalKey<FormState>();

  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final emailNameEditingController = new TextEditingController();
  final passwordNameEditingController = new TextEditingController();
  final confirmPasswordNameEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //First Name field
    final firstNameField = TextFormField(
        autofocus: false,
        controller: firstNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("First Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min3 Character");
          }
          return null;
        },
        onSaved: (value) {
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_circle,
              color: kPrimaryColor,
            ),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "First Name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )));

    //Second Name field
    final secondNameField = TextFormField(
        autofocus: false,
        controller: secondNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("Second Name cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          secondNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.account_circle, color: kPrimaryColor),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Second Name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )));

    //Email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailNameEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          //reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.mail,
              color: kPrimaryColor,
            ),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Email",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )));

    //Password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordNameEditingController,
        //keyboardType: TextInputType.emailAddress,
        obscureText: true,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Please Enter Valid Password(Min. 6 Character");
          }
        },
        onSaved: (value) {
          passwordNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.vpn_key,
              color: kPrimaryColor,
            ),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )));

    //Confirm Password field
    // final confirmPasswordField = TextFormField(
    //     autofocus: false,
    //     controller: confirmPasswordNameEditingController,
    //     //keyboardType: TextInputType.emailAddress,
    //     obscureText: true,
    //     validator: (value) {
    //       if (confirmPasswordNameEditingController.text !=
    //           passwordNameEditingController.text) {
    //         return "Password don't match";
    //       }
    //       return null;
    //     },
    //     onSaved: (value) {
    //       confirmPasswordNameEditingController.text = value!;
    //     },
    //     textInputAction: TextInputAction.done,
    //     decoration: InputDecoration(
    //         prefixIcon: Icon(
    //           Icons.vpn_key,
    //           color: kPrimaryColor,
    //         ),
    //         contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
    //         hintText: "Confirm Password",
    //         border: OutlineInputBorder(
    //           borderRadius: BorderRadius.circular(20),
    //         )));

    //SignUp button
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: kPrimaryColor,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signUp(emailNameEditingController.text,
              passwordNameEditingController.text);
        },
        child: Text(
          "SignUp",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: kPrimaryColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 150,
                        child: Image.asset("assets/signup.png",
                            fit: BoxFit.contain),
                      ),
                      SizedBox(height: 10),
                      firstNameField,
                      SizedBox(height: 10),
                      secondNameField,
                      SizedBox(height: 10),
                      emailField,
                      SizedBox(height: 10),
                      passwordField,
                      // SizedBox(height: 10),
                      // confirmPasswordField,
                      SizedBox(height: 15),
                      signUpButton,
                      SizedBox(height: 10),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    //calling our firestore
    //calling our user model
    //sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    //writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.secondName = secondNameEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully!");

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
  }
}
