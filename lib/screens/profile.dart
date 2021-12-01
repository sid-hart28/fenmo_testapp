import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testapp/utils/components/head_container.dart';
import 'package:testapp/utils/buttons/follow_button.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

bool _followed = false;

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double width = size.width;

    String currentUserName = 'Fenmo';
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                const HeadContainer(
                  angle: 1,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 80, left: width * 0.04, right: width * 0.04),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF02CBD2), Color(0xFF0086F6)],
                        transform: GradientRotation(1),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    height: 190,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              FollowButton(
                                followed: _followed,
                                onPressed: () {
                                  setState(() {
                                    _followed = !_followed;
                                  });
                                },
                              ),
                              const Expanded(child: SizedBox()),
                              IconButton(
                                  onPressed: () {
                                    print('share pressed');
                                  },
                                  icon: Icon(
                                    CupertinoIcons
                                        .arrowshape_turn_up_right_fill,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            currentUserName,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Expanded(
                            child: SizedBox(),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Videos',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      '0',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: SizedBox(),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Followers',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      // currentUser.userObject.followersCount
                                      //     .toString(),
                                      "1",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: SizedBox(),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Views',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      // currentUser.userObject.views.toString(),
                                      "3",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: CircleAvatar(
                    radius: 55,
                  ),
                ),
              ],
            ),
            Container(
              child: DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ClipRRect(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 6.0),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          child: const TabBar(
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.grey,
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                            tabs: [
                              Tab(text: 'playlists'),
                              Tab(text: 'reels'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                        height: 200,
                        child: TabBarView(children: [
                          Container(
                            child: Center(
                              child: Text('Display Tab 1',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Text('Display Tab 2',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ]))
                  ])),
            ),
          ],
        ),
      ),
    );
  }
}
