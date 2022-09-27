import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Hostafe/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'navigation/navigation_drawer.dart';
import 'search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeIndex = 0;
  final assetImages = [
    "assets/1img.jpg",
    "assets/2img.jpg",
    "assets/3img.jpg",
    "assets/4img.jpg",
  ];
  final TextEditingController searchController = new TextEditingController();
  Widget build(BuildContext context) {
    final searchField = TextFormField(
      autofocus: false,
      controller: searchController,
      keyboardType: TextInputType.name,
      onTap: () => showSearch(context: context, delegate: Hostel()),
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => Hostel(),
      //   ),
      // );

      onSaved: (value) {
        searchController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        contentPadding: EdgeInsets.fromLTRB(15, 20, 15, 20),
        hintText: "Enter College Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: const Text('Hostafe'),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    //color: Color.fromARGB(19, 92, 92, 92),
                    // border: Border.all(
                    //   width: 1,
                    // ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Find Your",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Hostel",
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        searchField,
                        SizedBox(
                          height: 5,
                        )
                        // Padding(
                        //   child: searchField,
                        //   padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        // ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CarouselSlider.builder(
                  itemCount: assetImages.length,
                  itemBuilder: (context, index, realIndex) {
                    // final urlImage = urlImages[index];
                    final assetImage = assetImages[index];
                    return buildImage(assetImage, index);
                  },
                  options: CarouselOptions(
                    height: 200,
                    // viewportFraction: 1,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    // enableInfiniteScroll: false,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    autoPlayInterval: Duration(seconds: 2),
                    onPageChanged: (index, reason) =>
                        setState(() => activeIndex = index),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                buildIndicator(),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  // height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    // border: Border.all(
                    //   width: 1,
                    // ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Column(
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Flexible(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // crossAxisAlignment:
                                  //     CrossAxisAlignment.center,
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset(
                                        "assets/packers.jpeg",
                                        height: 125,
                                        width: 125,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Packers & Movers",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Flexible(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset(
                                        "assets/payrent.jpeg",
                                        height: 125,
                                        width: 125,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Pay Rent",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        Flexible(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Flexible(
                                flex: 1,
                                child: Column(
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset(
                                        "assets/services.jpeg",
                                        height: 125,
                                        width: 125,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Services &  Repairs",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Flexible(
                                flex: 1,
                                child: Column(
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset(
                                        "assets/painting.jpeg",
                                        height: 125,
                                        width: 125,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Painting & Cleaning",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Hostel Searching App",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: assetImages.length,
        // onDotClicked: animateToSlide(activeIndex),
        effect: WormEffect(
          dotHeight: 10,
          dotWidth: 10,
          activeDotColor: Colors.red,
          dotColor: Colors.black12,
        ),
      );
// void animateToSlide(int index) => controller.animateToPage();
  Widget buildImage(String assetImage, int index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        color: Colors.grey,
        width: double.infinity,

        //   child: Image.asset(
        // "assets/s.jpg",
        // fit: BoxFit.contain,
        //   ),

        child: Container(
          decoration: BoxDecoration(
            color: Colors.yellow.shade50,
            // borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              assetImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
}
