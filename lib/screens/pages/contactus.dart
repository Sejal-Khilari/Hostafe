import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class contactus extends StatelessWidget {
  const contactus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF700bef),
        title: Text('Contact Us'),
      ),
      body: Card(
        margin: EdgeInsets.all(20),
        child: TextButton(
          child: const Text(
            'If you have any doubts or feedback in how to improve the app, '
            'Please contact us through email : contact@hostafe.com',
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            launch('https://www.google.com/intl/en-GB/gmail/about/');
          },
        ),
      ),
    );
  }
}
