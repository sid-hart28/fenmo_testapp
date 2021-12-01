import 'package:flutter/material.dart';

//external packages
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//core packages
import 'package:testapp/utils/components/cat_box.dart';
import 'package:testapp/utils/components/carousel_container.dart';
import 'package:testapp/utils/components/head_container.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

int _activeCarouselIndex = 0;

List<String> _carouselitems = [
  '@creator1',
  '@creator2',
  '@creator3',
  '@creator4'
];

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    double width = size.width;
    // Account currentUser = widget.currentUser;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            HeadContainer(
              title: "test name",
              color2: Color(0xFF16212C),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.elliptical(25, 50),
                    topRight: Radius.elliptical(25, 50),
                  ),
                ),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              width * 0.06, width * 0.06, width * 0.06, 8),
                          child: CarouselSlider(
                            options: CarouselOptions(
                                height: 200,
                                viewportFraction: 1,
                                enlargeCenterPage: true,
                                autoPlay: true,
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 500),
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _activeCarouselIndex = index;
                                  });
                                }),
                            items: _carouselitems.map((creator) {
                              return CarouselContainer(
                                creator: creator,
                                width: width,
                              );
                            }).toList(),
                          ),
                        ),
                        AnimatedSmoothIndicator(
                          activeIndex: _activeCarouselIndex,
                          count: 4,
                          effect: const ExpandingDotsEffect(
                            radius: 6,
                            dotWidth: 6,
                            dotHeight: 6,
                            dotColor: Color(0xFF84BDFA),
                            activeDotColor: Color(0xFF84BDFA),
                          ),
                        ),
                        const SizedBox(height: 18),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.06),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'start where you left',
                              style: TextStyle(
                                color: const Color(0xFFACAFB3),
                                fontWeight: FontWeight.w900,
                                fontSize: width * 0.045,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.06),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(width * 0.03)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: width * 0.015,
                                ),
                              ],
                            ),
                            height: 90,
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 14, horizontal: width * 0.03),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(width * 0.025)),
                                    child: Container(
                                      width: 60,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(width * 0.0125),
                                      child: Text(
                                        'Book Summary-',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(width * 0.0125),
                                      child: Text(
                                        'The Atomic Habits',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(child: SizedBox()),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 14, horizontal: width * 0.05),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: width * 0.125,
                                        height: width * 0.125,
                                        child: CircularProgressIndicator(
                                          color: const Color(0xFF789AFF),
                                          strokeWidth: width * 0.04,
                                          value: 0.64,
                                        ),
                                      ),
                                      Text(
                                        '64%',
                                        style: TextStyle(
                                          fontSize: width * 0.025,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.06),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'explore by category',
                              style: TextStyle(
                                color: Color(0xFFACAFB3),
                                fontWeight: FontWeight.w900,
                                fontSize: width * 0.045,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),
                        Container(
                          height: 150,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.06),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        CategoryBox(
                                          title: 'financial world',
                                          color1: const Color(0xFFD35959),
                                          color2: const Color(0xFFF6DDDD),
                                        ),
                                        const SizedBox(height: 10),
                                        CategoryBox(
                                          title: 'english speaking',
                                          color1: const Color(0xFF0098EC),
                                          color2: const Color(0xFFCBEAFB),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      children: [
                                        CategoryBox(
                                          title: 'career growth',
                                          color1: const Color(0xFF61B872),
                                          color2: const Color(0xFFDEF0E2),
                                        ),
                                        const SizedBox(height: 10),
                                        CategoryBox(
                                          title: 'motivational',
                                          color1: const Color(0xFFF5B03C),
                                          color2: const Color(0xFFFCEED7),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      children: [
                                        CategoryBox(
                                          title: 'financial world',
                                          color1: const Color(0xFFF46A43),
                                          color2: const Color(0xFFFCE0D8),
                                        ),
                                        const SizedBox(height: 10),
                                        CategoryBox(
                                          title: 'financial world',
                                          color1: const Color(0xFF3F51B5),
                                          color2: const Color(0xFFD8DBEF),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 18),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.06),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'trending creators',
                              style: TextStyle(
                                color: Color(0xFFACAFB3),
                                fontWeight: FontWeight.w900,
                                fontSize: width * 0.045,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),
                        Container(
                          height: 76,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.06),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 38,
                                    ),
                                    SizedBox(width: 12),
                                    CircleAvatar(
                                      radius: 38,
                                    ),
                                    SizedBox(width: 12),
                                    CircleAvatar(
                                      radius: 38,
                                    ),
                                    SizedBox(width: 12),
                                    CircleAvatar(
                                      radius: 38,
                                    ),
                                    SizedBox(width: 12),
                                    CircleAvatar(
                                      radius: 38,
                                    ),
                                    SizedBox(width: 12),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
