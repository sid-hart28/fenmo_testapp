import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:testapp/utils/buttons/icon_holder.dart';
import 'package:share_plus/share_plus.dart';
import 'package:testapp/utils/buttons/follow_button.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

List<String> mogiUrls = [
  "https://speed.mogiio.com/embed3/61a28ab552528064a9685c96",
  "https://speed.mogiio.com/embed3/61a28ab65252809ff3685c9a",
  "https://speed.mogiio.com/embed3/61a28ab6f830397e169a71a3",
  "https://speed.mogiio.com/embed3/61a28ab6525280f2c3685c9e",
  "https://speed.mogiio.com/embed3/61a28ca5f8303907839a7450"
];



List<Stack> bodyItems = [];

class _ExploreState extends State<Explore> {
  TextEditingController textcontroller = TextEditingController();
  late WebViewController controller;
  late String comment;
  bool _liked = false;
  bool _disliked = false;
  bool _saved = false;
  bool _followed = false;
  List<Column> list = [];


  Column commentLine(String comment) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 16,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'username ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: comment,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }


  Widget buildCommentSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.65,
      builder: (_, controller) => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            title: const Text(
              'Comments',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 60),
                child: Column(
                  children: list,
                ),
              ),
            ],
          ),
          bottomSheet: Container(
            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 6)]),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: textcontroller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Comment as user',
                    ),
                    onChanged: (value) {
                      setState(() {
                        comment = value;
                      });
                    },
                  ),
                ),
                SizedBox(width: 8),
                TextButton(
                    onPressed: () {
                      setState(() {
                        if (comment != '') {
                          list.add(commentLine(comment));
                          comment = '';
                          textcontroller.clear();
                          FocusScope.of(context).requestFocus(FocusNode());
                        }
                      });
                    },
                    child: Text('Post')),
              ],
            ),
          ),
        ),
      ),
    );
  }


  List<Stack> getBody() {
    for (int i = 0; i < 5; i++) {
      String html = """
<html>
<body style='margin:0;padding:0;'>
<iframe id="iFrame"    
   src="${mogiUrls[i]}" 
   style="width: 100%;height: 100%;margin: "0";" allow="accelerometer; autoplay; 
   encrypted-media;gyroscope; picture-in-picture" allowfullscreen>
</iframe>
</body>
</html>
  """;
      bodyItems.add( 
        Stack(
          children: [
            WebView(
              initialUrl:
                  Uri.dataFromString(html, mimeType: 'text/html').toString(),
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller) {
                this.controller = controller;
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          print('back button');
                          controller.evaluateJavascript("""
                                document.getElementById('iFrame').contentWindow.postMessage('playThis', '*')
                                """);
                        },
                        icon: Icon(
                          CupertinoIcons.chevron_left_circle_fill,
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      IconButton(
                          onPressed: () {
                            print('three dots clicked');

                            controller.evaluateJavascript(
                                "console.log(document.getElementById('iFrame'))");
                          },
                          icon: Icon(CupertinoIcons.ellipsis_vertical)),
                    ],
                  ),
                  Expanded(child: SizedBox()),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 350),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 15,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Creator Name',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                              SizedBox(width: 30),
                              FollowButton(
                                followed: _followed,
                                onPressed: () {
                                  setState(() {
                                    _followed
                                        ? _followed = false
                                        : _followed = true;
                                  });
                                },
                              ),
                            ],
                          ),
                          Text(
                            'The long video title ',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      Column(
                        children: [
                          IconHolder(
                            title: '10k',
                            icon: _liked
                                ? Icon(
                                    Icons.thumb_up_alt_rounded,
                                    color: Colors.blue,
                                  )
                                : Icon(
                                    Icons.thumb_up_off_alt,
                                    color: Colors.white,
                                  ),
                            onPressed: () {
                              setState(() {
                                if (_liked) {
                                  _liked = false;
                                } else {
                                  if (_disliked) {
                                    _disliked = false;
                                  }
                                  _liked = true;
                                }
                              });
                            },
                          ),
                          IconHolder(
                            title: '10k',
                            icon: _disliked
                                ? Icon(
                                    Icons.thumb_down_alt_rounded,
                                    color: Colors.red,
                                  )
                                : Icon(
                                    Icons.thumb_down_off_alt_rounded,
                                    color: Colors.white,
                                  ),
                            onPressed: () {
                              setState(() {
                                if (_disliked) {
                                  _disliked = false;
                                } else {
                                  if (_liked) {
                                    _liked = false;
                                  }
                                  _disliked = true;
                                }
                              });
                            },
                          ),
                          IconHolder(
                            title: '100',
                            icon: const Icon(
                              CupertinoIcons.chat_bubble_text_fill,
                              color: Colors.white,
                            ),
                            onPressed: () => showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) => buildCommentSheet(),
                            ),
                          ),
                          // _saved
                          //     ? IconHolder(
                          //         title: 'saved',
                          //         onPressed: () {
                          //           setState(() {
                          //             _saved = false;
                          //           });
                          //         },
                          //         icon: const Icon(
                          //           Icons.playlist_add_check,
                          //           color: Colors.blue,
                          //         ),
                          //       )
                          //     : IconHolder(
                          //         title: 'save',
                          //         icon: Icon(
                          //           Icons.playlist_add,
                          //           color: Colors.white,
                          //         ),
                          //         onPressed: () {
                          //           setState(() {
                          //             _saved = true;
                          //           });
                          //         },
                          //       ),
                          IconHolder(
                            title: 'share',
                            icon: Icon(
                              CupertinoIcons.arrowshape_turn_up_right_fill,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Share.share(
                                  "Follow this link:\n https://youtu.be/aTgcoHEkm_M",
                                  subject:
                                      'Lets see what creator doing on Fenmo App');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
    return bodyItems;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: getBody(),
        ),
      ),
    );
  }
}
