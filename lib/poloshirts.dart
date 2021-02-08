import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_demo/cloth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class PoloShirts extends StatefulWidget {
  PoloShirts({Key key}) : super(key: key);

  @override
  _PoloShirtsState createState() => _PoloShirtsState();
}

class _PoloShirtsState extends State<PoloShirts> {
  @override
  Widget build(BuildContext context) {
    Widget shirts(String image, String price) {
      return Container(
        width: 195,
        height: 285,
        child: Material(
          elevation: 4,
          child: Column(
            children: [
              Image.network(image, height: 242),
              Container(
                  height: 43,
                  color: Color(0xffF0EEEE),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text('Tzs '+price,
                            style: GoogleFonts.doHyeon(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(width: 5),
                      Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/fashion-demo-app.appspot.com/o/icons8-add-basket-24.png?alt=media&token=c9ce66a4-f4fa-40a7-9f88-17377479ba5f')
                    ],
                  )),
            ],
          ),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.black,
          title: Text('Polo Shirts',
              style: GoogleFonts.sourceSansPro(
                  fontSize: 16, fontWeight: FontWeight.bold)),
          actions: [
            Icon(Icons.shopping_basket_outlined),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text('0',
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ],
            )
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(20),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 5, left: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(FontAwesome.filter, color: Colors.black),
                    FlatButton(
                      color: Color(0xffEBE7D0),
                      child: Text('Sleeves',
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      onPressed: () {},
                    ),
                    FlatButton(
                      color: Color(0xffEBE7D0),
                      child: Text('Materials',
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      onPressed: () {},
                    ),
                    FlatButton(
                      color: Color(0xffEBE7D0),
                      child: Text('Price',
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('polo-shirts')
                    .snapshots(),
                builder: (context, snapshot) {
                  return Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Wrap(
                        children:
                            List.generate(snapshot.data.docs.length, (index) {
                      DocumentSnapshot book = snapshot.data.docs[index];
                      List imagelist = book['images'];

                      return Padding(
                        padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                        child: GestureDetector(
                            onTap: () {
                         

                              pushNewScreen(context,
                                  withNavBar: false,
                                  screen: Cloth(imagelist, book['price']));
                            },
                            child: shirts(imagelist[0], book['price'])),
                      );
                    })),
                  );
                },
              ),
            ],
          ),
        ));
  }
}

/* 
 */
