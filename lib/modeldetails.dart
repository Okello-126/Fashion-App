import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_demo/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';

class ModelDetails extends StatefulWidget {
  @override
  _ClothState createState() => _ClothState();
}

int _index = 0, _currentValue, quantity = 0;
String color, size;
bool _sizevisibility = false, _visibility = false;
OrderSize ordersize = OrderSize();
final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

List<String> imagelist = [
  'https://i.pinimg.com/236x/2d/4b/98/2d4b9816e546f61d2dc3bf7a75af7b01.jpg',
  'https://i.pinimg.com/236x/d5/b6/7d/d5b67d107ed50148cd38b91d478c0324.jpg',
  'https://i.pinimg.com/236x/58/8d/74/588d741dca391deb0f177f438bed03f6.jpg',
  'https://firebasestorage.googleapis.com/v0/b/fashion-demo-app.appspot.com/o/Screenshot%202020-12-09%20193940.png?alt=media&token=9ee59853-245c-46bd-88b1-379c517775ad'
];

class _ClothState extends State<ModelDetails> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          _index = 0;

          size = null;
          quantity = 0;
        });
        return true;
      },
      child: Scaffold(
        key: _scaffoldkey,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.black,
          actions: [
            Icon(Icons.bookmark_border),
            SizedBox(
              width: 15,
            ),
            Icon(Icons.share, size: 22),
            SizedBox(
              width: 15,
            )
          ],
        ),
        body: Container(
          height: 750,
          child: Stack(
            children: [
              Stack(
                children: [
                  Card(
                    child: Container(
                        padding: EdgeInsets.only(top: 60, bottom: 20),
                        height: 355,
                        width: 411,
                        child: Image.network(
                            _index == 0
                                ? imagelist[0]
                                : _index == 1
                                    ? imagelist[1]
                                    : _index == 2
                                        ? imagelist[2]
                                        : imagelist[3],
                            height: 400)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'chouyatou Men\'s Winter single collar coat with scarf'
                            .toUpperCase(),
                        style: GoogleFonts.sourceSansPro(
                            color: Color(0xff444242),
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  Positioned(
                    bottom: 5,
                    left: 7,
                    child: FlatButton(
                      color: Color(0xffE4E5E8),
                      onPressed: () {},
                      child: Text('Tzs 42,000'.toUpperCase(),
                          style: GoogleFonts.sourceSansPro(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
              Positioned(
                  bottom: 0,
                  child: Container(
                    width: 412,
                    child: Column(
                      children: [
                        Container(
                          width: 411,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Text('Color :',
                                        style: GoogleFonts.sourceSansPro(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 8, top: 5),
                                    child: Text(
                                        _index == 0
                                            ? 'Flap-khaki'
                                            : _index == 1
                                                ? 'Grey'
                                                : _index == 2
                                                    ? 'Flap-grey'
                                                    : 'Wine',
                                        style: GoogleFonts.dekko(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height: 80,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 4,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              _index = index;
                                            });
                                          },
                                          child: Card(
                                            elevation: _index == index ? 3 : 0,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              child: Image.network(index == 0
                                                  ? 'https://images-na.ssl-images-amazon.com/images/I/511KtBAysOL._SX38_SY50_CR,0,0,38,50_.jpg'
                                                  : index == 1
                                                      ? 'https://images-na.ssl-images-amazon.com/images/I/41UVTVlwQbL._SX38_SY50_CR,0,0,38,50_.jpg'
                                                      : index == 2
                                                          ? 'https://images-na.ssl-images-amazon.com/images/I/51Sh4P6iyBL._SX38_SY50_CR,0,0,38,50_.jpg'
                                                          : 'https://images-na.ssl-images-amazon.com/images/I/41mMYC3CbtL._SX38_SY50_CR,0,0,38,50_.jpg'),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, left: 8, right: 8),
                          child: Text(
                              'High quality wool blend fabric, suitable for casual daily wear or formal business wear. Single breasted closure, side waist zipper pockets and inner pockets, quilted print lined.',
                              style: GoogleFonts.ptSansNarrow(
                                fontSize: 17.5,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff444242),
                              )),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 2,
                          width: double.maxFinite,
                          color: Colors.black,
                        ),
                        Container(
                            width: 412,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _visibility = true;
                                      _sizevisibility = false;
                                    });
                                  },
                                  child: Text(
                                      size == null
                                          ? 'Size'
                                          : 'Size : ' + size + ' ',
                                      style: GoogleFonts.dekko(
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontWeight: FontWeight.normal)),
                                ),
                                Container(
                                  width: 2,
                                  height: double.maxFinite,
                                  color: Colors.black,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _visibility = false;
                                      _sizevisibility = true;
                                    });
                                  },
                                  child: Text(
                                      quantity == 0
                                          ? 'Quantity'
                                          : 'Quantity : ' + quantity.toString(),
                                      style: GoogleFonts.dekko(
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontWeight: FontWeight.normal)),
                                ),
                              ],
                            )),
                        Container(
                          height: 2,
                          width: double.maxFinite,
                          color: Colors.black,
                        ),
                        Container(
                          height: 73,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  FirebaseFirestore.instance
                                      .collection('orders')
                                      .doc('JLvX5PBy1OVyOculNK7P')
                                      .update({'quantity': quantity});

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      "Added to bag successfully",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.dekko(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: Colors.blue,
                                  ));
                                },
                                child: Container(
                                    width: 205,
                                    color: Color(0xffEBE7D0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.network(
                                            'https://firebasestorage.googleapis.com/v0/b/fashion-demo-app.appspot.com/o/icons8-add-basket-24.png?alt=media&token=c9ce66a4-f4fa-40a7-9f88-17377479ba5f',
                                            height: 32),
                                        Text('ADD TO BAG',
                                            style: GoogleFonts.sourceSansPro(
                                                color: Colors.black,
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    )),
                              ),
                              Container(
                                width: 2,
                                height: double.maxFinite,
                                color: Colors.black,
                              ),
                              Container(
                                width: 205,
                                color: Color(0xffB5A197),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.network(
                                        'https://firebasestorage.googleapis.com/v0/b/fashion-demo-app.appspot.com/o/icons8-buy-30.png?alt=media&token=2998d073-9c3c-49a0-a5e8-9464af4fc649',
                                        height: 32),
                                    Text('BUY NOW',
                                        style: GoogleFonts.sourceSansPro(
                                            color: Colors.black,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
              Visibility(
                  visible: _sizevisibility,
                  child: Center(
                    child: Card(
                      elevation: 100,
                      child: Container(
                          color: Colors.yellow,
                          width: 320,
                          height: 190,
                          child: Column(
                            children: [
                              Text('Select quantity',
                                  style: GoogleFonts.dekko(
                                      color: Colors.black87,
                                      fontSize: 22,
                                      fontWeight: FontWeight.normal)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  NumberPicker.integer(
                                      initialValue: 1,
                                      minValue: 1,
                                      maxValue: 20,
                                      textStyle: GoogleFonts.doHyeon(color:Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                      onChanged: (newValue) => setState(
                                          () => _currentValue = newValue)),
                                  FlatButton(
                                    color: Colors.blue,
                                    onPressed: () {},
                                    child: Text(_currentValue.toString(),
                                        style: GoogleFonts.doHyeon(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.normal)),
                                  ),
                                  FlatButton(
                                      color: Colors.black,
                                      onPressed: () {
                                        setState(() {
                                          quantity = _currentValue;
                                          _sizevisibility = false;
                                        });
                                      },
                                      child: Icon(Entypo.check,
                                          color: Colors.white))
                                ],
                              ),
                            ],
                          )),
                    ),
                  )),
              Visibility(
                  visible: _visibility,
                  child: Center(
                    child: Material(
                      elevation: 100,
                      child: Container(
                          color: Colors.yellow,
                          width: 300,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Select size',
                                  style: GoogleFonts.dekko(
                                      color: Colors.black87,
                                      fontSize: 22,
                                      fontWeight: FontWeight.normal)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  FlatButton(
                                    color: Colors.black,
                                    onPressed: () {
                                      setState(() {
                                        size = 'Small';
                                        _visibility = false;
                                      });
                                    },
                                    child: Text('S',
                                        style: GoogleFonts.dekko(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.normal)),
                                  ),
                                  FlatButton(
                                    color: Colors.black,
                                    onPressed: () {
                                      setState(() {
                                        size = 'Medium';
                                        _visibility = false;
                                      });
                                    },
                                    child: Text('M',
                                        style: GoogleFonts.dekko(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.normal)),
                                  ),
                                  FlatButton(
                                    color: Colors.black,
                                    onPressed: () {
                                      setState(() {
                                        size = 'Large';
                                        _visibility = false;
                                      });
                                    },
                                    child: Text('L',
                                        style: GoogleFonts.dekko(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.normal)),
                                  )
                                ],
                              ),
                            ],
                          )),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
