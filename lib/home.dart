import 'package:fashion_demo/categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Stack(
            children: [
              Image.network(
                  'https://i.pinimg.com/564x/6a/54/ca/6a54ca7cab309eec2c18684cb7a98a55.jpg',
                  height: 750,
                  width: 412,
                  fit: BoxFit.cover),
              Center(
                  child: Container(
                      width: 400,
                      height: 200,
                      color: Colors.white.withOpacity(0.5),
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 85),
                            child: Text('FashionStore',
                                style: GoogleFonts.pacifico(
                                    fontSize: 40, fontWeight: FontWeight.bold)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FlatButton(
                                //   color:Color(0xff710117),
                                color: Colors.black,
                                onPressed: () {},
                                child: Icon(FontAwesome.instagram,
                                    color: Colors.white),
                              ),
                              FlatButton(
                                //  color:Color(0xff710117),
                                color: Colors.black,
                                onPressed: () {},
                                child: Icon(FontAwesome.twitter,
                                    color: Colors.white),
                              ),
                              FlatButton(
                                // color:Color(0xff710117),
                                color: Colors.black,
                                onPressed: () {},
                                child: Icon(FontAwesome.mail_alt,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Align(
                            alignment: Alignment(0.95, 1),
                            child: FlatButton(
                                color: Color(0xff710117),
                                //   color: Colors.blue,
                                onPressed: () {
                                  pushNewScreen(context, screen: Categories());
                                },
                                child: Text('Get Started',
                                    style: GoogleFonts.satisfy(
                                        fontSize: 22,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))),
                          )
                        ],
                      )))
            ],
          ),
        ),
      ],
    );
  }
}
