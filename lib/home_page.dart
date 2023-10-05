import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:blur/blur.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shakes_app/details_page.dart';

import 'widgets/shake_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  List<String> _shakes = [
    "assets/shake.png",
    "assets/shake1.png",
    "assets/shake2.png",
    "assets/shake3.png",
    "assets/shake4.webp",
  ];

  bool _shakeSelected = true;
  bool _coffeeSelected = false;
  bool _cocktailsSelected = false;
  bool _softSelected = false;
  int _itemNumber = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        new AnimationController(duration: Duration(seconds: 5), vsync: this)
          ..addListener(() => setState(() {}));
    animation = Tween(begin: -200.0, end: 200.0).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.brown,
      body: Container(
        padding: EdgeInsets.only(top: 70, left: 15, right: 15),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color.fromARGB(255, 153, 33, 53).withOpacity(1),
              Color(0xFF521f26),
            ])),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 10,
              child: Transform.translate(
                offset: Offset(
                  animation.value,
                  animation.value,
                ),
                child: BlurryContainer(
                  height: 150,
                  width: 150,
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.red.withOpacity(.2),
                  blur: 2,
                  child: Container(),
                ),
              ),
            ),
            Bounce(
              child: Positioned(
                bottom: 60,
                left: 150,
                child: Transform.translate(
                  offset: Offset(animation.value * -1, animation.value * -1),
                  child: BlurryContainer(
                    height: 150,
                    width: 150,
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.red.withOpacity(.2),
                    blur: 2,
                    child: Container(),
                  ),
                ),
              ),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Welcome, Prateek!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "SipSlick",
                  style: TextStyle(
                      color: Colors.white.withOpacity(.8),
                      fontSize: 25,
                      fontFamily: "Electrolize",
                      letterSpacing: 5,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      hintText: "Search",
                      contentPadding: EdgeInsets.only(left: 10),
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.search,
                          color: Colors.brown,
                          size: 30,
                        ),
                      )),
                ),
              ),

// * side bar and shakes items
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // * side navBar
                    Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * .7,
                            // color: Colors.black,
                            width: MediaQuery.of(context).size.width * 0.9235,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Positioned(
                                      right: 120,
                                      child: Transform.rotate(
                                        angle: pi * 1.5,
                                        child: Padding(
                                          padding: const EdgeInsets.all(0),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Row(
                                              children: [
                                                // * soft juice
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      _softSelected = true;
                                                      _coffeeSelected = false;
                                                      _shakeSelected = false;
                                                      _cocktailsSelected =
                                                          false;
                                                    });
                                                  },
                                                  child: Bounce(
                                                    delay: Duration(
                                                        milliseconds: 1000),
                                                    child: AnimatedContainer(
                                                      duration: Duration(
                                                          milliseconds: 500),
                                                      height: 70,
                                                      width: 110,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: _softSelected
                                                            ? Colors.red
                                                                .withOpacity(.5)
                                                            : Colors.white
                                                                .withOpacity(
                                                                    .1),
                                                      ),
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      child: Center(
                                                        child: Text(
                                                          "Soft",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              overflow:
                                                                  TextOverflow
                                                                      .visible,
                                                              fontSize: 21,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      _softSelected = false;
                                                      _coffeeSelected = true;
                                                      _shakeSelected = false;
                                                      _cocktailsSelected =
                                                          false;
                                                    });
                                                  },
                                                  child: Bounce(
                                                    delay: Duration(
                                                        milliseconds: 800),
                                                    child: AnimatedContainer(
                                                      duration: Duration(
                                                          milliseconds: 500),
                                                      height: 70,
                                                      width: 100,
                                                      padding:
                                                          EdgeInsets.all(2),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: _coffeeSelected
                                                            ? Colors.red
                                                                .withOpacity(.5)
                                                            : Colors.white
                                                                .withOpacity(
                                                                    .1),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "Coffees",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              overflow:
                                                                  TextOverflow
                                                                      .visible,
                                                              fontSize: 21,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      _softSelected = false;
                                                      _coffeeSelected = false;
                                                      _shakeSelected = false;
                                                      _cocktailsSelected = true;
                                                    });
                                                  },
                                                  child: Bounce(
                                                    delay: Duration(
                                                        milliseconds: 600),
                                                    child: AnimatedContainer(
                                                      duration: Duration(
                                                          milliseconds: 500),
                                                      height: 70,
                                                      width: 100,
                                                      padding:
                                                          EdgeInsets.all(2),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: _cocktailsSelected
                                                            ? Colors.red
                                                                .withOpacity(.5)
                                                            : Colors.white
                                                                .withOpacity(
                                                                    .1),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "Cocktails",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              overflow:
                                                                  TextOverflow
                                                                      .visible,
                                                              fontSize: 21,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      _softSelected = false;
                                                      _coffeeSelected = false;
                                                      _shakeSelected = true;
                                                      _cocktailsSelected =
                                                          false;
                                                    });
                                                  },
                                                  child: Bounce(
                                                    delay: Duration(
                                                        milliseconds: 400),
                                                    child: AnimatedContainer(
                                                      duration: Duration(
                                                          milliseconds: 500),
                                                      height: 70,
                                                      width: 100,
                                                      padding:
                                                          EdgeInsets.all(2),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: _shakeSelected
                                                            ? Colors.red
                                                                .withOpacity(.5)
                                                            : Colors.white
                                                                .withOpacity(
                                                                    .1),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "Shake",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              overflow:
                                                                  TextOverflow
                                                                      .visible,
                                                              fontSize: 21,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),

                                  // * vertical divider
                                  Positioned(
                                    left: 100,
                                    top: 80,
                                    // bottom: 10,
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 500,
                                          width: 1,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),

                                  // * shakes list
                                  Positioned(
                                    right: 0,
                                    top: 10,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Container(
                                        //   height: 200,
                                        //   width: 200,
                                        //   color: Colors.white,
                                        // ),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: SizedBox(
                                                height: 650,
                                                width: 250,
                                                child: ListWheelScrollView(
                                                  onSelectedItemChanged: (a) {
                                                    print(a);
                                                    setState(() {
                                                      _itemNumber = a;
                                                    });
                                                  },
                                                  itemExtent: 250,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        print("Hel");
                                                      },
                                                      child: ShakeWidget(
                                                        shakes: "Mix shake",
                                                        shakesImg: _shakes[0],
                                                        price: "543",
                                                      ),
                                                    ),
                                                    ShakeWidget(
                                                      shakes: "Soft shake",
                                                      shakesImg: _shakes[1],
                                                      price: "342",
                                                    ),
                                                    ShakeWidget(
                                                      shakes: "Mech Shake",
                                                      shakesImg: _shakes[2],
                                                      price: "234",
                                                    ),
                                                    ShakeWidget(
                                                      shakes: "Berry Juice",
                                                      shakesImg: _shakes[3],
                                                      price: "542",
                                                    ),
                                                    ShakeWidget(
                                                      shakes: "Milk Juice",
                                                      shakesImg: _shakes[4],
                                                      price: "542",
                                                    ),
                                                  ],
                                                )))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // * items list
                  ],
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
