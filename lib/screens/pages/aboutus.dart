import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class aboutus extends StatefulWidget {
  const aboutus({Key? key}) : super(key: key);

  @override
  _aboutusState createState() => _aboutusState();
}

class _aboutusState extends State<aboutus> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    final List items = ["Hemang", "Yash", "Sejal", "Kushal"];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF700bef),
        title: Text('About Us'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: const Text(
                      'About Us',
                      style: TextStyle(fontSize: 25, color: Color(0xFF700bef)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: const Text(
                      'hostafe pbl project gsdgdjfuvj jghgjdsfhhdgfjehbc jhdsdhbsncbvchx vhsvsbcsgvcbsxvsv'
                      'hsvhgsgxvaxcafcgvgxgvx sgdf xbxh g scgsdjHF HDGSVBDSV',
                      style: TextStyle(fontSize: 20, color: Color(0xFF700bef)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  CarouselSlider(
                      carouselController: CarouselController(),
                      options: CarouselOptions(
                          height: 400,
                          autoPlay: false,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: false),
                      items: items.map((items) {
                        return Builder(builder: (BuildContext context) {
                          return SizedBox(
                            width: double.infinity,
                            height: double.infinity,
                            child: Card(
                              elevation: 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    //height: double.infinity,
                                    child: Center(
                                      child: Stack(
                                        children: const [
                                          CircleAvatar(
                                            radius: 65,
                                            backgroundColor: Color.fromRGBO(
                                                111, 245, 253, 1.0),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 45,
                                  ),
                                  Text(
                                    items,
                                    style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          launch('https://heylink.me/hmb');
                                        },
                                        icon: Icon(Icons.phone), //insta
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          launch('https://heylink.me/hmb');
                                        },
                                        icon: Icon(Icons.phone), //facebook
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          launch(
                                              'https://www.google.com/intl/en-GB/gmail/about/');
                                        },
                                        icon: Icon(Icons.phone), //github
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          launch(
                                              'https://www.google.com/intl/en-GB/gmail/about/');
                                        },
                                        icon: Icon(Icons.phone), //linkedin
                                      ),
                                      // IconButton(
                                      //   onPressed: () {},
                                      //   icon: Icon(FontAwesomeIcons.linkedinIn),
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                      }).toList()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
