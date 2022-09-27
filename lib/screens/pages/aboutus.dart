import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        // backgroundColor: Colors.white60,
        appBar: AppBar(
          backgroundColor: Color(0xFF700bef),
          title: Text('About Us'),
        ),
        // body: Container(
        //   child: Column(
        //     children: [
        //       Container(
        //         child: Column(
        //           children: [
        //             Container(
        //               margin: const EdgeInsets.all(20),
        //               child: const Text(
        //                 'About Us',
        //                 style: TextStyle(fontSize: 25, color: Color(0xFF700bef)),
        //               ),
        //             ),
        //             Container(
        //               margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        //               child: const Text(
        //                 'SE11 PBL PROJECT',
        //                 style: TextStyle(fontSize: 25, color: Color(0xFF700bef)),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //       Container(
        //         child: Column(
        //           children: [
        //             const SizedBox(
        //               height: 30,
        //             ),
        //             CarouselSlider(
        //                 carouselController: CarouselController(),
        //                 options: CarouselOptions(
        //                     height: 400,
        //                     autoPlay: false,
        //                     enlargeCenterPage: true,
        //                     enableInfiniteScroll: false),
        //                 items: items.map((items) {
        //                   return Builder(builder: (BuildContext context) {
        //                     return SizedBox(
        //                       width: double.infinity,
        //                       height: double.infinity,
        //                       child: Card(
        //                         elevation: 3,
        //                         child: Column(
        //                           mainAxisAlignment: MainAxisAlignment.start,
        //                           crossAxisAlignment: CrossAxisAlignment.center,
        //                           children: [
        //                             const SizedBox(
        //                               height: 30,
        //                             ),
        //                             SizedBox(
        //                               width: double.infinity,
        //                               //height: double.infinity,
        //                               child: Center(
        //                                 child: Stack(
        //                                   children: <Widget>[
        //                                     CircleAvatar(
        //                                       radius: 65,
        //                                       backgroundColor: Color.fromRGBO(
        //                                           111, 245, 253, 1.0),
        //                                       // foregroundImage: Image.asset("assets/1img.jpg",),
        //
        //                                       // backgroundImage: _image == null
        //                                       //     ? AssetImage("assets/1img.jpg")
        //                                       //     : FileImage(_image)
        //                                       //         as ImageProvider,
        //
        //                                       // backgroundImage: Image.asset(
        //                                       //   "assets/img.jpg",
        //                                       //   fit: BoxFit.contain,
        //                                       // ) as ImageProvider,
        //                                       // : DecorationImage( image: true ? NetworkImage('someNetWorkLocation.com') : AssetImage('assets/images/noImageAvailable.png') as ImageProvider ),
        //
        //                                       // image: (imageFile != null) ? FileImage(imageFile!) as ImageProvider : AssetImage("assets/xxx.png")
        //
        //                                       child: Image.asset(
        //                                         "assets/1img.jpg",
        //                                         fit: BoxFit.contain,
        //                                       ),
        //                                     ),
        //                                   ],
        //                                 ),
        //                               ),
        //                             ),
        //                             const SizedBox(
        //                               height: 45,
        //                             ),
        //                             Text(
        //                               items,
        //                               style: const TextStyle(
        //                                 fontSize: 25,
        //                                 fontWeight: FontWeight.normal,
        //                                 color: Colors.black87,
        //                               ),
        //                             ),
        //                             const SizedBox(
        //                               height: 25,
        //                             ),
        //                             Row(
        //                               mainAxisAlignment:
        //                                   MainAxisAlignment.spaceEvenly,
        //                               children: [
        //                                 IconButton(
        //                                   onPressed: () {
        //                                     launch('https://heylink.me/hmb');
        //                                   },
        //                                   icon: Icon(Icons.phone), //insta
        //                                 ),
        //                                 IconButton(
        //                                   onPressed: () {
        //                                     launch('https://heylink.me/hmb');
        //                                   },
        //                                   icon: Icon(Icons.phone), //facebook
        //                                 ),
        //                                 IconButton(
        //                                   onPressed: () {
        //                                     launch(
        //                                         'https://www.google.com/intl/en-GB/gmail/about/');
        //                                   },
        //                                   icon: Icon(Icons.phone), //github
        //                                 ),
        //                                 IconButton(
        //                                   onPressed: () {
        //                                     launch(
        //                                         'https://www.google.com/intl/en-GB/gmail/about/');
        //                                   },
        //                                   icon: Icon(Icons.phone), //linkedin
        //                                 ),
        //                                 // IconButton(
        //                                 //   onPressed: () {},
        //                                 //   icon: Icon(FontAwesomeIcons.linkedinIn),
        //                                 // ),
        //                               ],
        //                             ),
        //                           ],
        //                         ),
        //                       ),
        //                     );
        //                   });
        //                 }).toList()),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),

        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Card(
                    shadowColor: Colors.cyan,
                    elevation: 10,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 90,
                            backgroundColor: Colors.cyan.shade200,
                            child: CircleAvatar(
                              backgroundImage: AssetImage('assets/sejal.jpeg'),
                              radius: 85,
                            ),
                          ),
                          // Image.asset("assets/1img.jpg"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Sejal Khilari",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              IconButton(
                                onPressed: () {
                                  launch(
                                      'https://www.linkedin.com/in/sejal-khilari-024860234/');
                                },
                                icon: Icon(
                                  FontAwesomeIcons.linkedin,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  launch(
                                      'https://www.instagram.com/sejal_2807/');
                                },
                                icon: Icon(
                                  FontAwesomeIcons.instagram,
                                ),
                              ),
                            ],
                          ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.envelope,
                                size: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "sejalkhilari2807@gmail.com",
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          // Text("Gmail : sejalkhilari2807@gmail.com"),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    shadowColor: Colors.greenAccent,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 90,
                            backgroundColor: Colors.greenAccent.shade200,
                            child: CircleAvatar(
                              backgroundImage: AssetImage('assets/hemang.jpeg'),
                              radius: 85,
                            ),
                          ),
                          // Image.asset("assets/1img.jpg"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Hemang Barhate",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              IconButton(
                                onPressed: () {
                                  launch(
                                      'https://www.linkedin.com/in/hemang-barhate-624080232/');
                                },
                                icon: Icon(
                                  FontAwesomeIcons.linkedin,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  launch(
                                      'https://www.instagram.com/hemangbarhate/');
                                },
                                icon: Icon(
                                  FontAwesomeIcons.instagram,
                                ),
                              ),
                            ],
                          ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.envelope,
                                size: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "hemangbarhate@gmail.com",
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    shadowColor: Colors.cyan,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 90,
                            backgroundColor: Colors.cyan.shade200,
                            child: CircleAvatar(
                              backgroundImage: AssetImage('assets/yash.jpeg'),
                              radius: 85,
                            ),
                          ),
                          // Image.asset("assets/1img.jpg"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Yash Gajalwar",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              IconButton(
                                onPressed: () {
                                  launch(
                                      'https://www.linkedin.com/in/yash-gajalwar-b412361b9/');
                                },
                                icon: Icon(
                                  FontAwesomeIcons.linkedin,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  launch(
                                      'https://www.instagram.com/yashgajalwar/');
                                },
                                icon: Icon(
                                  FontAwesomeIcons.instagram,
                                ),
                              ),
                            ],
                          ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.envelope,
                                size: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "yashgajalwar@gmail.com",
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          // Text("Gmail : yashgajalwar@gmail.com"),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    shadowColor: Colors.greenAccent,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 90,
                            backgroundColor: Colors.greenAccent,
                            child: CircleAvatar(
                              backgroundImage: AssetImage('assets/kushal.jpeg'),
                              radius: 85,
                            ),
                          ),
                          // Image.asset("assets/1img.jpg"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Kushal Bhattad",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              IconButton(
                                onPressed: () {
                                  launch(
                                      'https://www.linkedin.com/in/kushal-bhattad-a12b87200/');
                                },
                                icon: Icon(
                                  FontAwesomeIcons.linkedin,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  launch(
                                      'https://www.instagram.com/kushal_bhattad/');
                                },
                                icon: Icon(
                                  FontAwesomeIcons.instagram,
                                ),
                              ),
                            ],
                          ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.envelope,
                                size: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "kushalbhattad@gmail.com",
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          // Text("Gmail : kushalbhattad@gmail.com"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
